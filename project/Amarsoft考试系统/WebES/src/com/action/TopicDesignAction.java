package com.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.common.Common;
import com.common.DBConnection;
import com.common.ILog;
/**
 * 锟斤拷锟斤拷锟斤拷锟斤拷锟�
 * @author cdzhai
 * @version 1.0
 * @date 2013-08-11 22:49
 */
public class TopicDesignAction {
	/**2
	 * 锟斤拷取锟斤拷锟斤拷锟斤拷锟斤拷
	 * @return String
	 * @throws IOException 
	 */
	public static List getTopicType() throws IOException{
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql = "select topicTypeId,topicTypeName from topic_type where isInUse=1  ORDER BY topic_type.sortNo ASC";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			ILog.printSql(ps.toString());
			rs = ps.executeQuery();
			while(rs.next()){
				String[] type = new String[2];
				type[0] = rs.getString("topicTypeId");
				type[1] = rs.getString("topicTypeName");
				list.add(type);
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
	/**3
	 * 锟斤拷取锟斤拷锟解考锟斤拷
	 * @return String
	 * @throws IOException 
	 */
	public static List getTopicRange() throws IOException{
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql = "select tr1.topicRangeId,tr1.topicRangeName,tr1.parentId from topic_range as tr1,topic_range as tr2"+
		" where tr1.isInUse=1 and tr1.parentId=tr2.topicRangeId and tr2.isInUse =1 ORDER BY tr1.parentId ASC,tr1.sortNo asc";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			ILog.printSql(ps.toString());
			rs = ps.executeQuery();
			while(rs.next()){
				String[] type = new String[3];
				type[0] = rs.getString("topicRangeId");
				type[1] = rs.getString("topicRangeName");
				type[2] = rs.getString("parentId");
				list.add(type);
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
	/**1
	 * 锟斤拷拥锟窖★拷锟�
	 * @return String
	 */
	public String addSingleChoice(String topicType,String topicRange,String topicName,String topicContent,String optionNum,String options,String topicAnswer){
		int num = Integer.parseInt(optionNum);
		String[] option = options.split("@@");
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		try {
			conn.setAutoCommit(false);
			String sql = "insert into topic_catalog(questionId,questionName"+
						",content,answer,type,topicRange,optionNum,inputUser,inputTime,isInUse) values (?,?,?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			System.out.println(sql);
			String questionId = Common.getSerialNo("topic_catalog","questionId");
			ps.setString(1, questionId);
			ps.setString(2, topicName);
			ps.setString(3, topicContent);
			ps.setString(4, topicAnswer);
			ps.setString(5, topicType);
			ps.setString(6, topicRange);		//range为锟斤拷锟捷库保锟斤拷锟斤拷
			ps.setInt(7, num);
			ps.setString(8, "cdzhai");
			ps.setString(9, Common.getTime());
			ps.setInt(10, 1);
			ILog.printSql(ps.toString());
			ps.execute();
			for(int i=0;i<num;i++){
				sql = "insert into topic_library(questionId,optionId,optionContent,sortNo) values (?,?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, questionId);
				ps.setInt(2, i+1);
				ps.setString(3, option[i]);
				ps.setInt(4, i+1);
				ILog.printSql(ps.toString());
				ps.execute();
			}
			conn.commit();
			ps.close();
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
		}
		return "success";
	}
	/**4
	 * 锟斤拷拥锟窖★拷锟�
	 * @return String
	 */
	public String addSubjective(String topicType,String topicRange,String topicName,String topicContent,String topicAnswer){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		try {
			conn.setAutoCommit(false);
			String sql = "insert into topic_catalog(questionId,questionName"+
						",content,type,topicRange,inputUser,inputTime,isInUse) values (?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			System.out.println(sql);
			String questionId = Common.getSerialNo("topic_catalog","questionId");
			ps.setString(1, questionId);
			ps.setString(2, topicName);
			ps.setString(3, topicContent);
			ps.setString(4, topicType);
			ps.setString(5, topicRange);		//range为锟斤拷锟捷库保锟斤拷锟斤拷
			ps.setString(6, "cdzhai");
			ps.setString(7, Common.getTime());
			ps.setInt(8, 1);
			ILog.printSql(ps.toString());
			ps.execute();
			
			sql = "insert into topic_major_answer(questionId,answer) values (?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, questionId);
			ps.setString(2, topicAnswer);
			ILog.printSql(ps.toString());
			ps.execute();
			
			conn.commit();
			ps.close();
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
		}
		return "success";
	}
}
