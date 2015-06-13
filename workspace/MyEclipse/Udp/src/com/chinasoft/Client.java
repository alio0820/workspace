package com.chinasoft;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

public class Client {

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		byte[] buf = new byte[1000]; 
		DatagramSocket ds = new DatagramSocket(9999); 
		//开始监视9999端口
		DatagramPacket ip = new DatagramPacket(buf, buf.length); 
		//创建接收数据报的实例
		while (true){
			ds.receive(ip);
			//阻塞，直到收到数据报后将数据装入IP中
			System.out.println(new String(buf));
			}


	}

}
