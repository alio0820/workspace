package com.action;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Pattern;

import com.bean.PostBean;
import com.bean.ReplayBean;
import com.bean.UserBean;
import com.common.Common;
import com.common.DBConnection;
import com.common.MyLog;
import com.tool.MyFile;

public class PostAction {
	/**1
	 * 帖子-发表帖子
	 * @return String
	 * @throws SQLException 
	 */
	public static String publishPost(String title,String content,String inputTime,String inputUser,String sPath){
		content = content.replaceAll("http://[a-z.:0-9]+/[0-9a-zA-Z_]+/ueditor/jsp/\\.\\./\\.\\./","");
		String fileName =MyFile.getFileName(inputUser);
		Boolean flag = MyFile.writeDataToFile(sPath,fileName,content);
		if(!flag) return "false;保存帖子失败";
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String updateRank = "update user_info set rank = rank+10 where userName=?";
		String sql = "insert into post(postId,sortNo,title,content,readNum,replayNum,praiseNum,nicePost,top,inputUser,inputTime,isInUse) values(?,'',?,?,0,0,0,0,0,?,?,1)";
		String postId = Common.getSerialNo(conn,"post", "postId");
		if(Common.isBlank(inputTime)) inputTime = Common.getTime();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e1) {
			MyLog.getLogError(e1,"设置事务非自动提交出错...");
			return null;
		}
		boolean flag1 = DBConnection.executeSQL(conn, updateRank,inputUser);
		boolean flag2 = DBConnection.executeSQL(conn, sql, postId ,title ,content,inputUser,inputTime);
		try {
			conn.commit();
			conn.setAutoCommit(true);
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"提交事务或者关闭连接出错...");
			return null;
		}
		return (flag1&&flag2)+";"+postId;
	}
	/**2
	 * 帖子-编辑帖子
	 * @return String
	 * @throws SQLException 
	 */
	public static String updatePost(String postId,String title,String content,String updateTime,String inputUser,String sPath){
		content = content.replaceAll("http://[a-z.:0-9]+/[0-9a-zA-Z_]+/ueditor/jsp/\\.\\./\\.\\./","");
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String fileName=getPostPath(conn,postId);
		if(fileName==null)
			fileName = MyFile.getFileName(inputUser);
		Boolean flag1 = MyFile.writeDataToFile(sPath,fileName,content);
		if(!flag1) return "false;更新帖子失败";
		String updateSql = "update post set title=?,content=?,updateTime=? where postId=? and inputUser=?";
		if(Common.isBlank(updateTime)) updateTime = Common.getTime();
		boolean flag2 = DBConnection.executeSQL(conn, updateSql ,title ,fileName ,updateTime,postId,inputUser);
		try {
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
			return null;
		}
		return flag2+";"+postId;
	}
	/**
	 * 获取帖子内容的保存路径
	 */
	public static String getPostPath(Connection conn,String postId){
		String sQuerySql = "select content from post where postId=?";
		String fileName=null;
		ResultSet rs = DBConnection.executeQuery(conn, sQuerySql,postId);
		try {
			if(rs.next()){
				boolean flag0 = Pattern.matches("^[0-9]+[_][0-9a-zA-Z_]+[.]htm$",rs.getString("content"));
				if(flag0)
					fileName = rs.getString("content");
			}
		} catch (SQLException e) {
			MyLog.getLogError(e,"访问数据库出错...");
			return null;
		}
		return fileName;
	}
	/**3
	 * 帖子-删除帖子
	 * @return String
	 * @throws SQLException 
	 */
	public static String deletePost(String postId,String roleId,String inputUser,String sPath){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String fileName = getPostPath(conn, postId);
		if(fileName!=null){
			if(!MyFile.deleteFile(sPath+fileName))
				return "false;删除帖子内容失败";
		}
		String sql="";
		int role = Integer.parseInt(roleId);
		if(role>2)
			sql = "delete from post where inputUser='"+inputUser+"' and postId=?";
		else
			sql = "delete from post where postId=?";
		boolean flag = DBConnection.executeSQL(conn, sql, postId);
		try {
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
			return null;
		}
		return flag+";";
	}
	/**4
	 * 帖子-获得所有的帖子
	 * @return ArrayList<PostBean>
	 */
	public static ArrayList<PostBean> getAllPosts(String sPath){
		return getAllPosts("",sPath);
	}
	public static ArrayList<PostBean> getAllPosts(int num,String sPath){
		return getAllPosts(" limit 0,"+(num<0?1:num),null,sPath);						//mysql
//		return getAllPosts(" fetch first "+(num<0?1:num)+" rows only",null,sPath);	//db2
	}
	public static ArrayList<PostBean> getAllPosts(String param,String sPath){
		return getAllPosts(param,null,sPath);
	}
	/**
	 * 帖子-获得所有的帖子
	 * @return ArrayList<PostBean>
	 */
	public static ArrayList<PostBean> getAllPosts(String param,String msg,String sPath){
		ArrayList<PostBean> list = new ArrayList<PostBean>();
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String sql = "select post.*,nickName from post,user_info where post.inputUser=user_info.userName and isInUse=1 order by top desc,inputTime desc"+param;
		ResultSet rs = DBConnection.executeQuery(conn, sql);
		try {
			while(rs.next()){
				PostBean postBean = new PostBean();
				postBean.setPostId(rs.getString("postId"));
				postBean.setSortNo(rs.getString("sortNo"));
				postBean.setTitle(rs.getString("title"));
				postBean.setContent(rs.getString("content"));
				postBean.setReadNum(rs.getInt("readNum"));
				postBean.setReplayNum(rs.getInt("replayNum"));
				postBean.setPraiseNum(rs.getInt("praiseNum"));
				postBean.setNicePost(rs.getInt("nicePost"));
				postBean.setTop(rs.getInt("top"));
				postBean.setInputTime(rs.getString("inputTime"));
				postBean.setInputUser(rs.getString("inputUser"));
				String nickName = rs.getString("nickName");
				if(Common.isBlank(nickName))
					postBean.setInputUserName(postBean.getInputUser());
				else
					postBean.setInputUserName(nickName);
//				postBean.setUserHead(rs.getString("head"));
//				postBean.setUserRank(rs.getString("rank"));
				postBean.setUpdateTime(rs.getString("updateTime"));
				postBean.setIsInUse(rs.getInt("isInUse"));
				boolean flag = Pattern.matches("^[0-9]+[_][0-9a-zA-Z_]+[.]htm$", postBean.getContent());
				if(flag){
					postBean.setContent(MyFile.readFileByLines(sPath+postBean.getContent()));
				}
				list.add(postBean);
			}
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"获取所有帖子出错...");
			return null;
		}
		return list;
	}
	
	/**11
	 * 帖子-获得所有的精品帖子
	 * @return ArrayList<PostBean>
	 */
	public static ArrayList<PostBean> getAllNicePosts(){
		ArrayList<PostBean> list = new ArrayList<PostBean>();
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String sql = "select post.*,nickName from post,user_info where post.inputUser=user_info.userName and isInUse=1 and nicePost=1 order by top desc, inputTime desc";
		ResultSet rs = DBConnection.executeQuery(conn, sql);
		try {
			while(rs.next()){
				PostBean postBean = new PostBean();
				postBean.setPostId(rs.getString("postId"));
				postBean.setSortNo(rs.getString("sortNo"));
				postBean.setTitle(rs.getString("title"));
//				postBean.setContent(rs.getString("content"));
				postBean.setReadNum(rs.getInt("readNum"));
				postBean.setReplayNum(rs.getInt("replayNum"));
				postBean.setPraiseNum(rs.getInt("praiseNum"));
				postBean.setNicePost(rs.getInt("nicePost"));
				postBean.setTop(rs.getInt("top"));
				postBean.setInputTime(rs.getString("inputTime"));
				postBean.setInputUser(rs.getString("inputUser"));
				String nickName = rs.getString("nickName");
				if(Common.isBlank(nickName))
					postBean.setInputUserName(postBean.getInputUser());
				else
					postBean.setInputUserName(nickName);
//				postBean.setUserHead(rs.getString("head"));
//				postBean.setUserRank(rs.getString("rank"));
				postBean.setUpdateTime(rs.getString("updateTime"));
				postBean.setIsInUse(rs.getInt("isInUse"));
				list.add(postBean);
			}
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"获取精品帖子出错...");
			return null;
		}
		return list;
	}
	
	/**5
	 * 帖子-根据指定ID获取帖子
	 * @return ArrayList<PostBean>
	 */
	public static PostBean getPostById(String postId,String sPath){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String updateSql = "update post set readNum = readNum+1 where postId=?";
		DBConnection.executeSQL(conn, updateSql,postId);
		String sql = "select post.*,user_info.nickName,user_info.head,user_info.rank from post,user_info where post.inputUser=user_info.userName and postId=? and isInUse=1";
		ResultSet rs = DBConnection.executeQuery(conn, sql,postId);
		PostBean postBean = new PostBean();
		try {
			if(rs.next()){
				postBean.setPostId(rs.getString("postId"));
				postBean.setSortNo(rs.getString("sortNo"));
				postBean.setTitle(rs.getString("title"));
				postBean.setContent(rs.getString("content"));
				postBean.setReadNum(rs.getInt("readNum"));
				postBean.setReplayNum(rs.getInt("replayNum"));
				postBean.setPraiseNum(rs.getInt("praiseNum"));
				postBean.setNicePost(rs.getInt("nicePost"));
				postBean.setTop(rs.getInt("top"));
				postBean.setInputTime(rs.getString("inputTime"));
				postBean.setInputUser(rs.getString("inputUser"));
				String nickName = rs.getString("nickName");
				if(Common.isBlank(nickName))
					postBean.setInputUserName(postBean.getInputUser());
				else
					postBean.setInputUserName(nickName);
				postBean.setUserHead(rs.getString("head"));
				postBean.setUserRank(rs.getInt("rank"));
				postBean.setUpdateTime(rs.getString("updateTime"));
				postBean.setIsInUse(rs.getInt("isInUse"));
			}
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"获取指定帖子出错...");
			return null;
		}
		boolean flag = Pattern.matches("^[0-9]+[_][0-9a-zA-Z_]+[.]htm$", postBean.getContent());
		if(flag){
			postBean.setContent(MyFile.readFileByLines(sPath+postBean.getContent()));
		}
		return postBean;
	}
	/***************************************************与帖子回复有关的一些方法***************************************/
	/**6
	 * 帖子-根据指定ID和grade获取所有的回复
	 * @return ArrayList<ReplayBean>
	 */
	public static ArrayList<ReplayBean> getAllReplay(String id,int grade){
		ArrayList<ReplayBean> list = new ArrayList<ReplayBean>();
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String sql = "select replay.*,user_info.nickName,user_info.head,user_info.rank from replay,user_info"+
					" where replay.inputUser=user_info.userName and replay4Id=? and grade="+grade+" order by replay.inputTime asc";
		ResultSet rs = DBConnection.executeQuery(conn, sql,id);
		try {
			while(rs.next()){
				ReplayBean replayBean = new ReplayBean();
				replayBean.setReplayId(rs.getString("replayId"));
				replayBean.setReplay4Id(rs.getString("replay4Id"));
				replayBean.setGrade(rs.getInt("grade"));
				replayBean.setReplayNum(rs.getInt("replayNum"));
				replayBean.setPraiseNum(rs.getInt("praiseNum"));
				replayBean.setComment(rs.getString("comment"));
				replayBean.setInputTime(rs.getString("inputTime"));
				replayBean.setInputUser(rs.getString("inputUser"));
				String nickName = rs.getString("nickName");
				if(Common.isBlank(nickName))
					replayBean.setInputUserName(replayBean.getInputUser());
				else
					replayBean.setInputUserName(nickName);
				replayBean.setUserHead(rs.getString("head"));
				replayBean.setUserRank(rs.getInt("rank"));
				replayBean.setUpdateTime(rs.getString("updateTime"));
				list.add(replayBean);
			}
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"根据postId获取回复出错...");
			return null;
		}
		return list;
	}
	/**7
	 * 回复帖子-根据指定ID获取指定的回复
	 * @return ArrayList<ReplayBean>
	 */
	public static ReplayBean getReplayById(String replayId){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String sql = "select replay.*,user_info.nickName,user_info.head,user_info.rank from replay,user_info where replay.inputUser=user_info.userName and replayId=?";
		ResultSet rs = DBConnection.executeQuery(conn, sql,replayId);
		ReplayBean replayBean = new ReplayBean();
		try {
			if(rs.next()){
				replayBean.setReplayId(rs.getString("replayId"));
				replayBean.setReplay4Id(rs.getString("replay4Id"));
				replayBean.setGrade(rs.getInt("grade"));
				replayBean.setReplayNum(rs.getInt("replayNum"));
				replayBean.setPraiseNum(rs.getInt("praiseNum"));
				replayBean.setComment(rs.getString("comment"));
				replayBean.setInputTime(rs.getString("inputTime"));
				replayBean.setInputUser(rs.getString("inputUser"));
				String nickName = rs.getString("nickName");
				if(Common.isBlank(nickName))
					replayBean.setInputUserName(replayBean.getInputUser());
				else
					replayBean.setInputUserName(nickName);
				replayBean.setUserHead(rs.getString("head"));
				replayBean.setUserRank(rs.getInt("rank"));
				replayBean.setUpdateTime(rs.getString("updateTime"));
			}
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"获取指定回复出错...");
			return null;
		}
		return replayBean;
	}
	/**8
	 * 回复帖子-发表回复
	 * @return ArrayList<RepalyBean>
	 */
	public static String publishReplay(String replay4Id,int grade,String content,String inputTime,String inputUser){
//		content = content.replace("#|#","&").replace("#@#","%");
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String updateRank = "update user_info set rank = rank+2 where userName=?";
		String insertSql = "insert into replay(replayId,replay4Id,grade,replayNum,praiseNum,comment,inputUser,inputTime,updateTime) values(?,?,"+grade+",0,0,?,?,?,'')";
		String updateSql ="";
		if(grade==1)
			updateSql = "update post set replayNum = replayNum+1 where postId =?";
		else
			updateSql = "update replay set replayNum = replayNum+1 where replayId =?";
		String replayId = Common.getSerialNo(conn,"replay", "replayId");
		if(Common.isBlank(inputTime)) inputTime = Common.getTime();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e1) {
			e1.printStackTrace();
			return null;
		}
		boolean flag1 = DBConnection.executeSQL(conn, updateRank,inputUser);
		boolean flag2 = DBConnection.executeSQL(conn, insertSql, replayId ,replay4Id ,content,inputUser,inputTime);
		boolean flag3 = DBConnection.executeSQL(conn, updateSql,replay4Id);
		try {
			conn.commit();
			conn.setAutoCommit(true);
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"提交事务或者关闭连接出错...");
			return null;
		}
		return (flag1&&flag2&&flag3)+";"+replayId+";"+inputTime;
	}
	/**9
	 * 回复帖子-编辑回复
	 * @return String
	 * @throws SQLException 
	 */
	public static String updateReplay(String replayId,String comment,String updateTime,String inputUser){
//		comment = comment.replace("#|#","&").replace("#@#","%");
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String sql = "update replay set comment=?,updateTime=? where replayId=? and inputUser=?";
		if(Common.isBlank(updateTime)) updateTime = Common.getTime();
		boolean flag = DBConnection.executeSQL(conn, sql ,comment,updateTime,replayId,inputUser);
		try {
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
			return null;
		}
		return flag+";"+replayId;
	}
	/**10
	 * 回复帖子-删除回复
	 * @return String
	 * @throws SQLException 
	 */
	public static String deleteReplay(String replayId,String replay4Id,int grade,String roleId,String inputUser){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e1) {
			MyLog.getLogError(e1,"设置事务非自动提交出错...");
			return null;
		}
		int role = Integer.parseInt(roleId);
		String delSql = "";
		String updateSql = "";
		if(role>2)
			delSql = "delete from replay where inputUser='"+inputUser+"' and replayId=?";
		else
			delSql = "delete from replay where replayId=?";
		if(grade==1)
			updateSql = "update post set replayNum = replayNum-1 where postId =?";
		else
			updateSql = "update replay set replayNum = replayNum-1 where replayId =?";
		boolean flag1 = DBConnection.executeSQL(conn, delSql, replayId);
		boolean flag2 = DBConnection.executeSQL(conn, updateSql, replay4Id);
		try {
			conn.commit();
			conn.setAutoCommit(true);
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"提交事务或者关闭连接出错...");
			return null;
		}
		return (flag1&&flag2)+";";
	}
	/**12
	 * 帖子-切换置顶效果
	 * @return String
	 * @throws SQLException 
	 */
	public static String switchTop(String postId,String top,String roleId){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		int role = Integer.parseInt(roleId);
		String sql = "";
		boolean sign = false;
		if(role>2)
			return "false;";
		else{
			if(top.equals("1")) sql = "update post set top =0 where postId =?";
			else {sql = "update post set top =1 where postId =?";sign=true;}
		}
		boolean flag = DBConnection.executeSQL(conn, sql, postId);
		try {
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
			return null;
		}
		return flag+";"+sign;
	}
	/**13
	 * 帖子-切换精品效果
	 * @return String
	 * @throws SQLException 
	 */
	public static String switchNicePost(String postId,String nicepost,String roleId){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		int role = Integer.parseInt(roleId);
		String sql = "";
		boolean sign = false;
		if(role>2)
			return "false;";
		else{
			if(nicepost.equals("1")) sql = "update post set nicepost =0 where postId =?";
			else {sql = "update post set nicepost =1 where postId =?";sign=true;}
		}
		boolean flag = DBConnection.executeSQL(conn, sql, postId);
		try {
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
			return null;
		}
		return flag+";"+sign;
	}
	/**
	 * 点赞或者取消点赞
	 * @return String
	 */
	public static String doPraise(String postId,String inputUser){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		String msg = "";
		boolean flag = false;
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e1) {
			msg = "设置事务非自动提交出错...";
			MyLog.getLogError(e1,msg);
			return flag+";"+msg;
		}
		String sQuerySql = "select postId from praise where postId=? and inputUser=?";
		ResultSet rs = DBConnection.executeQuery(conn, sQuerySql,postId,inputUser);
		try {
			String num_operation = "";
			if(rs.next()){
				String delSql = "delete from praise where postId=? and inputUser=?";
				flag = DBConnection.executeSQL(conn, delSql, postId,inputUser);
				num_operation = "-1";
			}
			else{
				String insertSql = "insert into praise(postId,inputUser) values(?,?)";
				flag = DBConnection.executeSQL(conn, insertSql, postId,inputUser);
				num_operation = "+1";
			}
			String updateSql = "update post set praiseNum=praiseNum"+num_operation+" where postId=?";
			flag = DBConnection.executeSQL(conn, updateSql, postId)&&flag;
			conn.commit();
			conn.setAutoCommit(true);
			conn.close();
		} catch (SQLException e) {
			msg = "点赞功能出错...";
			MyLog.getLogError(e,msg);
			return flag+";"+msg;
		}
		return flag+";"+msg;
	}
	/**
	 * 判断某个人对某个帖子是否点赞
	 */
	public static boolean getPraiseStatus(String postId,String inputUser){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		boolean flag = false;
		String sQuerySql = "select postId from praise where postId=? and inputUser=?";
		ResultSet rs = DBConnection.executeQuery(conn, sQuerySql,postId,inputUser);
		try {
			if(rs.next())
				flag=true;
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
			return false;
		}
		return flag;
	}
	/**
	 * 获取对某个帖子点赞的所有人
	 */
	public static ArrayList<UserBean> getPraisePerson(String postId){
		DBConnection db = new DBConnection();
		Connection conn = db.getConn();
		ArrayList<UserBean> list = new ArrayList<UserBean>();
		String sQuerySql = "select u.userName,u.nickName from user_info as u, praise where postId=? and u.userName=praise.inputUser";
		ResultSet rs = DBConnection.executeQuery(conn, sQuerySql,postId);
		try {
			while(rs.next()){
				UserBean user = new UserBean();
				user.setUserName(rs.getString("userName"));
				user.setNickName(rs.getString("nickName"));
				list.add(user);
			}
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
			return list;
		}
		return list;
	}
}
