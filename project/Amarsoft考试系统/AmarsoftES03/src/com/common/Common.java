package com.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uk.ltd.getahead.dwr.WebContext;
import uk.ltd.getahead.dwr.WebContextFactory;

@SuppressWarnings("deprecation")
public class Common {
	/**
	 * 获取日志输出前缀
	 * @return Object
	 */
	public static Object getLogPrefix(){
		return "[SQL]"+new Timestamp(new Date().getTime());
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
	 * 获取当前时间（全称）
	 * @return String
	 */
	public static String getTime(){
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(date);
	}
	/**
	 * 动态生成Id
	 * @return String
	 */
	public static String getId(String table,String column){
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		String today = df.format(date);
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String id = null;
		String sql = "select max("+column+") as id from "+table+" where "+column+" like '"+today+"%'";
		System.out.println(getLogPrefix()+"["+sql+"]");
		try {
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				id = rs.getString("id");
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			db.CloseDB();
		}
		if(id==null) id = today+ "00000001";
		else {
			id = "1"+id.substring(8);
			int temp = Integer.parseInt(id);
			temp+=1;
			id = today+ (temp+"").substring(1);
		}
		return id;
	}
	/**
	 * 动态生成Id
	 * @return String
	 */
	public static String getRangeId(boolean sign,String parentId){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String id = null;
		String sql="";
		if(sign)
			sql = "select max(topicRangeId) as id from topic_range where topicRangeId=parentId";
		else
			sql = "select max(topicRangeId) as id from topic_range where topicRangeId <> parentId and parentId='"+parentId+"'";
		System.out.println(sql);
		try {
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				id = rs.getString("id");
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			db.CloseDB();
		}
		if(sign){
			if(id==null) id = "0010";
		}
		else{
			if(id==null) id = parentId+"01";
		}
		id = "1"+id;
		int temp = Integer.parseInt(id);
		temp+=sign?10:1;
		id = (temp+"").substring(1);
		return id;
	}
	/**
	 * 获取session
	 * @return HttpSession
	 */
	public static HttpSession getSession(){
		WebContext webContext = WebContextFactory.get();
        return webContext.getSession();  
	}
	/**
	 * 获取request
	 * @return HttpServletRequest
	 */
	public static HttpServletRequest getRequest(){
		WebContext webContext = WebContextFactory.get();
		return webContext.getHttpServletRequest();
	}
	/**
	 * 获取response
	 * @return HttpServletResponse
	 */
	public static HttpServletResponse getResponse(){
		WebContext webContext = WebContextFactory.get();
		return webContext.getHttpServletResponse();
	}
	
	public static void main(String[] args){
		System.out.println(Common.getTime());
	}
}
