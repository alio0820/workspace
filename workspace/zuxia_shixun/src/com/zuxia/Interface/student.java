package com.zuxia.Interface;

interface person {
	public static final int a = 10;
	public abstract void add();
}
public class student implements person{
	public void add(){
		System.out.println(a);
		System.out.println("你正在调用student中的add方法");
	}
	public static void main(String[] args){
		student stu = new student();
		stu.add();
	}
	
}
