package com.zuxia.Server;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.zuxia.Server.beans.Message;


public class TestClient {


	public static void main(String[] args) throws Exception{
		Socket socket =new Socket("169.254.67.144",9999);
//		Date date = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");			//设定日期格式
//		String d = sdf.format(date);
//		System.out.println(d);
		ObjectInputStream ois =new ObjectInputStream(socket.getInputStream());
		Message msg  = (Message)ois.readObject();
		System.out.println(msg);
		ois.close();
	}

}
