package com.chinasoft;

public class MyThread extends Thread {

	
	int i=0;
	
	
	@Override
	public void run() {
		for(;i<100;i++){
			System.out.println("非主线程"+i);
		}
	}
	
	
	
}
