package com.zuxia.io;

import java.io.FileInputStream;
import java.io.FileOutputStream;

public class MyIo {
	public static void main(String[] args){
		FileInputStream fis;
		FileOutputStream fos;
		System.out.println("开始读取文件");
		try{
			fis =new FileInputStream("E:/张砚樵.doc");
			fos =new FileOutputStream("d:/张砚樵.doc",true);		//可以读取简单的文件
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
		System.out.println("文件写入结束");
	}
}

