package com.chinasoft;

public class Client {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		
		Subject Sub1 = new Subject("天气预报");
		Subject Sub2 = new Subject("股市信息");
		
		
		
		new Observer("zhangsan",Sub1,Sub2);
		new Observer("lisi",Sub1);
		
		
		
		
		
		Sub1.setStatus("今天降温10°");
		
		Sub2.setStatus("今天暴涨1000点");
	}

}
