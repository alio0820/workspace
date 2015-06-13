package com.chiansofti.a;

public class String1 {
	
	public static int totalNumber= 5 ;
	public   final int id;
	public String1(){
		id = ++totalNumber;
	}
	
	
	public  void doTest(){
		final Person p = new Person("zhouqi");
		final int j ;
		int k = 0;
		switch (k) {
		case 0:			
			j=3;	
			break;
		case 1:			
			j=4;
			break;
		default:
			j=5;
			break;
		}
		
	}

	

	
	
}
