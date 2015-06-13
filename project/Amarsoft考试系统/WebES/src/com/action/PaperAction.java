package com.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.PaperBean;
import com.bean.PaperTopicBean;
import com.bean.TopicBankBean;
import com.common.Common;
import com.common.DBConnection;
import com.common.ILog;
/**
 * 锟皆撅拷锟斤拷锟斤拷锟�
 * @author cdzhai
 * @version 1.0
 * @date 2013-09-22 
 * @methodNum 12
 */
public class PaperAction {
	/**1
	 * 锟斤拷取锟斤拷锟斤拷锟斤拷锟皆撅拷
	 * @return bean
	 * @throws SQLException 
	 */
	public static List getUngeneratePaper(String userName){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql = "select paper.*,(select nickName from user_info where paper.inputUser = user_info.userName) as inputUserName,"+
		"(select nickName from user_info where paper.updateUser = user_info.userName) as updateUserName, "+
		"(select group_concat(nickName) from user_info where ';'+paper.relativeUser+';' like ('%;'+user_info.userName+';%')) as relativeUserName "+
		" from exampaper as paper where (inputUser=? or relativeUser like ?) and paper.isInUse=0";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, "%"+userName+"%");
			ILog.printSql(ps.toString());
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
		}
		return list;
	}
	/**10
	 * 锟斤拷取锟斤拷锟斤拷锟窖凤拷锟斤拷锟皆撅拷
	 * @return bean
	 * @throws SQLException 
	 */
	public static List getAllPaper(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql = "select paper.*,(select nickName from user_info where paper.inputUser = user_info.userName) as inputUserName,"+
		"(select nickName from user_info where paper.updateUser = user_info.userName) as updateUserName, "+
		"(select group_concat(nickName) from user_info where ';'+paper.relativeUser+';' like ('%;'+user_info.userName+';%')) as relativeUserName "+
		" from exampaper as paper where paper.isInUse=1";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			ILog.printSql(ps.toString());
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
		}
		return list;
	}
	/**8
	 * 锟斤拷取锟皆撅拷锟斤拷锟斤拷锟较�
	 * @return bean
	 * @throws SQLException 
	 */
	public static PaperBean getPaperDetail(String paperId){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		PaperBean pb = new PaperBean();
		String sql = "select paper.*,(select nickName from user_info where paper.inputUser = user_info.userName) as inputUserName,"+
		"(select nickName from user_info where paper.updateUser = user_info.userName) as updateUserName, "+
		"(select group_concat(nickName) from user_info where ';'+paper.relativeUser+';' like ('%;'+user_info.userName+';%')) as relativeUserName "+
		" from exampaper as paper where paper.examPaperId=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, paperId);
			ILog.printSql(ps.toString());
			rs = ps.executeQuery();
			
			if(rs.next()){
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
				
				pb.setExamPaperId(examPaperId);				//1
				pb.setExamPaperName(examPaperName!=null?examPaperName:"");		//2
				pb.setQuestionNum(questionNum);						//3
				pb.setInputTime(inputTime!=null?inputTime:"");							//4
				pb.setInputUser(inputUser!=null?inputUser:"");			//5
				pb.setInputUserName(inputUserName!=null?inputUserName:"");		//6
				pb.setUpdateTime(updateTime!=null?updateTime:"");					//7
				pb.setUpdateUser(updateUser!=null?updateUser:"");				//8
				pb.setUpdateUserName(updateUserName!=null?updateUserName:"");	//9
				pb.setUpdateContent(updateContent!=null?updateContent:"");		//10
				pb.setRelativeUser(relativeUser!=null?relativeUser:"");			//11
				pb.setRelativeUserName(relativeUserName!=null?relativeUserName:"");	//12
				pb.setIsInUse(isInUse);							//13
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return pb;
	}
	/**2
	 * 锟斤拷锟斤拷跃锟�-锟斤拷锟斤拷锟斤拷息
	 * @return String
	 * @throws SQLException 
	 */
	public static String[] addPaper(String paperName){
		String paperId = Common.getSerialNo("exampaper", "examPaperId");
		Connection conn = DBConnection.getConnection();
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
			ILog.printSql(ps.toString());
			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			data[0] = "error";
			return data;
		}
		data[0] = "success";
		data[1] = paperId;
		return data;
	}
	/**3
	 * 锟斤拷锟斤拷锟皆撅拷-锟斤拷锟斤拷锟斤拷息
	 * @return String
	 * @throws SQLException 
	 */
	public static String savePaper(String paperId,String paperName){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		String sql = "update exampaper set examPaperName = ? where examPaperId = ?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, paperName);
			ps.setString(2, paperId);
			ILog.printSql(ps.toString());
			ps.executeUpdate();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	/**4
	 * 删锟斤拷锟皆撅拷
	 * @return String
	 * @throws SQLException 
	 */
	public static String delPaper(String paperId){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql ="";
		try {
			sql = "select examPaperId from exampaper where examPaperId = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, paperId);
			ILog.printSql(ps.toString());
			rs = ps.executeQuery();
			if(rs.next()){
				sql = "delete from exampaper where examPaperId = ?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, paperId);
				ILog.printSql(ps.toString());
				ps.execute();
			}
			ps.close();
			rs.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	/**11
	 * 锟斤拷锟斤拷锟皆撅拷
	 * @return String
	 * @throws SQLException 
	 */
	public static String publishPaper(String paperId){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql ="";
		try {
			sql = "select examPaperId from exampaper where examPaperId = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, paperId);
			ILog.printSql(ps.toString());
			rs = ps.executeQuery();
			if(rs.next()){
				sql = "update exampaper set isInUse =1 where examPaperId = ?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, paperId);
				ILog.printSql(ps.toString());
				ps.executeUpdate();
			}
			ps.close();
			rs.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	/**12
	 * 锟斤拷锟斤拷锟皆撅拷
	 * @return String
	 * @throws SQLException 
	 */
	public static String CancelPublishPaper(String paperId){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql ="";
		try {
			sql = "select examPaperId from exampaper where examPaperId = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, paperId);
			ILog.printSql(ps.toString());
			rs = ps.executeQuery();
			if(rs.next()){
				sql = "update exampaper set isInUse =0 where examPaperId = ?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, paperId);
				ILog.printSql(ps.toString());
				ps.executeUpdate();
			}
			ps.close();
			rs.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	/**5
	 * 锟斤拷取锟皆撅拷锟斤拷目---锟斤拷锟斤拷锟斤拷锟斤拷牛锟斤拷薷锟绞�
	 * @return List
	 * @throws SQLException 
	 */
	public static List getPaperTopic(String examPaperId){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql = "select "+//(select paper.examPaperName from exampaper as paper where paper.examPaperId=ER.examPaperId) as examPaperName,"+
		"ER.questionId,topic.questionName,ER.sortNo,topic.type as topicTypeId,topic.topicRange as topicRangeId,topic.accuracyRate,ER.remark,"+
		"(select TT.topicTypeName from topic_type as TT where TT.topicTypeId = topic.type) as topicTypeName,"+
		"(select TR.topicRangeName from topic_range as TR where TR.topicRangeId = topic.topicRange) as topicRangeName "+
		"from exampaper_relative as ER,topic_catalog as topic where ER.questionId = topic.questionId and ER.examPaperId=? "+
		"ORDER BY ER.sortNo ASC, ER.questionId ASC";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, examPaperId);
			ILog.printSql(ps.toString());
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
		}
		return list;
	}
	/**9
	 * 锟斤拷取锟皆撅拷锟斤拷锟斤拷---锟斤拷锟斤拷锟斤拷锟斤拷
	 * @return List
	 * @throws SQLException 
	 */
	public static List getPaperTopicByType(String examPaperId){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql = "select "+//(select paper.examPaperName from exampaper as paper where paper.examPaperId=ER.examPaperId) as examPaperName,"+
		"ER.questionId,topic.questionName,ER.sortNo,topic.type as topicTypeId,topic.topicRange as topicRangeId,topic.accuracyRate,ER.remark,TT.topicTypeName,TT.remark as typeRemark,topic.content,"+
		"(select TR.topicRangeName from topic_range as TR where TR.topicRangeId = topic.topicRange) as topicRangeName,"+
		"(select REPLACE(group_concat(optionContent),',',';;') from topic_library as TL where TL.questionId = topic.questionId ) as optionContent "+
		"from exampaper_relative as ER,topic_catalog as topic,topic_type as TT "+
		"where ER.questionId = topic.questionId and topic.type = TT.topicTypeId and ER.examPaperId=? "+
		"ORDER BY TT.sortNo ASC, ER.sortNo ASC";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, examPaperId);
			ILog.printSql(ps.toString());
			rs = ps.executeQuery();
			while(rs.next()){
//				String examPaperName = rs.getString("examPaperName");
				String questionId = rs.getString("questionId");
				String questionName = rs.getString("questionName");
				String sortNo = rs.getString("sortNo");
				String content = rs.getString("content");
				String topicTypeId = rs.getString("topicTypeId");
				String topicTypeName = rs.getString("topicTypeName");
				String topicTypeRemark = rs.getString("typeRemark");
				String topicRangeId = rs.getString("topicRangeId");
				String topicRangeName = rs.getString("topicRangeName");
				String accuracyRate = rs.getString("accuracyRate");
				String[] optionContent = (rs.getString("optionContent")!=null?rs.getString("optionContent").split(";;"):null);
				String remark = rs.getString("remark");
				PaperTopicBean ptb = new PaperTopicBean();
				ptb.setExamPaperId(examPaperId);								//1
//				ptb.setExamPaperName(examPaperName!=null?examPaperName:"");		//2
				ptb.setQuestionId(questionId);									//3
				ptb.setQuestionName(questionName);								//4
				ptb.setSortNo(sortNo!=null?sortNo:"");							//5
				ptb.setContent(content!=null?content:"");
				ptb.setTopicTypeId(topicTypeId!=null?topicTypeId:"");			//6
				ptb.setTopicTypeName(topicTypeName!=null?topicTypeName:"");		//7
				ptb.setTopicTypeRemark(topicTypeRemark!=null?topicTypeRemark:"");		//7
				ptb.setTopicRangeId(topicRangeId!=null?topicRangeId:"");		//8
				ptb.setTopicRangeName(topicRangeName!=null?topicRangeName:"");	//9
				ptb.setAccuracyRate(accuracyRate!=null?accuracyRate:"");		//10
				ptb.setOption(optionContent);									//11
				ptb.setRemark(remark!=null?remark:"");							//12
				//锟斤拷锟斤拷选锟斤拷
				sql = "select optionContent from topic_library where questionId=?";
				list.add(ptb);
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
	/**6
	 * 锟皆撅拷-删锟斤拷锟斤拷锟斤拷
	 * @return String
	 * @throws SQLException 
	 */
	public static String delTopicForPaper(String questionId,String examPaperId){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql ="";
		try {
			sql = "select questionId from exampaper_relative where examPaperId = ? and questionId=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, examPaperId);
			ps.setString(2, questionId);
			ILog.printSql(ps.toString());
			rs = ps.executeQuery();
			if(rs.next()){
				sql = "delete from exampaper_relative where examPaperId = ? and questionId=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, examPaperId);
				ps.setString(2, questionId);
				ILog.printSql(ps.toString());
				ps.execute();
			}
			ps.close();
			rs.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	/**7
	 * 锟皆撅拷-锟斤拷锟斤拷锟斤拷锟斤拷
	 * @return String
	 * @throws SQLException 
	 */
	public static String importTopicForPaper(String questionId,String examPaperId){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql ="";
		try {
			sql = "select questionId from exampaper_relative where examPaperId = ? and questionId=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, examPaperId);
			ps.setString(2, questionId);
			ILog.printSql(ps.toString());
			rs = ps.executeQuery();
			if(!rs.next()){
				String sortNo = "";
				sql = "select MAX(sortNo) as sortNo from exampaper_relative where examPaperId=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, examPaperId);
				ILog.printSql(ps.toString());
				rs = ps.executeQuery();
				rs.next();
				sortNo = rs.getString("sortNo");
				if(sortNo!=null){
					sortNo = (Integer.parseInt(1+sortNo)+1+"").substring(1);
				}else{
					sortNo = "001";
				}
				String topicType = "";
				sql = "select type  from topic_catalog where questionId=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, questionId);
				ILog.printSql(ps.toString());
				rs = ps.executeQuery();
				rs.next();
				topicType = rs.getString("type");
				sql = "insert into  exampaper_relative(exampaperId,questionId,type,sortNo) values(?,?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, examPaperId);
				ps.setString(2, questionId);
				ps.setString(3, topicType);
				ps.setString(4, sortNo);
				ILog.printSql(ps.toString());
				ps.execute();
			}
			ps.close();
			rs.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
}
