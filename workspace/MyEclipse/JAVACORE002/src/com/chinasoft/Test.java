package com.chinasoft;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {		
		//Student student = new Student();
		//student.say();
	
		//System.out.println(student.getMoney());
		
		DisablePerson dp = new DisablePerson();
		Person p = new Person();
		dp.eat(p);
	}

}
