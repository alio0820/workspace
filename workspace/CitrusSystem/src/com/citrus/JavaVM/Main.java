package com.citrus.JavaVM;
public class Main {

//	private static final Runnable SystemInformation = null;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SystemInformation osInfo=new SystemInformation();
		Thread myThread=new Thread(osInfo);
		myThread.run();
	}
}
