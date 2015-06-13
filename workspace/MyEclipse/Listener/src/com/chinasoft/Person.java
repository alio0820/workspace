package com.chinasoft;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class Person implements HttpSessionBindingListener {

	public void valueBound(HttpSessionBindingEvent event) {
		System.out.println("Person被加入到session中");

	}

	public void valueUnbound(HttpSessionBindingEvent event) {
		System.out.println("Person被从session中移除");

	}

}
