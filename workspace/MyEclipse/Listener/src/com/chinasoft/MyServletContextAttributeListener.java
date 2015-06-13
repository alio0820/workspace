package com.chinasoft;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;

public class MyServletContextAttributeListener implements
		ServletContextAttributeListener {

	public void attributeAdded(ServletContextAttributeEvent scab) {

		System.out.println("ServletContextAttribute被添加");

	}

	public void attributeRemoved(ServletContextAttributeEvent scab) {
		System.out.println("ServletContextAttribute被删除");

	}

	public void attributeReplaced(ServletContextAttributeEvent scab) {
		System.out.println("ServletContextAttribute被替换");

	}

}
