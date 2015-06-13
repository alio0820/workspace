package com.common;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Common {
	/**
	 * ��ȡ��־���ǰ׺
	 * @return Object
	 */
	public static Object getLogPrefix(){
		return "---"+new Timestamp(new Date().getTime());
	}
	/**
	 * ��ȡ��ǰ����
	 * @return String
	 */
	public static String getDate(){
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(date);
	}
	/**
	 * ��̬����Id
	 * @return String
	 */
	public static String getId(){
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");
		return df.format(date);
	}
	/**
	 * ��ȡ��ǰ��1.���2.�вͻ���3.���
	 * @return int
	 */
	public static int getWhichMeal(){
		Date date = new Date();
		if(date.getHours()<11 && date.getHours()>8) return 2;
		else return 3;
	}
}
