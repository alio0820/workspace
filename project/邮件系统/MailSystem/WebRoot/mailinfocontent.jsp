<%@ page language="java" import="java.util.*,com.mail.*" pageEncoding="GBK"%>
<script src="js/jquery-1.7.1.js"></script>
<script src="js/mailInfo.js"></script>

<script type="text/javascript">
//	mailInfojs.currentpage = '<%=request.getParameter("currentpage")%>';
//	mailInfojs.id = '<%=request.getParameter("id")%>';
</script>
<style type="text/css">
body {
    font-family: arial,verdana,sans-serif;
    font-size: 14px;
    line-height: 1.666;
    margin: 0;
    min-height: 100px;
    overflow: auto;
    padding: 0;
    white-space: normal;
    word-wrap: break-word;
}
td, input, button, select, body {
    font-family: Helvetica,'Microsoft Yahei',verdana;
}
</style>
<%
	int currentpage = Integer.parseInt(request.getParameter("currentpage"));
	int id = Integer.parseInt(request.getParameter("id"));
	String content = IMAPGetMail.getMailContent(currentpage, id,session);
	int content_i = content.indexOf('<');
	out.println(content_i<0?content:content.substring(content_i));
%>