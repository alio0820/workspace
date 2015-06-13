package com.chinasoft;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class ReadThread implements Runnable {

	private Socket s;
	
	
	
	public ReadThread(Socket s) {
		super();
		this.s = s;
	}

	@Override
	public void run() {
		boolean flag = true;
		while (flag) {			
			try {
				InputStream is = s.getInputStream();
				InputStreamReader isr = new InputStreamReader(is);
				BufferedReader br = new BufferedReader(isr);
				String restr = br.readLine();
				System.out.println(restr);				
			} catch (IOException e) {	
				flag = false;
			
			}
		}

	}

}
