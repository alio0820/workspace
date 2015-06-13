package com.chinasoft;

public class Student {
	
	private int money;
	private boolean flag;
	private byte b;
	private short s;
	private char c = '\u0000';
	private long l;
	private float f;
	private double d;
	private String ss;
	private int[] ii;
	
	
	public int getMoney() {		
		return (int)(money * 0.8);
	}





	public void say(){
		String  name = "zhouqi";
		System.out.println(name);
		System.out.println(flag);
		System.out.println(b);
		System.out.println(s);
		System.out.println(c);
		System.out.println(l);
		System.out.println(f);
		System.out.println(d);
		System.out.println(ss);
		System.out.println(ii);
		String str = "zhouqi";
		int j = 3;
		if(str.equals(name)){
			System.out.println("ПаµИ");
		}
		
	}
	

}
