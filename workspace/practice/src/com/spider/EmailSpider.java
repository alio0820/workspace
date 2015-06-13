package com.spider;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EmailSpider {

	/**
	 * 邮件蜘蛛
	 * @author cdzhai
	 * @time 2014-4-2 20:51:59
	 */
	public static void main(String[] args) {
		try {
			BufferedReader br = new BufferedReader(new FileReader(
					"D:\\workspace\\AmarsoftRD\\WebRoot\\technology_info.jsp"));
			String line ="";
			while((line=br.readLine())!=null){
				parse(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void parse(String line) {
		Pattern p = Pattern.compile("[\\w[.-]]+@[\\w[.-]]+\\.[\\w]+");
		Matcher m  = p.matcher(line);
		while(m.find()){
			System.out.println(m.group());
		}
		
	}

}
