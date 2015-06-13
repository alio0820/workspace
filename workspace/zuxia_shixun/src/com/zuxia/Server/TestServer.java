package com.zuxia.Server;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;

import com.zuxia.Server.beans.Message;

public class TestServer {

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		ServerSocket server = new ServerSocket(9999);
		Socket socket =server.accept();
		System.out.println("连接上了...");
//		PrintWriter pw = new PrintWriter(socket.getOutputStream());
//		pw.write("<html><h1>哇，有连接了....</h1></html>");
//		pw.flush();
//		pw.close();
		ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());
		Message msg = new Message();
		msg.setSender("服务器");
		msg.setSendTime(new Date());
		msg.setContent("恭喜你，连接成功...");
		oos.writeObject(msg);
		oos.close();
	}

}
