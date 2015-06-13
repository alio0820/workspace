package com.common;

public class Log {
	public static void printSql(String sql){
		int index = sql.indexOf(":")+1;
		System.out.println(Common.getLogPrefix()+"["+sql.substring(index)+"]");
	}
}
