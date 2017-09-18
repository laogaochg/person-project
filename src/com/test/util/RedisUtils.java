package com.test.util;

import java.util.Date;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;

import org.apache.commons.lang.time.DateUtils;
import org.apache.commons.lang3.StringUtils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * laogaochg
 * 2017/8/30.
 * 设计模式(Design pattern): 将SETNX用于加锁(locking)
 * <p>
 * SETNX key value
 * 将key的值设为value，当且仅当key不存在。
 * 若给定的key已经存在，则SETNX不做任何动作。
 * SETNX是”SET if Not eXists”(如果不存在，则SET)的简写。
 * 返回值：
 * 设置成功，返回1。
 * 设置失败，返回0。
 * <p>
 * 首选setnx看能不能设置成功；失败就没有得到锁；成功就得到锁；
 * 失败的话进行重入检查或自己等待；
 * <p>
 * 处理死锁(deadlock)
 * <p>
 * 上面的锁算法有一个问题：如果因为客户端失败、崩溃或其他原因导致没有办法释放锁的话，怎么办？
 * 这种状况可以通过检测发现——因为上锁的key保存的是unix时间戳，假如key值的时间戳小于当前的时间戳，表示锁已经不再有效。
 * 但是，当有多个客户端同时检测一个锁是否过期并尝试释放它的时候，我们不能简单粗暴地删除死锁的key，再用SETNX上锁，因为这时竞争条件(race condition)已经形成了：
 * C1和C2读取lock.foo并检查时间戳，SETNX都返回0，因为它已经被C3锁上了，但C3在上锁之后就崩溃(crashed)了。
 * C1向lock.foo发送DEL命令。
 * C1向lock.foo发送SETNX并成功。
 * C2向lock.foo发送DEL命令。
 * C2向lock.foo发送SETNX并成功。
 * 出错：因为竞争条件的关系，C1和C2两个都获得了锁。
 * 幸好，以下算法可以避免以上问题。来看看我们聪明的C4客户端怎么办：
 * C4向lock.foo发送SETNX命令。
 * 因为崩溃掉的C3还锁着lock.foo，所以Redis向C4返回0。
 * C4向lock.foo发送GET命令，查看lock.foo的锁是否过期。如果不，则休眠(sleep)一段时间，并在之后重试。
 * 另一方面，如果lock.foo内的unix时间戳比当前时间戳老，C4执行以下命令：
 * GETSET lock.foo <current Unix timestamp + lock timeout + 1>
 * 因为GETSET的作用，C4可以检查看GETSET的返回值，确定lock.foo之前储存的旧值仍是那个过期时间戳，如果是的话，那么C4获得锁。
 * 如果其他客户端，比如C5，比C4更快地执行了GETSET操作并获得锁，那么C4的GETSET操作返回的就是一个未过期的时间戳(C5设置的时间戳)。C4只好从第一步开始重试。
 */
public class RedisUtils {
    private static final int TIME_OUT = 10;//redis锁失效时间
    public static Integer count = 0;
    public static Integer count1 = 0;
    public static AtomicInteger count2 = new AtomicInteger(0);
    public static JedisPool jedisPool = new JedisPool("127.0.0.1", 6379);

    public static void main(String[] args) throws Exception {
        int toCount = 1000;
//        String s = getSet("incr","0");
        CountDownLatch doneSignal = new CountDownLatch(toCount);
        for (int i = 0; i < toCount; i++) {
            new Thread(() -> {
                count1++;
                count2.incrementAndGet();
//                getRedisLock("block",null,null);
                getRedisLockS("block", null);
                count++;
                unLock("block");
                doneSignal.countDown();
            }).start();
        }
        doneSignal.await();
        System.out.println("完成所有线程。");
        System.out.println(count);
        System.out.println(count1);
        System.out.println(count2);
    }

    public static void unLock(String key) {
        //锁已经失效就抛出异常；自己判断有没有超出锁持有时间；
        System.out.println("删除锁之前");
        del(key);
        System.out.println("删除锁");
        //如果锁已经不存在；抛出异常；
    }

    public static void getRedisLockS(String key, Integer waitSecond) {
        Date now = new Date();
        Date endDate = null;
        if (waitSecond != null) {
            endDate = DateUtils.addSeconds(now, waitSecond);
        }
        for (; endDate == null || (endDate != null && new Date().after(endDate)); sleep()) {
            String o1 = get(key);
            //把里面的锁设置为处理的时间
            Long getLockResult = setnx(key, new Date().getTime() + "");
            if (1 == getLockResult) {
                System.out.println("成功得到锁");
                return;//成功就返回
            }
            String oldLock1 = get(key);
            if (StringUtils.isNotBlank(o1) && !o1.equals(oldLock1)) {
                System.out.println("getValue is Different. o1 " + o1 + " oldLock1: " + oldLock1);
            }
            if (!StringUtils.isNumeric(oldLock1)) {
                System.out.println("里面的锁是空的；但是还是没有得到锁！oldLock1:" + oldLock1);
                continue;
            }
            Long time;
            try {
                time = new Long(oldLock1);
            } catch (Exception e) {
                continue;
            }
            Date timeOut = new Date(time);
            //得到这个锁的失效时间；如果没有失效；
            timeOut = DateUtils.addSeconds(timeOut, TIME_OUT);//计算redis里面锁失效时间
            System.out.println("得到锁失败。里面锁失效的时间" + timeOut.toLocaleString());
            if (timeOut.after(now)) {
                //锁还在生效
                continue;
            } else {
                //锁已经过期 ， 执行getset操作 把锁里面的旧值设置为新的
                String oldLock2 = getSet(key, now.getTime() + "");//
                System.out.println("判断锁是否过期：==>锁已经过期" + oldLock1 + "--:--" + oldLock2);
                if (oldLock1.equals(oldLock2)) {
                    //如果返回来的旧值是自己的；那么就是这个操作是成功的；那么代表已经持有锁
                    System.out.println("返回来的旧值是自己的；这个操作成功的；已经持有锁");
                    return;
                } else {
                    //返回来的旧值不是自己的；代表已经被别人改了；那么自己再尝试得到锁
                    System.out.println("返回来的旧值不是自己的；代表已经被别人改了；那么自己再尝试得到锁.");
                    continue;
                }
            }
        }
    }

    private static void sleep() {
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            System.out.println("睡醒之后再进入循环");
        }
    }

    public static String getSet(String key, String value) {
        Jedis redis = jedisPool.getResource();
        String result = redis.getSet(key, value);
        redis.close();
        return result;
    }

    public static long setnx(String key, String value) {
        Jedis redis = jedisPool.getResource();
        long result = redis.setnx(key, value);
        redis.close();
        return result;
    }

    public static long del(String key) {
        Jedis redis = jedisPool.getResource();
        long result = redis.del(key);
        redis.close();
        return result;
    }

    public static String get(String key) {
        Jedis redis = jedisPool.getResource();
        String result = redis.get(key);
        redis.close();
        return result;
    }

    public static Long incr(String key) {
        Jedis redis = jedisPool.getResource();
        Long result = redis.incr(key);
        redis.close();
        return result;
    }

}
