package com.chinasoft;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class Server {
	
	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		InetAddress target = InetAddress.getByName("127.0.0.1");
		//得到目标机器的地址实例
		DatagramSocket ds = new DatagramSocket(9998);
		//从9998端口发送数据报
		String hello = "你好";
		//要发送的数据
		byte[] buf = hello.getBytes();
		//将数据转换成Byte类型
		DatagramPacket op = new DatagramPacket(buf, buf.length, target, 9999);
		//将BUF缓冲区中的数据打包
		ds.send(op);
		//发送数据
		ds.close();
		//关闭连接


	}

}
