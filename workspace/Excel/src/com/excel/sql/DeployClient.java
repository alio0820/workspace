package com.excel.sql;

public class DeployClient {   
	    public static void main(String[] args) {   
	        DeployData deployData = new DeployData();   
	        deployData.excute("C:\\4.xls");
	        System.out.println("excel数据导入数据库成功！");
	    }   
	}
