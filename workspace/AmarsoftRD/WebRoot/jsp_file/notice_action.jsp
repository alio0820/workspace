<%@ page language="java" import="java.util.*,com.action.*,com.bean.UserBean,com.common.Common,com.action.PersonAction" pageEncoding="utf-8"%>
<%
	//topic call publisher time content
	String noticeId = request.getParameter("noticeId");
	String title = request.getParameter("title");
	String call = request.getParameter("call");
	String publisher = request.getParameter("publisher");
	String time = request.getParameter("time");
	String content = request.getParameter("content");
	String inputUser = "";
	String msg = "";
	UserBean user2 = PersonAction.getUserFromSession(session);
	if(user2!=null||user2.getRoleId().equals("4")){
		inputUser = user2.getUserName();
		if(request.getHeader("User-Agent").toLowerCase().indexOf("firefox") < 0){
			if(!Common.isBlank(content))
				content = new String(content.getBytes("ISO-8859-1"),"utf-8");
			if(!Common.isBlank(title))
				title = new String(title.getBytes("ISO-8859-1"),"utf-8");
			if(!Common.isBlank(publisher))
				publisher = new String(publisher.getBytes("ISO-8859-1"),"utf-8");
			if(!Common.isBlank(call))
				call = new String(call.getBytes("ISO-8859-1"),"utf-8");
		}
		
		if(noticeId==null){
			msg = NoticeAction.publishNotice(title,call,content,publisher,time,inputUser);
		}else if(title!=null){
			msg = NoticeAction.updateNotice(noticeId,title,call,content,publisher,time,inputUser);
		}else{
			msg = NoticeAction.deleteNotice(noticeId,inputUser);
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
	out.print("{status:'"+status+"',id:'"+info+"'}");
%>
