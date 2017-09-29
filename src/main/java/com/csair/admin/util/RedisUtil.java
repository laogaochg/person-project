//package com.csair.admin.util;
//
//import com.bjucloud.redis.client.RedisAccessException;
//import com.bjucloud.redis.client.RedisTemplate;
//import org.apache.commons.lang.time.DateUtils;
//import org.apache.commons.lang3.StringUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Component;
//
//import javax.annotation.PostConstruct;
//import javax.annotation.Resource;
//import java.util.Date;
//import java.util.concurrent.ConcurrentHashMap;
//import java.util.concurrent.ConcurrentMap;
//
///**
// * laogaochg
// * 2017/8/26.
// * redis工具类
// */
//@Component
//public class RedisUtil {
//    private static final Logger logger = LoggerFactory.getLogger(RedisUtil.class);
//    private static ConcurrentMap<String, Date> lockMap = new ConcurrentHashMap<>();
//    @Resource(name = "bjuRedisTemplate")
//    private RedisTemplate redisTemplate;
//    private static RedisUtil instance;
//
//    @PostConstruct
//    public void init() {
//        instance = this;
//        instance.redisTemplate = this.redisTemplate;
//    }
//
//    /**
//     * 解锁
//     */
//    public static void unLock(String key) {
//        //锁已经失效就抛出异常；自己判断有没有超出锁持有时间；
//        //如果锁已经不存在；抛出异常；用于事务回滚
//        del(key);
//    }
//
//    /**
//     * 每50毫秒尝试得到锁
//     *
//     * @param waitSecond 等待的秒数，超过则不再尝试得到锁
//     *                   redis锁有效时间：1秒
//     *                   每隔50毫秒尝试一次得到锁
//     */
//    public static void getRedisLockS(String key, Integer waitSecond) {
//        getRedisLockS(key, waitSecond, null, null);
//    }
//
//    /**
//     * 每50毫秒尝试得到锁
//     *
//     * @param waitSecond     等待的秒数，超过则不再尝试得到锁;NULL则一直尝试得到锁
//     * @param lockExpiryDate redis锁有效时：NULL为1秒
//     * @param millis         每隔多少毫秒尝试一次得到锁：NULL为50毫秒
//     */
//    public static void getRedisLockS(String key, Integer waitSecond, Integer lockExpiryDate, Long millis) {
//        if (lockExpiryDate == null) lockExpiryDate = 1;
//        if (millis == null) millis = 50L;
//        Date now = new Date();
//        Date endDate = null;
//        if (waitSecond != null) endDate = DateUtils.addSeconds(now, waitSecond);
//        try {
//            for (; endDate == null || (endDate != null && new Date().before(endDate)); sleep(millis)) {
//                //把里面的锁设置为处理的时间
//                Long getLockResult = instance.redisTemplate.setnx(key, new Date().getTime() + "");
//                if (1 == getLockResult) {
//                    System.out.println("成功得到锁");
//                    return;//成功得到锁
//                }
//                System.out.println("得到锁失败  key:" + key);
//                String oldLock1 = instance.redisTemplate.get(key);
//                if (!StringUtils.isNumeric(oldLock1)) {
//                    continue;//里面的锁是空的；但是还是没有得到锁！
//                }
//                Date timeOut;
//                try {
//                    timeOut = new Date(new Long(oldLock1));
//                } catch (NumberFormatException e) {
//                    continue;
//                }
//                //计算redis里面锁失效时间
//                timeOut = DateUtils.addSeconds(timeOut, lockExpiryDate);
//                if (timeOut.after(now)) {
//                    continue; //锁还在生效
//                } else {
//                    //锁已经过期 ， 执行getset操作 把锁里面的旧值设置为新的
//                    String oldLock2 = instance.redisTemplate.getSet(key, now.getTime() + "");
//                    if (oldLock1.equals(oldLock2)) {
//                        return;//如果返回来的旧值是自己的；那么就是这个操作是成功的；那么代表已经持有锁
//                    } else {
//                        continue;//返回来的旧值不是自己的；代表已经被别人改了；那么自己再尝试得到锁
//                    }
//                }
//            }
//            System.out.println("------------一直没有得到锁！-------------");
//        } catch (RedisAccessException e) {
//            logger.error("com.nanhang.mall.common.RedisUtil.getRedisLockS::error", e);
//        }
//    }
//
//    private static void sleep(long millis) {
//        try {
//            Thread.sleep(millis);//睡millis毫秒就再起来尝试得到锁
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//            logger.error("com.nanhang.mall.common.RedisUtil.sleep::error", e);
//        }
//    }
//
//    /**
//     * 从redis里面取值
//     */
//    public static String get(String key) {
//        try {
//            if (StringUtils.isNotBlank(key)) return instance.redisTemplate.get(key);
//        } catch (RedisAccessException e) {
//            logger.error("com.nanhang.mall.common.RedisUtil.get::error", e);
//        }
//        return null;
//    }
//
//    /**
//     * 把值放到redis里面
//     */
//    public static String set(String key, String value) {
//        try {
//            if (StringUtils.isNotBlank(key) && StringUtils.isNotBlank(key)) {
//                return instance.redisTemplate.set(key, value);
//            }
//        } catch (RedisAccessException e) {
//            logger.error("com.nanhang.mall.common.RedisUtil.set::error", e);
//        }
//        return null;
//    }
//
//    /**
//     * 删除redis里面的指定值
//     *
//     * @param key
//     * @return 被移除key的数量。
//     */
//    public static Long del(String key) {
//        try {
//            if (StringUtils.isNotBlank(key)) return instance.redisTemplate.del(key);
//        } catch (RedisAccessException e) {
//            logger.error("com.nanhang.mall.common.RedisUtil.del::error", e);
//        }
//        return null;
//    }
//}
