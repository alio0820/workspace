package com.init;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.*;

import com.common.ILog;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Log4jInit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init() {
		String rootPath = this.getServletContext().getRealPath("")+"/";
		String config = this.getInitParameter("initConfig");
		String logPath = this.getInitParameter("logPath");
		File configFile = new File(rootPath + config);
		if (configFile.exists()) {
			Properties prop = new Properties();
			try {
				prop.load(new FileInputStream(rootPath + config)); // 加载log4j.properties
				prop.setProperty("log4j.appender.file.File",
						rootPath + logPath + prop.getProperty("log4j.appender.file.File")); // 设置日志文件的输出路径
				PropertyConfigurator.configure(prop); // 加载配置项
				String root = this.getServletContext().getRealPath("");
				//replaceAll中接的第一个字符串会首先翻译为正则表达式，然后按照正则表达式的规则执行，
				//因此匹配\，需要四个\
				root = root.replaceAll(".*(\\\\|/)", "");
				ILog.init(root+"日志启动...");
			} catch (Exception e) {
				System.out.print("初始化log4j日志异常，请检查web.xml参数配置是否正常，异常发生在"
						+ this.getClass().getName()
						+ "类的public void init()方法，异常的原意是：" + e.getMessage());
			}
		}else{
			System.out.print("初始化log4j配置路径异常，请检查web.xml参数配置是否正常,异常路径为："+rootPath+config);
		}
	}
	public static void init4Test(){
		String filePath = "/Users/louis/workspace/workspace_own/Information/WebRoot/WEB-INF/log4j.properties";
		Properties prop = new Properties();
		try {
			prop.load(new FileInputStream(filePath)); // 加载log4j.properties
			prop.setProperty("log4j.appender.file.File","/Users/louis/workspace/workspace_own/Information/src/com/init/"
					+ prop.getProperty("log4j.appender.file.File")); // 设置日志文件的输出路径
			PropertyConfigurator.configure(prop); // 加载配置项
		}catch(Exception e){
			System.out.print("初始化log4j配置路径异常，请检查web.xml参数配置是否正常,异常路径为："+filePath);
		}
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}
}