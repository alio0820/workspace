<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.sql.*,swu.edu.cn.bean.*,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>南川区科学发展工作考核网</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script src="../js/Clock.js" type=text/javascript></script>
<style type='text/css'>
			table.xiangmu td {
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:center;
				overflow:hidden;
				font-size:12px;
				width:90px;	
				padding:4px;			
				}
			table.xiangmu th{
				border:1px solid #9AB5D0;	
				width:690px;
				padding:3px;
				font-size:15px;
				color:white;
				text-align:left;
			}
			.borderleft {
				border-left:1px solid #6F9FC0;
			}
			a{
				text-decoration:none;
				color:black;
			}
</style>
<%	String position;
	String href1="#";
	Object position1 = session.getAttribute("position");
	if(position1==null){
		position="bumen";
		href1= "../index_duty/dutyIndicatorB.jsp";
	}
	else{
		position=position1.toString();
		if(position.equals("department")){
			position = "bumen";
			href1= "../index_duty/dutyIndicatorB.jsp";
		}
		else if(position.equals("qufenguan_lead")){
			position = "qufenguan";
			href1= "../index_qfg/qfgProjectReview.jsp";
		}
		else if(position.equals("duchashi_lead")){
			position = "ducahshi";
			href1= "../index_dcs/dcsProjectReview.jsp";
		}
		else if(position.equals("lead_lead")){
			position = "leader";
			href1 = "../index_leader/leadProjectPS.jsp";
		}
	}
 %>
</head>
<body>
<div class="zhong">
  <div class="banner"><embed src="../images/nanchuan2.swf" style="width:1000px;height:150px;"></embed></div>
  <div class="menu" >
    <div class="menusel" style="width:95px;">
      <h2><a href="index.jsp">首页</a></h2>
    </div>
    <div id="menu1" class="menusel">
      <h2><a href="departClassify.jsp">部门分类</a></h2>
      <div class="position">
        <ul class="clearfix typeul">
        </ul>
      </div>
    </div>
    <div id="menu2" class="menusel">
      <h2><a href="indicatorBrowse.jsp">指标浏览</a></h2>
      <div class="position">
        <ul class="clearfix typeul">
        </ul>
      </div>
    </div>
    <div id="menu3" class="menusel">
      <h2><a href="<%=href1 %>">项目管理</a></h2>
      <div class="position">
        <ul class="clearfix typeul">
       <% if(position.equals("bumen")){ %>
          <li><a href="../index_duty/dutyIndicatorB.jsp">责任项目</a></li>
	   	  <li><a href="../index_duty/dutyProjectReview.jsp">项目审核</a></li>
		  <li><a href="../index_duty/dutyProgressReport.jsp">进度申报</a></li>
		  <li><a href="../index_duty/dutyProgressReportF.jsp">重新申报</a></li>
		<%}else if(position.equals("qufenguan")){ %>
		  <li><a href="../index_qfg/qfgProjectReview.jsp">区领导审核</a></li>
		<%}else if(position.equals("duchashi")){ %>
		  <li><a href="../index_dcs/dcsProjectReview.jsp">督查室审核</a></li>
		<%}else{ %>
		  <li><a href="../index_leader/leadProjectPS.jsp">领导批示</a></li>
		<%} %>
		  <li class="lli"><a href="projectInquires.jsp">搜索</a></li>
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
        <input type="image" src="../images2/12.png" style="float:right" onclick="javascript:alert('正在搜索...')"/>
    </div>
  </div>
 
  <div class="main">
  <div style="min-height:560px;color:black;height:auto;">
  	<div id="departClassify_top" style="height:20px;margin-bottom:10px">
        <div style="margin-left:10px;margin-right:10px;float:right"><span id="clock"></span></div>
        <div style='float:left;margin-right:100px'>欢迎  [<%=session.getAttribute("departmentName")%>] [<%=session.getAttribute("realName")%>] 光临</div>
        <div style="float:left;"><span style="font-weight:bold">当前位置：</span>
                <a href="../index/index.jsp" style="color:rgb(120,48,120);">南川考评网</a>&gt;
                <a href="departClassify.jsp" style="color:rgb(120,48,120);">部门分类</a>
        </div>
    </div>
  	<div id="left" style="width:280px; float:left; overflow:hidden;">
    	<div class="box_1" style="border:1px solid lightblue;">
	        <div class="left_title">科学发展工作考核动态系统</div>
	        <div>
		        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center">
		          <tr>
		            <td width="32%" height="37" valign="middle">用户名：</td>
		            <td width="68%" valign="middle">
		              <span><%=session.getAttribute("user") %></span>
		            </td>
		          </tr>
		          <tr>
		            <td height="37" valign="middle">部　门：</td>
		            <td valign="middle">
		              <span><%=session.getAttribute("department") %></span>
		            </td>
		          </tr>
		          <tr>
		            <td height="37" valign="middle">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
		            <td valign="middle">
		              <span><%=session.getAttribute("realName") %></span>
		            </td>
		          </tr>
		          <tr>
		            <td height="37" valign="middle">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
		            <td valign="middle">
		              <span><%=session.getAttribute("mail") %></span>
		            </td>
		          </tr>
		        </table>
	        </div>	        
      	</div>
      	<div class="box_1" style="border:1px solid lightblue;">
	        <div class="left_title">领导批示</div>
	        <div>
		        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center">
		          <tr>
		            <td width="32%" height="37" valign="middle">用户名：</td>
		            <td width="68%" valign="middle">
		              <span><%=session.getAttribute("user") %></span>
		            </td>
		          </tr>
		          <tr>
		            <td height="37" valign="middle">部　门：</td>
		            <td valign="middle">
		              <span><%=session.getAttribute("department") %></span>
		            </td>
		          </tr>
		          <tr>
		            <td height="37" valign="middle">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
		            <td valign="middle">
		              <span><%=session.getAttribute("realName") %></span>
		            </td>
		          </tr>
		          <tr>
		            <td height="37" valign="middle">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
		            <td valign="middle">
		              <span><%=session.getAttribute("mail") %></span>
		            </td>
		          </tr>
		        </table>
	        </div>	        
      	</div>
    </div>
    <div id="right" style="width:690px;float:right;margin-right:10px;margin-top:0px;">       						
    <%  int i=0;
		DepartmentManagement  dm=new DepartmentManagement();
		dm.OpenDB();
		ArrayList<DepartmentBean>  list=dm.searchAllDepartment();
		DepartmentBean db_forward =list.get(0);
		for(DepartmentBean db:list){
			if(i==0){
				out.println("<table class='xiangmu' cellSpacing=0 cellPadding=4 style='border:1px solid #6F9FC0;'>");
				out.print("<tr><th colspan='10' style='background:#3399CC'><span>"+db.getSecondClassify()+"</span></th></tr>");
			}										
			if(db.getSecondClassify().equals(db_forward.getSecondClassify())){
				if(i%10 ==0){
					out.println("<tr>");
					out.println("<td class='borderleft'>");
				}else{
					out.println("<td>");
				}											
				out.println("<a href='departIndicatorBrowse.jsp?dpId="+db.getDepartmentId()+"&dpName="+db.getDepartmentName()+"'>"+db.getDepartmentName()+"</a></td>");	
				if((i+1)%10 ==0) {
					out.println("</tr>");
		 		}			
			}else{
				i=0;	//改变一个类别过后重置i;
				if(i%10!=0)
					out.println("</tr></table><table style='height:10px;'></table>");
				else
					out.println("</table><table style='height:10px;'></table>");
				out.print("");
				out.println("<table class='xiangmu' cellSpacing=0 cellPadding=4 style='border:1px solid #6F9FC0;'>");
				out.print("<tr><th colspan='10' style='background:#3399CC'><span>"+db.getSecondClassify()+"</span></th></tr>");	//小标题
				out.println("<tr><td class='borderleft'><a href='departIndicatorBrowse.jsp?dpId="+db.getDepartmentId()+"&dpName="+db.getDepartmentName()+"'>"+db.getDepartmentName()+"</a></td>");	//小标题的子项
			}
			db_forward = db;
			i++;
		}
		if(i%10 !=0) {
			out.println("</tr></table><table style='height:10px;'></table>");     
		}							
		dm.CloseDB();
	%> 
    </div>
    <div style="clear:both;"></div>
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
<script src="../js/meun.js" type="text/javascript"></script>
</body>
</html>
