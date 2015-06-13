package com.aes.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.aes.beans.PaperBean;
import com.aes.beans.PaperTopicBean;
import com.aes.beans.TopicBankBean;
import com.common.Common;
import com.common.DBConnection;
import com.common.Log;
/**
 * 试卷管理类
 * @author cdzhai
 * @version 1.0
 * @date 2013-09-22 
 */
public class PaperAction {
	/**1
	 * 获取待生成试卷
	 * @return bean
	 * @throws SQLException 
	 */
	public static List getUngeneratePaper(String userId){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql = "select paper.*,(select userName from user_info where paper.inputUser = user_info.userId) as inputUserName,"+
		"(select userName from user_info where paper.updateUser = user_info.userId) as updateUserName, "+
		"(select group_concat(userName) from user_info where ';'+paper.relativeUser+';' like ('%;'+user_info.userId+';%')) as relativeUserName "+
		" from exampaper as paper where (inputUser=? or relativeUser like ?) and paper.isInUse=0";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, "%"+userId+"%");
			Log.printSql(ps.toString());
			rs = ps.executeQuery();
			while(rs.next()){
				String examPaperId = rs.getString("examPaperId");
				String examPaperName = rs.getString("examPaperName");
				int questionNum = rs.getInt("questionNum");
				String inputTime = rs.getString("inputTime");
				String inputUser = rs.getString("inputUser");
				String inputUserName = rs.getString("inputUserName");
				String updateTime = rs.getString("updateTime");
				String updateUser = rs.getString("updateUser");
				String updateUserName = rs.getString("updateUserName");
				String updateContent = rs.getString("updateContent");
				String relativeUser = rs.getString("relativeUser");
				String relativeUserName = rs.getString("relativeUserName");
				int isInUse = rs.getInt("isInUse");
				PaperBean ptb = new PaperBean();
				ptb.setExamPaperId(examPaperId);				//1
				ptb.setExamPaperName(examPaperName!=null?examPaperName:"");		//2
				ptb.setQuestionNum(questionNum);						//3
				ptb.setInputTime(inputTime!=null?inputTime:"");							//4
				ptb.setInputUser(inputUser!=null?inputUser:"");			//5
				ptb.setInputUserName(inputUserName!=null?inputUserName:"");		//6
				ptb.setUpdateTime(updateTime!=null?updateTime:"");					//7
				ptb.setUpdateUser(updateUser!=null?updateUser:"");				//8
				ptb.setUpdateUserName(updateUserName!=null?updateUserName:"");	//9
				ptb.setUpdateContent(updateContent!=null?updateContent:"");		//10
				ptb.setRelativeUser(relativeUser!=null?relativeUser:"");			//11
				ptb.setRelativeUserName(relativeUserName!=null?relativeUserName:"");	//12
				ptb.setIsInUse(isInUse);							//13
				list.add(ptb);
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
	 * 添加试卷-基本信息
	 * @return String
	 * @throws SQLException 
	 */
	public static String[] addPaper(String paperName){
		String paperId = Common.getId("exampaper", "examPaperId");
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		String [] data = new String[2];
		String sql = "insert into exampaper(examPaperId,examPaperName,questionNum,inputTime,inputUser,isInUse) values(?,?,?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, paperId);
			ps.setString(2, paperName);
			ps.setInt(3, 0);
			ps.setString(4, Common.getDate());
			ps.setString(5, "cdzhai");
			ps.setInt(6, 0);
			Log.printSql(ps.toString());
			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			data[0] = "error";
			return data;
		}finally{
			db.CloseDB();
		}
		data[0] = "success";
		data[1] = paperId;
		return data;
	}
	/**3
	 * 保存试卷-基本信息
	 * @return String
	 * @throws SQLException 
	 */
	public static String savePaper(String paperId,String paperName){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		String sql = "update exampaper set examPaperName = ? where examPaperId = ?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, paperName);
			ps.setString(2, paperId);
			Log.printSql(ps.toString());
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
	/**4
	 * 删除试卷
	 * @return String
	 * @throws SQLException 
	 */
	public static String delPaper(String paperId){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql ="";
		
		try {
			sql = "select examPaperId from exampaper where examPaperId = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, paperId);
			Log.printSql(ps.toString());
			rs = ps.executeQuery();
			if(rs.next()){
				sql = "delete from exampaper where examPaperId = ?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, paperId);
				Log.printSql(ps.toString());
				ps.execute();
			}
			ps.close();
			rs.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return "error";
		}finally{
			db.CloseDB();
		}
		return "success";
	}
	/**5
	 * 获取试卷内容
	 * @return List
	 * @throws SQLException 
	 */
	public static List getPaperTopic(String examPaperId){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql = "select "+//(select paper.examPaperName from exampaper as paper where paper.examPaperId=ER.examPaperId) as examPaperName,"+
		"ER.questionId,topic.questionName,ER.sortNo,topic.type as topicTypeId,topic.topicRange as topicRangeId,topic.accuracyRate,ER.remark,"+
		"(select TT.topicTypeName from topic_type as TT where TT.topicTypeId = topic.type) as topicTypeName,"+
		"(select TR.topicRangeName from topic_range as TR where TR.topicRangeId = topic.topicRange) as topicRangeName "+
		"from exampaper_relative as ER,topic_catalog as topic where ER.questionId = topic.questionId and ER.examPaperId=?";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, examPaperId);
			Log.printSql(ps.toString());
			rs = ps.executeQuery();
			while(rs.next()){
//				String examPaperName = rs.getString("examPaperName");
				String questionId = rs.getString("questionId");
				String questionName = rs.getString("questionName");
				String sortNo = rs.getString("sortNo");
//				String content = rs.getString("content");
				String topicTypeId = rs.getString("topicTypeId");
				String topicTypeName = rs.getString("topicTypeName");
				String topicRangeId = rs.getString("topicRangeId");
				String topicRangeName = rs.getString("topicRangeName");
				String accuracyRate = rs.getString("accuracyRate");
				String remark = rs.getString("remark");
				PaperTopicBean ptb = new PaperTopicBean();
				ptb.setExamPaperId(examPaperId);								//1
//				ptb.setExamPaperName(examPaperName!=null?examPaperName:"");		//2
				ptb.setQuestionId(questionId);									//3
				ptb.setQuestionName(questionName);								//4
				ptb.setSortNo(sortNo!=null?sortNo:"");							//5
				ptb.setTopicTypeId(topicTypeId!=null?topicTypeId:"");			//6
				ptb.setTopicTypeName(topicTypeName!=null?topicTypeName:"");		//7
				ptb.setTopicRangeId(topicRangeId!=null?topicRangeId:"");		//8
				ptb.setTopicRangeName(topicRangeName!=null?topicRangeName:"");	//9
				ptb.setAccuracyRate(accuracyRate!=null?accuracyRate:"");		//10
				ptb.setRemark(remark!=null?remark:"");							//11
				list.add(ptb);
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
}
