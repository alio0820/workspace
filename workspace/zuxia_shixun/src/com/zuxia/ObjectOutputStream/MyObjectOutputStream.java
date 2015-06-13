package com.zuxia.ObjectOutputStream;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

public class MyObjectOutputStream {
	public static void main(String[] args) throws Exception{
		ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("d:zhai.txt"));
		ArrayList<User> list1 = new ArrayList<User>();
		User u1 = new User();
		User u2 = new User();
		u1.setName("zhai");
		u1.setPwd("123456789");
		u2.setName("li");
		u2.setPwd("123");
		list1.add(u1);
		list1.add(u2);
		oos.writeObject(list1);
		oos.flush();
		oos.close();
		ObjectInputStream ois = new ObjectInputStream(new FileInputStream("d:zhai.txt"));
		ArrayList<User> list = (ArrayList<User>)ois.readObject();
		User u = list.get(1);
		System.out.println(u.getName());
		System.out.println(u.getPwd());
		ois.close();
	}
}
