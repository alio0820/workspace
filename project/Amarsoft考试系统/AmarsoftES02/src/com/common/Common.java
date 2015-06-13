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
	 * ��ȡ��ǰʱ�䣨ȫ�ƣ�
	 * @return String
	 */
	public static String getTime(){
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(date);
	}
	/**
	 * ��̬����Id
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
	 * ��̬����Id
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
	 * ��ȡsession
	 * @return HttpSession
	 */
	public static HttpSession getSession(){
		WebContext webContext = WebContextFactory.get();
        return webContext.getSession();  
	}
	/**
	 * ��ȡrequest
	 * @return HttpServletRequest
	 */
	public static HttpServletRequest getRequest(){
		WebContext webContext = WebContextFactory.get();
		return webContext.getHttpServletRequest();
	}
	/**
	 * ��ȡresponse
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
