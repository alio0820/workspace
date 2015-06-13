<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.bean.*,swu.edu.cn.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>南川区科学发展工作考核网</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script src="js/Clock.js" type=text/javascript></script>
<style type="text/css">
			table.xiangmu td {
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:left;
				overflow:hidden;
				font-size:12px;
				padding:3px;				
				}	
			table.xiangmu th {
				border-top:1px solid #6F9FC0;
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:center;
				font-size:14px;	
				padding:3px;			
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
      <h2><a href="xiangqing.hjsp">综合考核</a></h2>
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
  <div style="color:black;height:auto;">
  	<div id="qujikaoping_top" style="height:20px;">
        <div style="margin-right:120px;margin-left:10px;float:left"><span id="clock"></span></div>
        <div style="float:left"><span style="font-weight:bold">当前位置：</span>
                <a href="index.jsp" style="color:rgb(120,48,120);">南川考评网</a>&gt;
                <a href="kaohezhibiao.jsp" style="color:rgb(120,48,120);"> 考核指标</a>
        </div>
    </div>
    <div id="right" style="width:976px;height:auto;margin:0 10px 5px 10px;border:1px solid lightblue;min-height:500px;">      
            						<table class='xiangmu' width='976px' style="border-collapse:collapse;border-spacing:0;">
									<tr style='background:#91C7E1' style="height:30px">
										<th width='60px' class='borderleft'>
											<span>编号</span>
										</th>
										<th width='200px' >
											<span>考核指标</span>
										</th>
										<th width='150px'>
											<span>牵头责任单位</span>
										</th>
										<th width='566px'>
											<span>考核标准</span>
										</th>																													
									</tr>
								<%
									EvaluationFormManagement  efm=new EvaluationFormManagement();
									efm.OpenDB();
									
									ArrayList<EvaluationFormBean> list=efm.showEvaluationForm();
									
									for(EvaluationFormBean efb:list){
										out.print("<tr><td width='60px' class='borderleft'>"+efb.getEvaluationID()+"</td>");
										out.print("<td width='200px'><a href='fenlei.jsp?classify="+efb.getTopClass()+"'>"+efb.getTopClass()+"[<font style='color:rgb(21.2%, 43.1%, 72.9%);'>详情</font>]</a></td>");
										out.print("<td width='150px'>"+efb.getLeadDepartment()+"</td>");
										out.println("<td width='700px'>"+efb.getStandard()+"</td></tr>");																				
									}
									efm.CloseDB();
								 %>
								 </table>
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
