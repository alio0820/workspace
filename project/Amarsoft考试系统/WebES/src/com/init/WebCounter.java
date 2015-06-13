package com.init;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import com.common.Common;
import com.common.DBConnection;
import com.common.ILog;

public class WebCounter {

	File  TempFile;			//存储计数器基数的问；初始值要从中取出，终值要存入！！！
	public WebCounter(){
		
	}
	public WebCounter(String contextPath){
		String numPath = contextPath+"/data/num.txt";
		File TempFile = new File(numPath);
		if(!TempFile.exists()){
			try {
				TempFile.createNewFile();
			} catch (IOException e) {
				ILog.error(e, "创建文件"+numPath+"失败");
			}
		}
		this.TempFile=TempFile;
	}
	public WebCounter(File  TempFile){
		this.TempFile=TempFile;
	}
	
//	public static void countUserNum(String visitNum){
//		if(!Common.isBlank(visitNum))
//			count = Integer.parseInt(count)+1+"";
//		application.setAttribute("webCounter",count);
//		WebCounter wc = getWebCounter();
//		wc.setNumber(Integer.parseInt(count));
//	}
	
	public  int  getOnlineNumberFromFile()  {		//服务器初始化时从文件中获取初始值
		 try {
			@SuppressWarnings("resource")
			BufferedReader br = new BufferedReader(new FileReader(TempFile));
			String line=br.readLine(); 
			if(line==null||line.equals(""))
				return  0;
			else
				return  Integer.parseInt(line);
		} catch (Exception e) {
			ILog.error(e,"读取文件<"+TempFile+">内容出错...");
			return 0;
		}
	}
	
	public  void  setOnlineNumberToFile(int  num){	//服务器关闭时把当前计数器的值放入文件中存储
	      try {   
	            FileWriter fw=new FileWriter(TempFile,false);
	            PrintWriter pw=new PrintWriter(fw);
	            pw.print(num);
	            pw.close();     
	            fw.close();
	        } catch (IOException e) {   
	        	ILog.error(e,"写入文件<"+TempFile+">出错...");
	        } 
	}
	
	/**
	 * 添加用户访问记录
	 * @param userName
	 * @param ip
	 * @param loginTime
	 * @return
	 */
	public static String addVisitor(String userName,String ip,String loginTime){
		Connection conn = DBConnection.getConnection();
		String sql = "insert into visit(visitId,userName,ip,loginTime) values(?,?,?,?)";
		String visitId = Common.getSerialNo(conn,"visit", "visitId");
		if(Common.isBlank(loginTime)) loginTime = Common.getTime();
		boolean flag = DBConnection.executeSQL(conn, sql, visitId ,userName ,ip,loginTime);
		try {
			conn.close();
		} catch (SQLException e) {
			ILog.error(e,"关闭连接出错...");
		}
		return flag+";"+visitId;
	}
	
	/**
	 * 更新用户访问记录
	 * @param visitId
	 * @param exitTime
	 * @param visitPage
	 * @return
	 */
	public static String updateVisitor(String visitId, String exitTime, String visitPage){
		Connection conn = DBConnection.getConnection();
		String sql = "update visit set exitTime=?,visitPage=? where visitId=?";
		boolean flag = DBConnection.executeSQL(conn, sql, visitId ,exitTime ,visitId);
		try {
			conn.close();
		} catch (SQLException e) {
			ILog.error(e,"关闭连接出错...");
		}
		return flag+";"+visitId;
	}
	
	public static void main(String[] args) {
		WebCounter  wc=new WebCounter(new File("d:/num.txt"));
		wc.setOnlineNumberToFile(100);
		//System.out.print(wc.getInitNumber());

	}
}
