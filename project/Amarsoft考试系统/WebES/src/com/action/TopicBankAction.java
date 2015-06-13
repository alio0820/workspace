package com.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.TopicBankBean;
import com.common.DBConnection;
import com.common.ILog;

public class TopicBankAction {
	/**1
	 * 锟斤拷锟斤拷锟斤拷锟酵ｏ拷锟斤拷取锟斤拷锟斤拷(old)
	 * @return bean
	 * @throws IOException 
	 */
	public static List getTopicAll(String topicType,int isShowAll) throws IOException{
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql_part="";
		if(isShowAll==1) 
			sql_part = "and tc.isInUse = 1";
		String sql = "select tc.questionId,tc.questionName,tc.content,tc.answer,tt.topicTypeId,tt.topicTypeName,"+
		"tr.topicRangeId,tr.topicRangeName,tc.optionNum,tc.accuracyRate,tc.sortNo,tc.inputUser,user.nickName,"+
		"tc.inputTime,tc.updateTime,tc.isInUse"+
		" from topic_catalog as tc,topic_Type as tt,topic_Range as tr,user_info as user"+
		" where tc.type=tt.topicTypeId and tc.topicRange = tr.topicRangeId and tc.inputUser=user.userId and tc.type=? "+sql_part+
		" ORDER BY tc.sortNo ASC, tc.questionId ASC";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, topicType);
			ILog.printSql(ps.toString());
			rs = ps.executeQuery();
			while(rs.next()){
				String questionId = rs.getString("questionId");
				String questionName = rs.getString("questionName");
				String content = rs.getString("content");
				String answer = rs.getString("answer");
				String topicTypeId = rs.getString("topicTypeId");
				String topicTypeName = rs.getString("topicTypeName");
				String topicRangeId = rs.getString("topicRangeId");
				String topicRangeName = rs.getString("topicRangeName");
				String accuracyRate = rs.getString("accuracyRate");
				String sortNo = rs.getString("sortNo");
				String inputUser = rs.getString("inputUser");
				String nickName = rs.getString("nickName");
				String inputTime = rs.getString("inputTime");
				String updateTime = rs.getString("updateTime");
				TopicBankBean tbb = new TopicBankBean();
				tbb.setQuestionId(questionId!=null?questionId:"");				//1
				tbb.setQuestionName(questionName!=null?questionName:"");		//2
				tbb.setContent(content!=null?content:"");						//3
				tbb.setAnswer(answer!=null?answer:"");							//4
				tbb.setTopicTypeId(topicTypeId!=null?topicTypeId:"");			//5
				tbb.setTopicTypeName(topicTypeName!=null?topicTypeName:"");		//6
				tbb.setTopicRangeId(topicRangeId!=null?topicRangeId:"");		//7
				tbb.setTopicRangeName(topicRangeName!=null?topicRangeName:"");	//8
				tbb.setOptionNum(rs.getInt("optionNum"));						//9
				tbb.setAccuracyRate(accuracyRate!=null?accuracyRate:"");		//10
				tbb.setSortNo(sortNo!=null?sortNo:"");							//11
				tbb.setInputUserId(inputUser!=null?inputUser:"");				//12
				tbb.setInputUserName(nickName!=null?nickName:"");				//13
				tbb.setInputTime(inputTime!=null&&inputTime.length()>=10?inputTime.substring(0,10):"");					//14
				tbb.setUpdateTime(updateTime!=null&&updateTime.length()>=10?updateTime.substring(0,10):"");				//15
				tbb.setIsInUse(rs.getInt("isInUse"));							//16
				list.add(tbb);
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
	/**2
	 * 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷取锟斤拷锟斤拷
	 * @return bean
	 * @throws IOException 
	 */
	public static List getTopicWithCondition(String queryItem,int isShowAll) throws IOException{
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql_part=" 1=1 ";
		if(isShowAll==1) 
			sql_part = " and tc.isInUse = 1";
		String sql = "select tc.questionId,tc.questionName,tc.content,tc.answer,tt.topicTypeId,tt.topicTypeName,"+
		"tr.topicRangeId,tr.topicRangeName,tc.optionNum,tc.accuracyRate,tc.sortNo,tc.inputUser,user.nickName,"+
		"tc.inputTime,tc.updateTime,tc.isInUse"+
		" from topic_catalog as tc,topic_Type as tt,topic_Range as tr,user_info as user"+
		" where tc.type=tt.topicTypeId and tc.topicRange = tr.topicRangeId and tc.inputUser=user.userName and "+queryItem+sql_part+
		" ORDER BY tc.sortNo ASC, tc.questionId ASC";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			ILog.printSql(ps.toString());
			rs = ps.executeQuery();
			while(rs.next()){
				String questionId = rs.getString("questionId");
				String questionName = rs.getString("questionName");
				String content = rs.getString("content");
				String answer = rs.getString("answer");
				String topicTypeId = rs.getString("topicTypeId");
				String topicTypeName = rs.getString("topicTypeName");
				String topicRangeId = rs.getString("topicRangeId");
				String topicRangeName = rs.getString("topicRangeName");
				String accuracyRate = rs.getString("accuracyRate");
				String sortNo = rs.getString("sortNo");
				String inputUser = rs.getString("inputUser");
				String nickName = rs.getString("nickName");
				String inputTime = rs.getString("inputTime");
				String updateTime = rs.getString("updateTime");
				TopicBankBean tbb = new TopicBankBean();
				tbb.setQuestionId(questionId!=null?questionId:"");				//1
				tbb.setQuestionName(questionName!=null?questionName:"");		//2
				tbb.setContent(content!=null?content:"");						//3
				tbb.setAnswer(answer!=null?answer:"");							//4
				tbb.setTopicTypeId(topicTypeId!=null?topicTypeId:"");			//5
				tbb.setTopicTypeName(topicTypeName!=null?topicTypeName:"");		//6
				tbb.setTopicRangeId(topicRangeId!=null?topicRangeId:"");		//7
				tbb.setTopicRangeName(topicRangeName!=null?topicRangeName:"");	//8
				tbb.setOptionNum(rs.getInt("optionNum"));						//9
				tbb.setAccuracyRate(accuracyRate!=null?accuracyRate:"");		//10
				tbb.setSortNo(sortNo!=null?sortNo:"");							//11
				tbb.setInputUserId(inputUser!=null?inputUser:"");				//12
				tbb.setInputUserName(nickName!=null?nickName:"");				//13
				tbb.setInputTime(inputTime!=null&&inputTime.length()>=10?inputTime.substring(0,10):"");					//14
				tbb.setUpdateTime(updateTime!=null&&updateTime.length()>=10?updateTime.substring(0,10):"");				//15
				tbb.setIsInUse(rs.getInt("isInUse"));							//16
				list.add(tbb);
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
	 * 锟斤拷锟�-删锟斤拷锟斤拷锟斤拷
	 * @return String
	 * @throws SQLException 
	 */
	public static String delTopic(String questionId){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql ="";
		try {
//			sql = "select questionId from topic_catalog where questionId=?";
//			ps=conn.prepareStatement(sql);
//			ps.setString(1, questionId);
//			Log.printSql(ps.toString());
//			rs = ps.executeQuery();
//			if(rs.next()){
				conn.setAutoCommit(false);
				sql = "delete from topic_catalog where questionId=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, questionId);
				ILog.printSql(ps.toString());
				ps.execute();
				sql = "delete from topic_library where questionId=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, questionId);
				ILog.printSql(ps.toString());
				ps.execute();
//			}
			conn.commit();
			ps.close();
//			rs.close();
			conn.setAutoCommit(true);
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	public static List getSingleChoiceAll() throws IOException{
		return getTopicAll("SingleChoice",1);
	}
	public static List getMultipleChoiceAll() throws IOException{
		return getTopicAll("MultipleChoice",1);
	}
	public static List getBlankAll() throws IOException{
		return getTopicAll("Blank",1);
	}
	public static List getJudgeAll() throws IOException{
		return getTopicAll("Judge",1);
	}
	public static List getSubjectiveAll() throws IOException{
		return getTopicAll("Subjective",1);
	}
	public static List getSingleChoice() throws IOException{
		return getTopicAll("SingleChoice",0);
	}
	public static List getMultipleChoice() throws IOException{
		return getTopicAll("MultipleChoice",0);
	}
	public static List getBlank() throws IOException{
		return getTopicAll("Blank",0);
	}
	public static List getJudge() throws IOException{
		return getTopicAll("Judge",0);
	}
	public static List getSubjective() throws IOException{
		return getTopicAll("Subjective",0);
	}
}
