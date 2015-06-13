package com.action;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.bean.UserBean;
import com.common.Common;
import com.common.DBConnection;
import com.common.MyLog;

public class PersonAction {
	/**1
	 * 个人信息-更新信息
	 * @return String
	 */
	public static String updatePersonInfo(int status,HttpSession session,String... parameters){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
//		for(int i=0;i<parameters.length;i++){
//			parameters[i] = parameters[i].replace("#|#","&").replace("#@#","%");
//		}
		String sql ="";
		String updateTime = Common.getTime();
		boolean flag = false;
		UserBean user = getUserFromSession(session);
		if(status==1){
			sql = "update user_info set sex=?,nickName=?,remark=?,updateTime=? where userName=?";
			flag = DBConnection.executeSQL(conn, sql ,parameters[0],parameters[1],parameters[2],updateTime,parameters[3]);
			if(flag){
				user.setSex(parameters[0]);
				user.setNickName(parameters[1]);
				user.setRemark(parameters[2]);
				user.setUpdateTime(updateTime);
			}
		}
		else if(status==2){
			sql = "update user_info set birthday=?,birthplace=?,school=?,phone=?,updateTime=? where userName=?";
			flag = DBConnection.executeSQL(conn, sql ,parameters[0],parameters[1],parameters[2],parameters[3],updateTime,parameters[4]);
			if(flag){
				user.setBirthday(parameters[0]);
				user.setBirthplace(parameters[1]);
				user.setSchool(parameters[2]);
				user.setPhone(parameters[3]);
				user.setUpdateTime(updateTime);
			}
			
		}
		try {
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
		}
		return flag+";";
	}
	/**2
	 * 个人信息-从session中获取UserBean
	 * @return String
	 */
	public static UserBean getUserFromSession(HttpSession session){
		Object userBean = session.getAttribute("userBean");
		UserBean user = null;
		if(userBean!=null)
			user = (UserBean)userBean;
		return user;
	}
	/**3
	 * 个人信息-修改密码
	 * @return String
	 */
	public static String changePwd(String userName,String oldpwd,String pwd){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		oldpwd = Common.encodeByMD5(oldpwd);
		pwd = Common.encodeByMD5(pwd);
		String sql = "select userName from user_info where valid =1 and userName=?";
		boolean flag = false;
		ResultSet rs = DBConnection.executeQuery(conn, sql,userName);
		try {
			if(rs.next()){
				if(!oldpwd.equals(rs.getString("password")))
					return "false;原始密码输入错误";
				sql = "update user_info set password =? where userName=?";
				flag = DBConnection.executeSQL(conn, sql ,pwd,userName);
			}
			else{
				return "false;原始密码输入错误";
			}
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"修改密码出错...");
		}
		return flag+";";
	}
	/**4
	 * 个人信息-修改头像
	 * @return String
	 */
	public static String changeHeadPortrait(HttpSession session,String userName,String head){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String sql = "update user_info set head =? where userName=?";
		boolean flag = DBConnection.executeSQL(conn, sql ,head,userName);
		if(flag){
			UserBean user = getUserFromSession(session);
			user.setHead(head);
		}
		try {
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
		}
		return flag+";";
	}
	/**5
	 * 个人信息-获取头像资源
	 * @return String
	 */
	public static ArrayList<String> getFileNames(String rootUrl){
		String path = rootUrl+"/images/head/";
		File file = new File(path);
		String[] fileName = file.list();
		ArrayList<String> list = new ArrayList<String>();
		for(int i=0;i<fileName.length;i++){
			if(!fileName[i].equals(".svn"))
				list.add(fileName[i]);
		}
		return list;
	}
}
