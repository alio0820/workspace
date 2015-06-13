package com.chinasoft;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

public class ServerTest {

	private static Map<String,Socket> map = new HashMap<String,Socket>() ;	
	
	public static Map<String, Socket> getMap() {
		return map;
	}



	/**
	 * @param args
	 * @throws IOException 
	 * @throws IOException 
	 * @throws URISyntaxException 
	 */
	public static void main(String[] args) throws IOException{
		
		
		ServerSocket ss = new ServerSocket(9527);
		int i = 0;
		while(true){
			i ++;
			Socket s  = ss.accept();
			ServerThread st =  new ServerThread(s);
			Thread thread1 = new Thread(st);
			map.put("Client"+i, s);
			thread1.start();
		}
	}

}
