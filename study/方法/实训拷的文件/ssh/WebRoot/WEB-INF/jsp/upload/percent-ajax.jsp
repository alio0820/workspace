<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page language="java"%>
<%@page import="com.bestsoft.ssh.databean.UploadFile"%>
<%@page import="com.bestsoft.ssh.comm.Util"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link href="css/base-090628.css" rel="stylesheet" type="text/css" />
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/tab.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="./js/upload/upload.js"></script>
<%
response.setContentType("text/html");
response.setHeader("cache-control","no-store");
response.setHeader("pragrma","no-cache");
response.setDateHeader("expires",0);
UploadFile uploadFile = (UploadFile)request.getAttribute("uploadFile");
double sumSize = 0.0;
double uploaded = 0.0;
double hasSize = 0.0;
int percent = 0;
String unit = "";
if(uploadFile!=null){
 sumSize = uploadFile.getSize()/1024;
 if(sumSize>1024){
     sumSize = uploadFile.getSize()/1024/1024;
	 uploaded = uploadFile.getUploaded()/1024/1024;
	 hasSize =  sumSize-uploaded;
	 unit = "MB";
 }else{
	 uploaded = uploadFile.getUploaded()/1024;
	 hasSize =  sumSize-uploaded;
	 unit = "KB";
 }
 percent = uploadFile.getPercent();
}
%>
   <%if(uploadFile!=null){%>
		    <tr>
		        <Td>
		            上传中的文件:<%=uploadFile.getName()%>
		           <div class="Progress-Bar-bg" style="height:20;width:441px">
                   <div class="Progress-bar-color" style="float: left;height:20;width:<%=percent*4.4%>px"></div>
		        </Td>
		    </tr>
		    <Tr>
		        <Td>
                    </div>
                       大小:<%=Util.roundDouble(sumSize,2)%>(<%=unit%>),已传:<%=Util.roundDouble(uploaded,2)%>(<%=unit%>),剩余:<%=Util.roundDouble(hasSize,2)%>(<%=unit%>),
                    <span><%="上传进度:"+percent+"%"%> </span>
		        </Td>
		    </Tr>
<input type="hidden" id="path" value="<%=uploadFile.getPath()%>" />
<%}%>
<input type="hidden" id="messageInfo" value="<s:property value="messageInfo"/>" />
