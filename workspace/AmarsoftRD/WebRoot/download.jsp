<%@ page language="java" import="java.util.*,java.io.*,com.common.MyLog" pageEncoding="utf-8"%>
<%
	String fileName = request.getParameter("data");
	fileName =new String(fileName.getBytes("ISO-8859-1"),"utf-8");
	fileName = fileName.replaceAll("@@@@","+");
	String filePath = request.getRealPath("")+"/"+fileName;
	int index = fileName.lastIndexOf("/");
	fileName = fileName.substring(index+1);
	MyLog.getLogInfo("文件《"+fileName+"》正在被下载...");
%>

<%
	File downFile=new File(filePath);
	if(downFile.exists()){
		response.setContentType("application/x-msdownload");
		//response.setHeader("Location",fileName);
		//response.setHeader("Cache-Control", "max-age=" + cacheTime);
		if(request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0){	//IE浏览器
			fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
			fileName = fileName.replaceAll("\\+","%20");//修复空格在IE下变为+问题
		}
		else if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0){	//firefox浏览器
			fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
			fileName = "\""+fileName+"\"";
		}
		else
			fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
		response.setHeader("Content-Disposition", "attachment; filename="+fileName);
		//response.setContentLength(filelength);
		OutputStream outputStream = response.getOutputStream();
		InputStream inputStream = new FileInputStream(filePath);
		byte[] buffer = new byte[1024];
		int i = -1;
		while ((i = inputStream.read(buffer)) != -1) {
			outputStream.write(buffer, 0, i);
		}
		outputStream.flush();
		outputStream.close();
		inputStream.close();
		outputStream = null;
		out.clear();  
		out = pageContext.pushBody();
	}
	else{
		out.println("<script>alert('该文件不存在');history.back();</script>");
	}
	
	/*getOutputStream() has already been called for this response异常出现的原因和解决方法：
	jsp中出现此错误一般都是在jsp中使用了输出流（如输出图片验证码，文件下载等），没有妥善处理好的原因。

	具体的原因：jsp编译成servlet之后在函数的最后有一段这样的代码Java代码
    finally {  
          if (_jspxFactory != null)   
              _jspxFactory.releasePageContext(_jspx_page_context);  
    }  
	这里是在释放在jsp中使用的对象，会调用response.getWriter(),因为这个方法是和response.getOutputStream()相冲突的！
	所以会出现以上这个异常。然后当然是要提出解决的办法，其实挺简单的，在使用完输出流以后调用以下两行代码即可：
	out.clear();  
	out = pageContext.pushBody();
	*/
%>