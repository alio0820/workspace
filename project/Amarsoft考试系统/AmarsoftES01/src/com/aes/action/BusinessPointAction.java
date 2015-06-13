package com.aes.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.aes.beans.TopicRangeBean;
import com.common.Common;
import com.common.DBConnection;
import com.sun.crypto.provider.RSACipher;

public class BusinessPointAction {
	/**1
	 * 获取试题考点大类
	 * @return String
	 * @throws IOException 
	 */
	public static List getTopicRangeCatalog() throws IOException{
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql = "select * from topic_range where topicRangeId =parentId ORDER BY parentId ASC,sortNo asc";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				TopicRangeBean trb = new TopicRangeBean();
				trb.setTopicRangeId(rs.getString("topicRangeId"));
				trb.setTopicRangeName(rs.getString("topicRangeName"));
				trb.setParentId(rs.getString("parentId"));
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
	/**2
	 * 获取试题考点小类
	 * @return String
	 * @throws IOException 
	 */
	public static List getTopicRangeLibrary(String parentId) throws IOException{
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql = "select tr1.topicRangeId,tr1.topicRangeName,tr1.parentId,tr2.topicRangeName as parentName,"+
					 "tr1.sortNo,tr1.inputTime,tr1.isInUse from topic_range tr1,topic_range tr2 where tr1.parentId =?"+
					 " and tr1.parentId<>tr1.topicRangeId and tr1.parentId =tr2.topicRangeId ORDER BY tr1.sortNo asc";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1,parentId);
			rs = ps.executeQuery();
			while(rs.next()){
				TopicRangeBean trb = new TopicRangeBean();
				trb.setTopicRangeId(rs.getString("topicRangeId"));
				trb.setTopicRangeName(rs.getString("topicRangeName"));
				trb.setParentId(rs.getString("parentId"));
				trb.setParentName(rs.getString("parentName"));
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
	 * 保存试题考点分类
	 * @param topicRangeId
	 * @return
	 */
	public String saveTopicRange(String topicRangeId,String topicRangeName,String sortNo,String isInUse){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		try {
			String sql = "update topic_range set topicRangeName=? ,sortNo=?,isInUse=? where topicRangeId=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, topicRangeName);
			ps.setString(2, sortNo);
			ps.setInt(3, isInUse.equals("1")?1:0);
			ps.setString(4, topicRangeId);
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
	 * 删除试题考点分类
	 * @param topicRangeId
	 * @return
	 */
	public String delTopicRange(String topicRangeId){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs =null;
		try {
			conn.setAutoCommit(false);
			String sql = "select topicRangeId,parentId from topic_range where topicRangeId=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, topicRangeId);
			rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getString("topicRangeId").equals(rs.getString("parentId")))
					sql = "delete from topic_range where parentId=?";
				else 
					sql = "delete from topic_range where topicRangeId=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, topicRangeId);
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
	public String addTopicRange(String topicRangeName,String parentId,String sortNo,String isInUse,int sign){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs =null;
		try {
			if(sign==1){
				String sql = "insert into topic_range(topicRangeId,topicRangeName,parentId,sortNo,inputTime,isInUse) values(?,?,?,?,?,?)";
				ps=conn.prepareStatement(sql);
				String topicRangeId = Common.getRangeId(true,"");
				ps.setString(1, topicRangeId);
				ps.setString(2, topicRangeName);
				ps.setString(3, topicRangeId);
				ps.setString(4, sortNo);
				ps.setString(5, Common.getTime());
				ps.setString(6, isInUse);
				ps.execute();
			}else if(sign==2){
				String sql = "select topicRangeId,parentId from topic_range where topicRangeId=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, parentId);
				rs = ps.executeQuery();
				if(rs.next()){
					sql = "insert into topic_range(topicRangeId,topicRangeName,parentId,sortNo,inputTime,isInUse) values(?,?,?,?,?,?)";
					ps=conn.prepareStatement(sql);
					String topicRangeId = Common.getRangeId(false,parentId);
					ps.setString(1, topicRangeId);
					ps.setString(2, topicRangeName);
					ps.setString(3, parentId);
					ps.setString(4, sortNo);
					ps.setString(5, Common.getTime());
					ps.setString(6, isInUse);
					ps.execute();
				}
				else{
					ps.close();
					rs.close();
					conn.close();
					return "parentMiss";
				}
			}
			ps.close();
			rs.close();
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
