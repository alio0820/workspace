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
		//��ʼ����9999�˿�
		DatagramPacket ip = new DatagramPacket(buf, buf.length); 
		//�����������ݱ���ʵ��
		while (true){
			ds.receive(ip);
			//������ֱ���յ����ݱ�������װ��IP��
			System.out.println(new String(buf));
			}


	}

}
