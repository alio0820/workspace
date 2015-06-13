package com.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.NoticeBean;
import com.common.Common;
import com.common.DBConnection;
import com.common.MyLog;

public class NoticeAction {
	/**1
	 * 公告-发表公告
	 * @return String
	 * @throws SQLException 
	 */
	public static String publishNotice(String title,String appellation,String content,String department,String time,String inputUser){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		content = content.replaceAll("http://[a-z.:0-9]+/[0-9a-zA-Z_]+/ueditor/jsp/\\.\\./\\.\\./","");
		String sql = "insert into notice(noticeId,title,appellation,content,department,inputTime,inputUser,isInUse) values(?,?,?,?,?,?,?,1)";
		String serialNo = Common.getSerialNo(conn,"notice", "noticeId");
		if(Common.isBlank(time)) time = Common.getDate();
		boolean flag = DBConnection.executeSQL(conn, sql, serialNo ,title ,appellation,content,department,time,inputUser);
		try {
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
		}
		return flag+";"+serialNo;
	}
	/**2
	 * 公告-更新公告
	 * @return String
	 * @throws SQLException 
	 */
	public static String updateNotice(String noticeId,String title,String appellation,String content,String department,String time,String inputUser){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		content = content.replaceAll("http://[a-z.:0-9]+/[0-9a-zA-Z_]+/ueditor/jsp/\\.\\./\\.\\./","");
		String sql = "update notice set title=?,appellation=?,content=?,department=?,inputTime=? where noticeId=? and inputUser=?";
		if(Common.isBlank(time)) time = Common.getDate();
		boolean flag = DBConnection.executeSQL(conn, sql ,title ,appellation,content,department,time,noticeId,inputUser);
		try {
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
		}
		return flag+";"+noticeId;
	}
	
	/**3
	 * 公告-删除公告
	 * @return String
	 * @throws SQLException 
	 */
	public static String deleteNotice(String noticeId,String inputUser){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String sql = "delete from notice where inputUser=? and noticeId=?";
		boolean flag = DBConnection.executeSQL(conn, sql ,inputUser , noticeId);
		try {
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
		}
		return flag+";"+noticeId;
	}
	/**4
	 * 公告-获得所有的公告
	 * @return ArrayList<NoticeBean>
	 */
	public static ArrayList<NoticeBean> getAllNotices(){
		ArrayList<NoticeBean> list = new ArrayList<NoticeBean>();
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String sql = "select * from notice where isInUse=1 order by inputTime desc";
		ResultSet rs = DBConnection.executeQuery(conn, sql);
		try {
			while(rs.next()){
				NoticeBean noticeBean = new NoticeBean();
				noticeBean.setNoticeId(rs.getString("noticeId"));
				noticeBean.setSortNo(rs.getInt("sortNo"));
				noticeBean.setTitle(rs.getString("title"));
				noticeBean.setAppellation(rs.getString("appellation"));
				noticeBean.setContent(rs.getString("content"));
				noticeBean.setDepartment(rs.getString("department"));
				noticeBean.setInputTime(rs.getString("inputTime"));
				noticeBean.setInputUser(rs.getString("inputUser"));
				noticeBean.setUpdateTime(rs.getString("updateTime"));
				noticeBean.setIsInUse(rs.getInt("isInUse"));
				list.add(noticeBean);
			}
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"获取公告出错...");
		}
		return list;
	}
	
	/**5
	 * 公告-获得公告	取前几位
	 * @return ArrayList<NoticeBean>
	 */
	public static ArrayList<NoticeBean> getNoticesByFirst(int num){
		ArrayList<NoticeBean> list = new ArrayList<NoticeBean>();
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String sql = "select * from notice where isInUse=1 order by inputTime desc limit 0,"+(num<0?1:num);//db2--- fetch first 10 rows only
		ResultSet rs = DBConnection.executeQuery(conn, sql);
		try {
			while(rs.next()){
				NoticeBean noticeBean = new NoticeBean();
				noticeBean.setNoticeId(rs.getString("noticeId"));
				noticeBean.setSortNo(rs.getInt("sortNo"));
				noticeBean.setTitle(rs.getString("title"));
				noticeBean.setAppellation(rs.getString("appellation"));
				noticeBean.setContent(rs.getString("content"));
				noticeBean.setDepartment(rs.getString("department"));
				noticeBean.setInputTime(rs.getString("inputTime"));
				noticeBean.setInputUser(rs.getString("inputUser"));
				noticeBean.setUpdateTime(rs.getString("updateTime"));
				noticeBean.setIsInUse(rs.getInt("isInUse"));
				list.add(noticeBean);
			}
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"获取公告出错...");
		}
		return list;
	}
}
