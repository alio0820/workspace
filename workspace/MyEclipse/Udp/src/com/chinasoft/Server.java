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
		//�õ�Ŀ������ĵ�ַʵ��
		DatagramSocket ds = new DatagramSocket(9998);
		//��9998�˿ڷ������ݱ�
		String hello = "���";
		//Ҫ���͵�����
		byte[] buf = hello.getBytes();
		//������ת����Byte����
		DatagramPacket op = new DatagramPacket(buf, buf.length, target, 9999);
		//��BUF�������е����ݴ��
		ds.send(op);
		//��������
		ds.close();
		//�ر�����


	}

}
