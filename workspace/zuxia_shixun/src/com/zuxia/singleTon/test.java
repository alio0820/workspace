package com.zuxia.singleTon;

public class test {
	public static void main(String[] args){
		SingleTon s1 = SingleTon.getInstance();		//��ʹ�õ�ʱ�򣬲�ȥ����instance����,����ʱֻ����ջ�ռ�
		SingleTon s2 = SingleTon.getInstance();
		System.out.println(s1==s2);
	}
}
