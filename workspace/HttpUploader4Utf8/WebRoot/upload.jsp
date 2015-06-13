<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%@ page import = "Xproer.*" %><%@ page import="org.apache.commons.lang.StringUtils" %><%@ page import="com.jspsmart.upload.*" %><%
/*
	单文件上传页面，只负责将文件块在服务端拼接成一个完整文件。
	更新记录：
		2012-05-25 完善
*/
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

com.jspsmart.upload.SmartUpload up = new com.jspsmart.upload.SmartUpload();
//初始化
up.initialize(pageContext);
//设置上载 的最大值
up.setMaxFileSize(500 * 1024 * 1024);
//上载文件
up.upload();
	
String md5 			= up.getRequest().getParameter("md5");
String strFileSize 	= up.getRequest().getParameter("FileSize");
String strRangePos 	= up.getRequest().getParameter("RangePos");

//参数为空
if ( StringUtils.isBlank( strFileSize )
	|| StringUtils.isBlank( md5 )
	|| StringUtils.isBlank( strRangePos ) )
{
	XDebug.Output("fileSize", strFileSize);
	XDebug.Output("md5", md5);
	XDebug.Output("param is null");
	return;
}

if (strFileSize.length() > 0
	&& md5.length() > 0
	&& strRangePos.length() > 0)
{
	long fileSize 	= Long.parseLong(strFileSize);
	long rangePos 	= Long.parseLong(strRangePos);

	com.jspsmart.upload.File rangeFile = up.getFiles().getFile(0);
	long rangeSize = rangeFile.getSize();//控件上传的文件块大小
	
	{
		//已上传大小 = 文件块索引 + 临时文件块大小
		long postedLength = rangePos + rangeSize;
		//上传百分比 = 已上传大小 / 文件总大小
		double per = ((double)postedLength / (double)fileSize) * 100;
		double perd = Math.round(per);
		String postedPercent = Double.toString(perd) + "%";
		
		//创建上传文件夹
		HttpUploaderCfg cfg = new HttpUploaderCfg(this.getServletContext());
		cfg.CreateUploadPath();
		
		//保存文件块数据
		FileResumer res = new FileResumer(this.getServletContext(),request);
		res.m_RangePos = rangePos;
		res.m_FileSize = fileSize;
		res.SaveFileRange(rangeFile,cfg.GetUploadPath(),md5,fileSize);
	}
	out.write("ok");
}
%>