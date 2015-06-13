package com.web.office.common;

import java.sql.Timestamp;
import java.util.Date;

public class Common {
	/**
	 * 获取日志输出前缀
	 * @return Object
	 */
	public static Object getLogPrefix(){
		return "---"+new Timestamp(new Date().getTime());
	}
}
