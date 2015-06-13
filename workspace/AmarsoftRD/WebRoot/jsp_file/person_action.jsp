<%@ page language="java" import="java.util.*,com.action.PersonAction,com.bean.UserBean" pageEncoding="utf-8"%>
<%
	//userName sex nickName remark birthday birthplace school phone
	String head = request.getParameter("head");
	String oldpwd = request.getParameter("oldpwd");
	String pwd = request.getParameter("pwd");
	String userName = request.getParameter("userName");
	String sex = request.getParameter("sex");
	String nickName = request.getParameter("nickName");
	String remark = request.getParameter("remark");
	String birthday = request.getParameter("birthday");
	String birthplace = request.getParameter("birthplace");
	String school = request.getParameter("school");
	String phone = request.getParameter("phone");
	String msg = "";
	UserBean user2 = PersonAction.getUserFromSession(session);
	if(user2!=null||user2.getRoleId().equals("4")){
		if(head!=null){
			msg = PersonAction.changeHeadPortrait(session,userName,head);
		}
		if(pwd!=null){
			msg = PersonAction.changePwd(userName,oldpwd,pwd);
		}
		if(sex!=null){
			msg = PersonAction.updatePersonInfo(1,session,sex,nickName,remark,userName);
		}
		if(birthday!=null){
			msg = PersonAction.updatePersonInfo(2,session,birthday,birthplace,school,phone,userName);
		}
	}
	else{
		msg="false;请先登录...";
	}
	String status = "false";
	String info = "";
	if(msg!=null){
		int i = msg.indexOf(";");
		status = msg.substring(0,i);
		info = msg.substring(i+1);
	}
	out.print("{status:'"+status+"',info:'"+info+"'}");
%>
