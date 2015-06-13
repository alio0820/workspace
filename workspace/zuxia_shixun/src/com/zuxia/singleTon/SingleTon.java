package com.zuxia.singleTon;

public class SingleTon {
	private static SingleTon instance= new SingleTon();
	private SingleTon(){
		System.out.println("创建了一个SongleTon类");
	}
	public static SingleTon getInstance(){
		return instance;
	}
}
