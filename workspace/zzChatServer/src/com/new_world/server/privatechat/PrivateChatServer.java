package com.new_world.server.privatechat;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

public class PrivateChatServer {
	public static int clientNum;
		public static Set<ObjectOutputStream> sets = new HashSet<ObjectOutputStream>();
		public static HashMap<Integer,ObjectOutputStream> map = new HashMap<Integer, ObjectOutputStream>();
		public static void main(String[] args) throws IOException{
			
			ServerSocket server = null;
			try {
				server = new ServerSocket(9999);
				System.out.println("服务器启动...");
			} catch (IOException e) {
				System.out.println("服务器启动失败...");
			}
			
			while (true) {
				clientNum++;
				Socket socket = null;
				try {
					socket = server.accept();
					System.out.println("socket.hashCode="+socket.hashCode());
					System.out.println("第"+clientNum+"台客户端连接上服务器...");	
				} catch (Exception e) {
					clientNum--;
					System.out.println("第"+clientNum+"台客户端未能连接上服务器...");	
				}
				ObjectOutputStream oos=new ObjectOutputStream(socket.getOutputStream());
//				sets.add(oos);
				new PCServerThread(socket,oos).start();
			}
			
		}
	}

