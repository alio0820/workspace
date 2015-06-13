package com.chinasoft;

import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.Map;
import java.util.Scanner;

public class WriteThread implements Runnable {

	private Socket s;
	
	
	
	public WriteThread(){}

	
	public WriteThread(Socket s){
		this.s = s;
	}
	@Override
	public void run() {
		boolean flag = true;
		while (flag) {			
			try {
				Scanner scanner = new Scanner(System.in);
				String str = scanner.nextLine();
				Socket s = null;
				String[] string = null;	
						
				if(this.s == null){
					string = str.split(":");	
					Map<String,Socket> map =  ServerTest.getMap();	
					for(int i=0;i<string.length - 1 ;i++){
						s = map.get(string[i]);
						send(string[string.length - 1],s);
					}
				
				}else{
					s = this.s; 
					send(str,s);
				}
			} catch (IOException e) {
				flag = false;
				
			}
		}

	}
	
	private void send(String str ,Socket s) throws IOException{
		OutputStream os;
		os = s.getOutputStream();
		OutputStreamWriter osw = new OutputStreamWriter(os);
		osw.write(str+"\n\t");
		osw.flush();
	}

}
