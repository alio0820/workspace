package com.web.office.common;

import java.sql.Timestamp;
import java.util.Date;

public class Common {
	/**
	 * ��ȡ��־���ǰ׺
	 * @return Object
	 */
	public static Object getLogPrefix(){
		return "---"+new Timestamp(new Date().getTime());
	}
}
