package com.chinasoft;

public class Client {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		
		Subject Sub1 = new Subject("����Ԥ��");
		Subject Sub2 = new Subject("������Ϣ");
		
		
		
		new Observer("zhangsan",Sub1,Sub2);
		new Observer("lisi",Sub1);
		
		
		
		
		
		Sub1.setStatus("���콵��10��");
		
		Sub2.setStatus("���챩��1000��");
	}

}
