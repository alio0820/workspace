package com.common;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Timestamp;
import java.util.Date;

import org.apache.log4j.Logger;
/**
 * author:翟灿东
 * 日期:2013-04-14
 * 修改日期:2013-07-21 2014-2-21 2014-3-6 2014-10-01
 * 该类完成对日志的常规操作
 */
public class ILog {
	private static Logger logger = Logger.getLogger(ILog.class.getName());
	/**
	 * 获取有关日志前缀
	 */
	public static String getPrefix(String tag){
		return tag+new Timestamp(new Date().getTime());
	}
	public static String getLogInitPrefix(){
		return getPrefix("[INIT]");
	}
	public static String getLogJspPrefix(){
		return getPrefix("[JSP]");
	}
	public static String getLogPrefix(){
		return getPrefix("[SQL]");
	}
	public static String getLogInfoPrefix(){
		return getPrefix("[INFO]");
	}
	public static String getSysLogInfoPrefix(){
		return getPrefix("[SYSTEM]");
	}
	public static String getLogErrorPrefix(){
		return getPrefix("[ERROR]");
	}
	public static String getLogDebugPrefix(){
		return getPrefix("[DEBUG]");
	}
	
	/**
	 * 输出日志(level)
	 */
	public static void logPrintByLever(String prefix,String message,int level){
		message = prefix + " {"+message+"}";
		switch(level){
			case 1:
				logger.info(message);break;
			case 2:
				logger.debug(message);break;
			case 3:
				logger.error(message);break;
		}
	}
	
	public static void debug(String message){
		logPrintByLever(getLogDebugPrefix(),message,2);
	}
	/**
	 * 输出日志(info)
	 */
	public static void logInfo(String message){
		logPrintByLever("", message, 1);
	}
	public static void logInfo(String prefix,String message){
		logPrintByLever(prefix,message,1);
	}
	/**
	 * 输出日志(error)
	 */
	public static void logError(String prefix,String message){
		logPrintByLever(prefix,message,3);
	}
	/**
	 * 获取sql有关日志
	 */
	public static void sql(String sql){
		logInfo(getLogPrefix(),sql);
	}
	/**
	 * 该方法废弃，不建议使用
	 * @deprecated
	 */
	public static void printSql(String sql){
		int index = sql.indexOf(":")+2;
		logInfo(getLogPrefix(),sql.substring(index));
	}
	/**
	 * 获取启动信息(init)有关日志
	 */
	public static void init(String initMsg){
		logInfo(getLogInitPrefix(),initMsg);
	}
	/**
	 * 获取页面浏览(jsp)有关日志
	 */
	public static void jspInfo(String jsp){
		logInfo(getLogJspPrefix(),jsp);
	}
	/**
	 * 获取通常信息(info)有关日志
	 */
	public static void info(String info){
		logInfo(getLogInfoPrefix(),info);
	}
	/**
	 * 获取系统信息(info)有关日志
	 */
	public static void sys(String sysInfo){
		logInfo(getSysLogInfoPrefix(),sysInfo);
	}
	/**
	 * 获取错误信息(error)有关日志
	 */
	public static void error(String error){
		logError(getLogErrorPrefix(),error);
	}
	/**
	 * 获取错误信息(error)有关日志
	 */
	public static void error(Exception e,String error){
		error(getExceptionMessage(e)+error);
	}
	
	public static void log(String tag,String e){
		logPrintByLever(getPrefix("["+tag+"]"),e,4);
	}
	/**
	 * 获取异常信息（Exception）
	 */
	public static String getExceptionMessage(Exception e){
		StringWriter sw = new StringWriter();  
        e.printStackTrace(new PrintWriter(sw, true));
        return sw.toString();
	}
}
