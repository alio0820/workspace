<%@ page language="java" import="java.util.*,com.action.*,com.bean.UserBean,com.tool.MyFile,com.common.Common" pageEncoding="utf-8"%>
<%
	//topic call publisher time content
	String method = request.getParameter("method");
	String postId = request.getParameter("postId");
	String replayId = request.getParameter("replayId");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String grade = request.getParameter("grade");
	String inputUser = "";
	if(request.getHeader("User-Agent").toLowerCase().indexOf("firefox") < 0){
		if(!Common.isBlank(content))
			content = new String(content.getBytes("ISO-8859-1"),"utf-8");
		if(!Common.isBlank(title))
			title = new String(title.getBytes("ISO-8859-1"),"utf-8");
	}
	UserBean user2 = PersonAction.getUserFromSession(session);
	String msg = "";
	if(user2!=null&&!user2.getRoleId().equals("4")){
		String sPath = application.getRealPath("/")+"document/post_resources/";
		inputUser = user2.getUserName();
		if(method.equals("1")){
			msg = PostAction.publishPost(title,content,"",inputUser,sPath);
		}else if(method.equals("2")){
			msg = PostAction.updatePost(postId,title,content,"",inputUser,sPath); 
		}else if(method.equals("3")){
			msg = PostAction.deletePost(postId,user2.getRoleId(),inputUser,sPath);
		}else if(method.equals("4")){
			int grade_int = Integer.parseInt(grade);
			msg = PostAction.publishReplay(postId,grade_int,content,"",inputUser);
		}
		else if(method.equals("5")){
			msg = PostAction.updateReplay(replayId,content,"",inputUser);
	    }
		else if(method.equals("6")){
			int grade_int = Integer.parseInt(grade);
			msg = PostAction.deleteReplay(replayId,postId,grade_int,user2.getRoleId(),inputUser);
	    }
		else if(method.equals("7")){
			msg = PostAction.switchTop(postId,content,user2.getRoleId());
	    }
		else if(method.equals("8")){
			msg = PostAction.switchNicePost(postId,content,user2.getRoleId());
	    }
		else if(method.equals("9")){
			msg = PostAction.doPraise(postId,user2.getUserName());
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
