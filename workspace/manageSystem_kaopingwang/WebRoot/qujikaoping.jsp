<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.sql.DepartmentManagement,swu.edu.cn.sql.DBConnection,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>南川区科学发展工作考核网</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script src="js/Clock.js" type=text/javascript></script>
<style type='text/css'>
			table.xiangmu td {
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:center;
				overflow:hidden;
				font-size:12px;
				width:90px;	
				padding:3px;			
				}
			table.xiangmu th{
				border:1px solid #9AB5D0;	
				width:690px;
				padding:3px;
				font-size:15px;
			}
			.borderleft {
				border-left:1px solid #6F9FC0;
			}
			a{
				text-decoration:none;
				color:black;
			}
</style>
</head>
<body>
<div class="zhong" >
  <div class="banner"><embed src="images/nanchuan2.swf" style="width:1000px;height:150px;"></embed></div>
  <div class="menu" >
    <div class="menusel" style="width:95px;">
      <h2><a href="index.jsp">首页</a></h2>
    </div>
    <div id="menu1" class="menusel">
      <h2><a href="qujikaoping.jsp">区级考评</a></h2>
      <div class="position">
        <ul class="clearfix typeul">
        </ul>
      </div>
    </div>
    <div id="menu2" class="menusel">
      <h2><a href="kaohezhibiao.jsp">考核指标</a></h2>
      <div class="position">
        <ul class="clearfix typeul">
        </ul>
      </div>
    </div>
    <div id="menu3" class="menusel">
      <h2><a href="xiangqing.jsp">综合考核</a></h2>
      <div class="position">
        <ul class="clearfix typeul">
          <li><a href="#">工作介绍</a></li>
          <li><a href="#">组织架构</a></li>
          <li class="lli"><a href="#">考核对象</a></li>
        </ul>
      </div>
    </div>    
    <div id="menu4" class="menusel">
      <h2><a href="#">下载中心</a></h2>
       <div class="position">
        <ul class="clearfix typeul">
        </ul>
      </div>
    </div>
    <div id="menu5" class="menusel">
      <h2><a href="#">在线留言</a></h2>
      <div class="position">
        <ul class="clearfix typeul">
          <li><a href="#">发表留言</a></li>
          <li><a href="#">留言列表</a></li>
          <li><a href="#">留言</a></li>
          <li><a href="#">建议</a></li>
          <li class="lli"><a href="#">投诉</a></li>
        </ul>
      </div>
    </div>
    <div style="float:right;height:36px;width:240px;">
    	<input type="text" name="search" style="height:18px;width:160px;margin-top:7px;float:left;margin-right:5px;"/>
        <input type="image" src="images2/12.png" style="float:right" onclick="javascript:alert('正在搜索...')"/>
    </div>
  </div>
 
  <div class="main">
  <div style="min-height:560px;color:black;height:auto;">
  	<div id="qujikaoping_top" style="height:20px;">
        <div style="margin-right:90px;margin-left:10px;float:left"><span id="clock"></span></div>
        <div><span style="font-weight:bold">当前位置：</span>
                <a href="index.jsp" style="color:rgb(120,48,120);">南川考评网</a>&gt;
                <a href="qujikaoping.jsp" style="color:rgb(120,48,120);"> 区级考评</a>
        </div>
    </div>
  	<div id="left" style="width:280px; float:left; overflow:hidden;">
    	<div class="box_1" style="border:1px solid lightblue;">
        <div class="left_title">科学发展工作考核动态系统</div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center">
          <tr>
            <td width="32%" height="37" valign="middle">用户名：</td>
            <td width="68%" valign="middle">
              <input type="text" name="user" id="textfield" class="input_1" size=""/>
            </td>
          </tr>
          <tr>
            <td height="37" valign="middle">密　码：</td>
            <td valign="middle">
              <input type="text" name="password" id="textfield2" class="input_2"/>
            </td>
          </tr>
          <tr>
            <td height="37" valign="middle">验证码：</td>
            <td valign="middle">
              <input type="text" name="textfield3" id="textfield3" class="input_3" />
              <span style="margin-left:6px;"><img src="images/img_7.gif" /></span></td>
          </tr>
          <tr>
            <td colspan="2">
              <input name="input" type="image" src="images/img_4.gif" onclick='javascript:alert("用户名为空");'/>
              <input name="input" type="image" src="images/img_5.gif" onclick='javascript:alert("你正在注册");' style="margin:0 10px;"/>
              <input name="input" type="image" src="images/img_6.gif" onclick='javascript:alert("申请找回密码");'/>
            </td>
          </tr>
        </table>
      	</div>
    </div>
    <div id="right" style="width:690px;float:right;margin-right:10px;margin-top:0px;">
        <div>
            						<%out.println("<table class='xiangmu' cellSpacing=0 cellPadding=4 >");
									out.print("<tr><th colspan='10' style='background:#91C7E1'><center><span>区级部门</span><span><a id='a' href='javascript:void(0)' onclick='hideClass(");
									out.print('"'+"quji"+'"'+','+'"'+"a"+'"');
									out.println(");'>[收起]</a></span></center></th></tr>");
									int i=0;
									DBConnection  DBConn=new DBConnection();
									DBConn.OpenDB();
									String selectSQL="select  departmentID,departmentName,departmentClassify from Department";
									ResultSet rs=DBConn.SelectDB(selectSQL); 
									rs.next() ;
									while(rs.getString("departmentClassify").equals("区级部门")){
			
											if(i%10 ==0) {
												out.println("<tr class='quji'>");
												out.println("<td class='borderleft'>");
												//<td class='borderleft'>
											}else{
											out.println("<td>");
											}
								//			out.println("<td width='11%' bgcolor='#92b8e2'>第"+rs.getInt("departmentID")+"题</td>");	
											
											out.println("<a href='departmentEvaluation.jsp?departmentId="+rs.getString("departmentID")+"'>"+rs.getString("departmentName")+"</a></td>");	
											if((i+1)%10 ==0) {
												out.println("</tr>");
											}			
											i++;
											rs.next() ;		
										}
										if((i)%10 !=0) {
												out.println("</tr>");
											}
										i=0;
										out.println("<tr><th colspan='13' style='background:#91C7E1'><span>园区管委会</span><span><a id='b' href='javascript:void(0)' onclick='hideClass("+'"'+"yuanqu"+'"'+","+'"'+"b"+'"'+");'>[收起]</a></span></th></tr>");
										while(rs.getString("departmentClassify").equals("园区管委会")){
											
											if(i%10 ==0) {
												out.println("<tr class='yuanqu'>");
												out.println("<td class='borderleft'>");
												//<td class='borderleft'>
											}else{
												out.println("<td>");
											}
								//			out.println("<td width='11%' bgcolor='#92b8e2'>第"+rs.getInt("departmentID")+"题</td>");	
											out.println("<a href='departmentEvaluation.jsp?departmentId="+rs.getString("departmentID")+"'>"+rs.getString("departmentName")+"</a></td>");	
											if((i+1)%10 ==0) {
												out.println("</tr>");
											}			
											i++;
											rs.next() ;			
										}
										if((i)%10 !=0) {
												out.println("</tr>");
											}
										i=0;
										out.println("<tr><th colspan='13' style='background:#91C7E1'><span>乡镇街道</span><span><a id='c' href='javascript:void(0)' onclick='hideClass("+'"'+"xiangz"+'"'+","+'"'+"c"+'"'+");'>[收起]</a></span></th></tr>");
										rs.previous();
										while(rs.next() && rs.getString("departmentClassify").equals("乡镇街道")){
											
												if(i%10 ==0) {
												out.println("<tr class='xiangz'>");
												out.println("<td class='borderleft'>");
												//<td class='borderleft'>
											}else{
												out.println("<td>");
											}
								//			out.println("<td width='11%' bgcolor='#92b8e2'>第"+rs.getInt("departmentID")+"题</td>");	
											out.println("<a href='departmentEvaluation.jsp?departmentId="+rs.getString("departmentID")+"'>"+rs.getString("departmentName")+"</a></td>");		
											if((i+1)%10 ==0) {
												out.println("</tr>");
											}			
											i++;
													
										}
										if((i)%10 !=0) {
												out.println("</tr>");
											}
										out.print("</table>");							
										DBConn.CloseDB();
										%>
        </div>
    </div>
  </div>
  <div class="bottom"> 
  <table cellpadding="3" cellspacing="0" width="100%">
  	<tr>
    	<td style='font-size:25px;border-right:1px solid lightblue;height:70px;width:500px;'>
        	南川区综合考评委员会办公室
        </td>
        <td>
        	<table border="0" cellpadding="" cellspacing="1" width="80%" style="text-align:left;margin-left:50px;font-size:13px">
            	<tbody>
                	<tr>
                    	<td style="color:red">
                        	<a href="#" target="_blank" style="color:red">网站简介</a>&nbsp;&nbsp;|&nbsp;
                            <a href="#" target="_blank" style="color:red">联系我们</a>&nbsp;&nbsp;|&nbsp;
                            <a href="#" target="_blank" style="color:red">保存网站</a>&nbsp;&nbsp;|&nbsp;
                        </td>
                    </tr>
                    <tr><td>Copyright &copy; 2012 南川区综合考评委员会办公室</td></tr>
                    <tr><td>技术支持：1007工作室</td></tr>
                    <tr><td>自2012年5月1日起，您是本站第21926位访问者</td></tr>
                </tbody>
            </table>
        </td>
    </tr>
  </table>
 </div>
</div>
</div>
<script type=text/javascript>
    var clock = new Clock();
    clock.display(document.getElementById("clock"));
</script>
<script src="js/meun.js" type="text/javascript"></script>
</body>
</html>
