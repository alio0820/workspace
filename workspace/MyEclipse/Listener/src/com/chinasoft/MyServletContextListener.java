package com.chinasoft;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyServletContextListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("ServletContext被卸载");

	}

	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("ServletContext被初始化");

	}

}
