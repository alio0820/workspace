package com.chinasoft;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

public class ClientTest {
	
	
	public static void main(String[] args) throws UnknownHostException, IOException {
		
		
		Socket s = new Socket("127.0.0.1",9527);
		ReadThread rt = new ReadThread(s);
		WriteThread wt = new WriteThread(s);
		Thread thread1 = new Thread(rt);
		Thread thread2 = new Thread(wt);
		thread1.start();
		thread2.start();
	}
}
