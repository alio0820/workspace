<%@ page language="java" import="java.util.*,com.tool.MyFile" pageEncoding="utf-8"%>
<%
	//userName sex nickName remark birthday birthplace school phone
	String sPath = request.getParameter("sPath");
	if(request.getHeader("User-Agent").toLowerCase().indexOf("firefox") < 0)
		sPath = new String(sPath.getBytes("ISO-8859-1"),"utf-8");
	boolean flag = MyFile.deleteFolder(request.getRealPath("/")+sPath);
	String status = flag+"";
	out.print("{status:'"+status+"',info:''}");
%>
