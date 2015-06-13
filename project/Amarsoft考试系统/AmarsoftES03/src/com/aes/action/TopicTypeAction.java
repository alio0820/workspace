package com.aes.action;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.aes.beans.TopicTypeBean;
import com.common.DBConnection;


public class TopicTypeAction {
	/**1
	 * 获取试题类型
	 * @return String
	 * @throws IOException 
	 */
	public static List getTopicType() throws IOException{
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql = "SELECT * FROM topic_type ORDER BY sortNo ASC, topicTypeId ASC";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				TopicTypeBean trb = new TopicTypeBean();
				trb.setTopicTypeId(rs.getString("topicTypeId"));
				trb.setTopicTypeName(rs.getString("topicTypeName"));
				trb.setSortNo(rs.getString("sortNo"));
				trb.setInputTime(rs.getString("inputTime"));
				trb.setIsInUse(rs.getInt("isInUse"));
				list.add(trb);
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			db.CloseDB();
		}
		return list;
	}
	/**
	 * 保存试题类型
	 * @param topicTypeId
	 * @return
	 */
	public String saveTopicType(String topicTypeId,String topicTypeName,String sortNo,String isInUse){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		try {
			String sql = "update topic_Type set topicTypeName=? ,sortNo=?,isInUse=? where topicTypeId=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, topicTypeName);
			ps.setString(2, sortNo);
			ps.setInt(3, isInUse.equals("1")?1:0);
			ps.setString(4, topicTypeId);
			ps.executeUpdate();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return "error";
		}finally{
			db.CloseDB();
		}
		return "success";
	}
	/**
	 * 删除试题类型
	 * @param topicRangeId
	 * @return
	 */
	public String delTopicType(String topicTypeId){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs =null;
		try {
			conn.setAutoCommit(false);
			String sql = "select topicTypeId from topic_Type where topicTypeId=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, topicTypeId);
			rs = ps.executeQuery();
			if(rs.next()){
				sql = "delete from topic_Type where topicTypeId=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, topicTypeId);
				ps.execute();
			}
			conn.commit();
			ps.close();
			rs.close();
			conn.setAutoCommit(true);
			conn.close();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			return "error";
		}finally{
			db.CloseDB();
		}
		return "success";
	}
}
