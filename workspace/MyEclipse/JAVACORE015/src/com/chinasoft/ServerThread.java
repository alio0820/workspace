package com.chinasoft;

import java.net.Socket;

public class ServerThread implements Runnable {

	private Socket s;

	public ServerThread(Socket s) {
		this.s = s;
	}

	@Override
	public void run() {
		ReadThread rt = new ReadThread(s);
		WriteThread wt = new WriteThread();
		Thread thread1 = new Thread(rt);
		Thread thread2 = new Thread(wt);
		thread1.start();
		thread2.start();
	}

}
