package com.zuxia.io;

import java.io.FileInputStream;
import java.io.FileOutputStream;

public class MyIo {
	public static void main(String[] args){
		FileInputStream fis;
		FileOutputStream fos;
		System.out.println("��ʼ��ȡ�ļ�");
		try{
			fis =new FileInputStream("E:/������.doc");
			fos =new FileOutputStream("d:/������.doc",true);		//���Զ�ȡ�򵥵��ļ�
			int data = fis.read();
			while(data!=-1){
				fos.write(data);
				data=fis.read();
			}
			fis.close();
			fos.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("�ļ�д�����");
	}
}

