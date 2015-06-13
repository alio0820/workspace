<%@ page language="java" import="java.util.*,com.tool.MyFile,com.bean.FileBean,com.bean.UserBean,com.action.PersonAction" pageEncoding="utf-8"%>
<%
	String sPath = request.getParameter("sPath");
	if(request.getHeader("User-Agent").toLowerCase().indexOf("firefox") < 0)
		sPath = new String(sPath.getBytes("ISO-8859-1"),"utf-8");
	int role = 4;
	UserBean user2 = PersonAction.getUserFromSession(session);
	if(user2!=null) role =Integer.parseInt(user2.getRoleId());
	ArrayList<FileBean> list = MyFile.getFileList(application.getRealPath("/"),sPath);
	for(FileBean fileBean :list){
%>
	<a class="header" path="<%=fileBean.getCurrentPath()%>" isFolder="<%=fileBean.isFolder()%>">
		<%if(fileBean.isFolder()){%>
			<i class="icon-folder-close icon"></i>
		<%}else{%>
			<i class="icon-file icon"></i>
		<%}%>
		<%=fileBean.getName()%>
		<%if(role<=2){%><div class="close"></div><%}%>
	</a>
	<%if(fileBean.isFolder()){%>
	<div class="content">
	</div>
	<%}%>
	
<%}%>