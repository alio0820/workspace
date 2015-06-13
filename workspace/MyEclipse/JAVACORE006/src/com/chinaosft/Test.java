package com.chinaosft;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class Test {

	/**
	 * @param args
	 * @throws IOException 
	 * @throws ClassNotFoundException 
	 * @throws CloneNotSupportedException 
	 */
	public static void main(String[] args) throws IOException, ClassNotFoundException, CloneNotSupportedException {
		Person p = new Person();
		Car car = new Car();
		car.setCarName("±¦Âí");
		p.setCar(car);
		p.setName("zhouqi");
		p.setAge(29);
	
////Ð´
//		FileOutputStream fos = new FileOutputStream("d:/copy.txt");
//		ObjectOutputStream oos = new ObjectOutputStream(fos);
//		oos.writeObject(p);
//		
////¶Á
//		FileInputStream fis = new FileInputStream("d:/copy.txt");
//		ObjectInputStream obj = new ObjectInputStream(fis);
//		Object o = obj.readObject();
//		Person p1 = (Person)o;
//		System.out.println(p);
//		System.out.println(p.getCar());
//		System.out.println(p1);
//		System.out.println(p1.getCar());
		
		Person p1 = (Person) p.clone();
		
		System.out.println(p);
		System.out.println(p.getCar());
		System.out.println(p1);
		System.out.println(p1.getCar());
	}

}
