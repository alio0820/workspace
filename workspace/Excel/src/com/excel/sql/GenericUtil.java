package com.excel.sql;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class GenericUtil {						//�������ɷ���
	public static String getPrimaryKey()
	{
		String primaryKey;
		primaryKey = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		Random r = new Random();
		primaryKey +=r.nextInt(100000)+100000;
		return primaryKey;
	}
}