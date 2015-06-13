package com.common;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Common {
	/**
	 * 获取日志输出前缀
	 * @return Object
	 */
	public static Object getLogPrefix(){
		return "---"+new Timestamp(new Date().getTime());
	}
	/**
	 * 获取当前日期
	 * @return String
	 */
	public static String getDate(){
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(date);
	}
	/**
	 * 动态生成Id
	 * @return String
	 */
	public static String getId(){
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");
		return df.format(date);
	}
	/**
	 * 获取当前是1.早餐2.中餐或者3.晚餐
	 * @return int
	 */
	public static int getWhichMeal(){
		Date date = new Date();
		if(date.getHours()<11 && date.getHours()>8) return 2;
		else return 3;
	}
}
