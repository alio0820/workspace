package com.zuxia.singleTon;

public class SingleTon {
	private static SingleTon instance= new SingleTon();
	private SingleTon(){
		System.out.println("������һ��SongleTon��");
	}
	public static SingleTon getInstance(){
		return instance;
	}
}
