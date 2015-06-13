package com.zuxia.singleTon;

public class test {
	public static void main(String[] args){
		SingleTon s1 = SingleTon.getInstance();		//在使用的时候，才去创建instance变量,声明时只分配栈空间
		SingleTon s2 = SingleTon.getInstance();
		System.out.println(s1==s2);
	}
}
