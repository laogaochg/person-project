package com.csair.admin.threadTest;

public class DeadLockTest {
    public static void main(String[] args) throws Exception {

        Object user = new Object();
        Object vo = new Object();

        new Thread(() -> {
            try {
                doLock2(user,vo);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();
        doLock(user,vo);
    }

    private static void doLock(Object u, Object v) throws InterruptedException {
        System.out.println("请求user");
        synchronized (u) {
            System.out.println("锁定user，进行睡眠。");
            Thread.sleep(5000);
            System.out.println("睡睡眠结束，请求vo");
            synchronized (v) {
                System.out.println("锁定vo，进行睡眠。");
                Thread.sleep(5000);
            }
            System.out.println("释放vo，退出睡眠。");
        }
        System.out.println("释放user。");

    }

    private static void doLock2(Object u, Object v) throws InterruptedException {
        System.out.println("请求vo");
        synchronized (v) {
            System.out.println("锁定vo，进行睡眠。");
            Thread.sleep(1000);
            System.out.println("退出睡眠。");
            System.out.println("请求user");
            synchronized (u) {
                System.out.println("锁定user，进行睡眠。");
                Thread.sleep(5000);
            }
        }
        System.out.println("释放vo，");
    }

    /**
     * 比较接口；comparable
     */
//    private static void collectionNine() {
//        TreeSet<Login> set = new TreeSet<>((o1, o2) -> (int) (o1.getId() - o2.getId()));
//        set.add(new Login("Agamemnon", 300));
//        set.add(new Login("Cato", 400));
//        set.add(new Login("Plato", 100));
//        set.add(new Login("Zeno", 200));
//        set.add(new Login("Archimedes", 500));
//        Iterable<Login> logins = () -> null;
//        for (Login tag : set) {
//            System.out.println(tag);
//        }
//    }

    /**
     * 多线程查询
     */
//    public static void threadQuery() throws ExecutionException, InterruptedException {
//        ThreadPoolExecutor queryPool = (ThreadPoolExecutor) Executors.newFixedThreadPool(10);
//        List<Future<Login>> callableFuture = new ArrayList<>();
//        Future<Login> login = new FutureTask<Login>(new QueryTestDataCallable());
//        Login login1 = login.get();
//        for (int i = 0; i < 200; i++) {
//            Callable<Login> callableList = new QueryTestDataCallable();
//            callableFuture.add(queryPool.submit(callableList));
//        }
//        for (Future<Login> f : callableFuture) {
//            Login path = f.get();
//            System.out.println(path);
//        }
//        queryPool.shutdown();
//    }
}
