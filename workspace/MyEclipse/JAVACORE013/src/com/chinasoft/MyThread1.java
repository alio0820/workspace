package com.chinasoft;

public class MyThread1 implements Runnable {

	int i=0;
	@Override
	public void run(){	
		System.out.println("-----");
		//synchronized(this){
//			while(true){
//				try {
//					doTest();
//					Thread.sleep(1000);
//				} catch (InterruptedException e) {
//
//					e.printStackTrace();
//				}
//			}
		//}
		
	}

	private synchronized void doTest() throws InterruptedException{
		//wait(1000);
		
		if(i<1000){
			System.out.println(Thread.currentThread().getName() +i);
			i++;
		}else{
			throw	new RuntimeException();
		}
		
	}
	
}
