package com.chinasoft;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;

public class MyServletContextAttributeListener implements
		ServletContextAttributeListener {

	public void attributeAdded(ServletContextAttributeEvent scab) {

		System.out.println("ServletContextAttribute�����");

	}

	public void attributeRemoved(ServletContextAttributeEvent scab) {
		System.out.println("ServletContextAttribute��ɾ��");

	}

	public void attributeReplaced(ServletContextAttributeEvent scab) {
		System.out.println("ServletContextAttribute���滻");

	}

}
