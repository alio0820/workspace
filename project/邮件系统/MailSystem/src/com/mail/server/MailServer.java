package com.mail.server;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

public class MailServer {
	
	private static int sessionNum;			//��������
	
//	public static Set<ObjectOutputStream> sets = new HashSet<ObjectOutputStream>();
//	public static HashMap<Integer,ObjectOutputStream> map = new HashMap<Integer, ObjectOutputStream>();
	
	public static int getSessionNum() {
		return sessionNum;
	}
	public static void setSessionNum(int sessionNum) {
		MailServer.sessionNum = sessionNum;
	}
	/**
	 * ��ȡ��־���ǰ׺
	 * @return Object
	 */
	public static Object getLogPrefix(){
		return "---"+new Timestamp(new Date().getTime());
	}
	public static void main(String[] args) throws IOException{
		
		ServerSocket server = null;
		try {
			server = new ServerSocket(9998);
			System.out.println(getLogPrefix()+" {Mail Server Start Succeed...}");
		} catch (IOException e) {
			System.out.println(getLogPrefix()+" {Mail Server Start failed...}");
		}
		
		while (true) {
			sessionNum++;
			Socket socket = null;
			try {
				socket = server.accept();
				System.out.println(getLogPrefix()+" {socket.hashCode="+socket.hashCode()+"}");
				System.out.println(getLogPrefix()+" {��"+sessionNum+"���û�����...}");
			} catch (Exception e) {
				sessionNum--;
				System.out.println(getLogPrefix()+" {��"+sessionNum+"���û������쳣...}");
			}
			ObjectOutputStream oos=new ObjectOutputStream(socket.getOutputStream());
//			new PCServerThread(socket,oos).start();
		}
		
	}
}

