package com.chinasofti.client;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.chinasofti.ui.IUser;
public class Test {
	public static void main(String[] args)
	{
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IUser ui = (IUser)context.getBean("ui");
		ui.addUser();
	}

}
