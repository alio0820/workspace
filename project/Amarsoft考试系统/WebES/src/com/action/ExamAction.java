package com.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.ExamBean;
import com.common.DBConnection;
import com.common.ILog;

/**
 * ���Թ�����
 * @author cdzhai
 * @version 1.0
 * @date 2013-10-25
 * @methodNum 1
 */
public class ExamAction {
	/**1
	 * ��ȡ���п��԰���
	 * @return list
	 * @throws SQLException 
	 */
	public static List getAllTest(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs =null;
		String sql = "select exam.*,(select examPaperName from exampaper where exampaper.examPaperId = exam.examPaperId) as examPaperName,"+
		"(select topicRangeName from topic_range where topic_range.topicRangeId = exam.business) as businessName, "+
		"(select nickName from user_info where user_info.userName = exam.invigilate) as invigilateName, "+
		"(select nickName from user_info where user_info.userName = exam.inputUser) as inputUserName, "+
		"(select nickName from user_info where user_info.userName = exam.updateUser) as updateUserName "+
		" from exam where exam.isInUse=1";
		List list = new ArrayList();
		try {
			ps=conn.prepareStatement(sql);
			ILog.printSql(ps.toString());
			rs = ps.executeQuery();
			while(rs.next()){
				String examId = rs.getString("examId");
				String examName = rs.getString("examName");
				String examPaperId = rs.getString("examPaperId");
				String examPaperName = rs.getString("examPaperName");
				String business = rs.getString("business");
				String businessName = rs.getString("businessName");
				String beginTime = rs.getString("beginTime");
				int examTime = rs.getInt("examTime");
				String invigilate = rs.getString("invigilate");
				String invigilateName = rs.getString("invigilateName");
				String inputUser = rs.getString("inputUser");
				String inputUserName = rs.getString("inputUserName");
				String inputTime = rs.getString("inputTime");
				String updateUser = rs.getString("updateUser");
				String updateUserName = rs.getString("updateUserName");
				String updateTime = rs.getString("updateTime");
				int isInUse = rs.getInt("isInUse");
				String remark  =rs.getString("remark");
				ExamBean eb = new ExamBean();
				eb.setExamId(examId);
				eb.setExamName(examName);
				eb.setExamPaperId(examPaperId);				//1
				eb.setExamPaperName(examPaperName!=null?examPaperName:"");		//2
				eb.setBusiness(business!=null?business:"");
				eb.setBusinessName(businessName!=null?businessName:"");
				eb.setBeginTime(beginTime!=null?beginTime:"");
				eb.setExamTime(examTime);
				eb.setInvigilate(invigilate!=null?invigilate:"");
				eb.setInvigilateName(invigilateName!=null?invigilateName:"");
				eb.setInputTime(inputTime!=null?inputTime:"");							//4
				eb.setInputUser(inputUser!=null?inputUser:"");			//5
				eb.setInputUserName(inputUserName!=null?inputUserName:"");		//6
				eb.setUpdateTime(updateTime!=null?updateTime:"");					//7
				eb.setUpdateUser(updateUser!=null?updateUser:"");				//8
				eb.setUpdateUserName(updateUserName!=null?updateUserName:"");	//9
				eb.setIsInUse(isInUse);							//13
				eb.setRemark(remark!=null?remark:"");
				list.add(eb);
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
}
