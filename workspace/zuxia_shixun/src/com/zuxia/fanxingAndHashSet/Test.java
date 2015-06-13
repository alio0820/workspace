package com.zuxia.fanxingAndHashSet;

import java.util.HashSet;

public class Test {

	/**
	 * @param args
	 */
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Person p  =new Person();
		p.setName(12);
		int i = (Integer)p.getName();
		System.out.println(i);
		
		HashSet<Person> persons  = new HashSet<Person>();
		Person p1 =new Person();
		p1.setName("liangcaowei");
		p1.setContent("yingdi");
		Person p2 =new Person();
		p2.setName("liangcaowei");
		p2.setContent("......");
		
		Person p3 =new Person();
		p3.setName("liangcaowei");
		p3.setContent("123");
		persons.add(p1);
		persons.add(p2);
		persons.remove(p3);
		System.out.println(persons.size());
	}

}
