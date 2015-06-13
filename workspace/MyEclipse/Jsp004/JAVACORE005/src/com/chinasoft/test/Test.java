package com.chinasoft.test;

import com.chinasoft.template.IWork;
import com.chinasoft.template.StudentA;

public class Test {

	public void work(IWork s){
		s.doTest();
	}
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		
		
		
		IWork t = new StudentA();

		
		Test test = new Test();
		test.work(t);


	}

}
