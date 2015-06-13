package com.common;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Timestamp;
import java.util.Date;

import org.apache.log4j.Logger;
/**
 * author:翟灿东
 * 日期:2013-04-14
 * 修改日期:2013-07-21 2014-2-21 2014-3-6
 * 该类完成对日志的常规操作，待完成。。
 */
public class MyLog {
	private static Logger logger = Logger.getLogger(MyLog.class.getName());
	/**
	 * 获取有关日志前缀
	 */
	public static String getLogInitPrefix(){
		return "[INIT]"+new Timestamp(new Date().getTime());
	}
	public static String getLogJspPrefix(){
		return "[JSP]"+new Timestamp(new Date().getTime());
	}
	public static Object getLogPrefix(){
		return "[SQL]"+new Timestamp(new Date().getTime());
	}
	public static String getLogInfoPrefix(){
		return "[INFO]"+new Timestamp(new Date().getTime());
	}
	public static String getLogErrorPrefix(){
		return "[ERROR]"+new Timestamp(new Date().getTime());
	}
	/**
	 * 获取sql有关日志
	 */
	public static void getLogSql(String sql){
		String log =getLogPrefix()+" {"+sql+"}";
		logger.info(log);
	}
	/**
	 * 该方法废弃
	 */
	public static void printSql(String sql){
		int index = sql.indexOf(":")+2;
		String log = getLogPrefix()+"{"+sql.substring(index)+"}";
		logger.info(log);
	}
	/**
	 * 获取启动信息(init)有关日志
	 */
	public static void getLogInit(String init){
		String log = getLogInitPrefix()+" {"+init+"}";
		logger.info(log);
	}
	/**
	 * 获取页面浏览(jsp)有关日志
	 */
	public static void getLogJsp(String jsp){
		String log = getLogJspPrefix()+" {"+jsp+"}";
		logger.info(log);
	}
	/**
	 * 获取通常信息(info)有关日志
	 */
	public static void getLogInfo(String info){
		String log = getLogInfoPrefix()+" {"+info+"}";
		logger.info(log);
	}
	/**
	 * 获取错误信息(error)有关日志
	 */
	public static void getLogError(String error){
		String log = getLogErrorPrefix()+"{"+error+"}";
		logger.error(log);
	}
	/**
	 * 获取错误信息(error)有关日志
	 */
	public static void getLogError(Exception e,String error){
		StringWriter sw = new StringWriter();  
        e.printStackTrace(new PrintWriter(sw, true));
		getLogError(sw.toString()+error);
	}
}
