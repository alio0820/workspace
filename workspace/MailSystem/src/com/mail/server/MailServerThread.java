package com.mail.server;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

public class MailServerThread extends Thread{
	private ObjectInputStream ois;
	private ObjectOutputStream oos;
	public MailServerThread(Socket socket,ObjectOutputStream oos) {
		try {
			this.ois = new ObjectInputStream(socket.getInputStream());
			this.oos=oos;
		} catch (IOException e) {
			System.out.println(MailServer.getLogPrefix()+" {����������ʧ��...}");
		}
	}
	/**
	 * �����û�����
	 */
	public void run(){
		
	}
}
