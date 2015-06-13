package com.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Log4jInit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(Log4jInit.class);

	public void init() {
		String path = this.getServletContext().getRealPath("/");
		String file = this.getInitParameter("initPath");
		String logFile = this.getInitParameter("filePath");
		if (file != null) {
			Properties prop = new Properties();
			try {
				prop.load(new FileInputStream(path + file)); // 加载log4j.properties
				prop.setProperty("log4j.appender.file.File",
						path + logFile + prop.getProperty("log4j.appender.file.File")); // 设置日志文件的输出路径
				PropertyConfigurator.configure(prop); // 加载配置项
				String root = this.getServletContext().getRealPath("");
				//replaceAll中接的第一个字符串会首先翻译为正则表达式，然后按照正则表达式的规则执行，
				//因此匹配\，需要四个\
				root = root.replaceAll(".*(\\\\|/)", "");
				MyLog.getLogInit(root+"日志启动...");
			} catch (Exception e) {
				MyLog.getLogError("初始化log4j日志输入路径异常，请检查web.xml参数配置是否正常，异常发生在"
						+ this.getClass().getName()
						+ "类的public void init()方法，异常的原意是：" + e.getMessage());
			}
		}
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}