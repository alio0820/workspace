package com.zuxia.Interface;

interface person {
	public static final int a = 10;
	public abstract void add();
}
public class student implements person{
	public void add(){
		System.out.println(a);
		System.out.println("�����ڵ���student�е�add����");
	}
	public static void main(String[] args){
		student stu = new student();
		stu.add();
	}
	
}
