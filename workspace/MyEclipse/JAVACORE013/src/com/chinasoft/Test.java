package com.chinasoft;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class Test {

	/**
	 * @param args
	 * @throws InterruptedException
	 */
	public static void main(String[] args) throws InterruptedException {

		ThreadPoolExecutor threadPool = new ThreadPoolExecutor(2, 4, 20000,
				TimeUnit.SECONDS, new ArrayBlockingQueue(3));
		threadPool.execute(new MyThread1());
		//ExecutorService pool = Executors.newCachedThreadPool();
		//pool.execute(new MyThread1());
		threadPool.shutdown();
	}

}
