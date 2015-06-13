package com.bestsoft.ssh.comm;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime {

	/** 缺省日期格式yyyy-MM-dd */
	public static final String DEFAULT_DATE_FORMAT = "yyyy-MM-dd";

	// 返回时间字符串(yyyy-MM-dd)
	public static String getStringDate() {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat(DateTime.DEFAULT_DATE_FORMAT);
		String dateString = formatter.format(currentTime);
		return dateString;
	}

	
}
