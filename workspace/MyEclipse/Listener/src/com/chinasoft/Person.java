package com.chinasoft;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class Person implements HttpSessionBindingListener {

	public void valueBound(HttpSessionBindingEvent event) {
		System.out.println("Person�����뵽session��");

	}

	public void valueUnbound(HttpSessionBindingEvent event) {
		System.out.println("Person����session���Ƴ�");

	}

}
