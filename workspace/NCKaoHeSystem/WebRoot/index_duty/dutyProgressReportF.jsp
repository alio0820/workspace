<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.bean.*,swu.edu.cn.sql.*,java.text.DecimalFormat;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>南川区科学发展工作考核网</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script src="../js/Clock.js" type=text/javascript></script>
<style type="text/css">
			body{
				font-size:14px;
			}
			table.xiangmu td {
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:left;
				overflow:hidden;
				font-size:14px;
				padding:3px;				
				}	
			table.xiangmu th {
				border-top:1px solid #6F9FC0;
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:center;
				font-size:15px;	
				padding:5px;			
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
<%
			String departmentId="department001";  //session.get(....);
%>
<div class="zhong" >
  <div class="banner"><embed src="../images/nanchuan2.swf" style="width:1000px;height:150px;"></embed></div>
  <div class="menu" >
    <div class="menusel" style="width:95px;">
      <h2><a href="/index/index.jsp">首页</a></h2>
    </div>
    <div id="menu1" class="menusel">
      <h2><a href="/index/departClassify.jsp">部门分类</a></h2>
      <div class="position">
        <ul class="clearfix typeul">
        </ul>
      </div>
    </div>
    <div id="menu2" class="menusel">
      <h2><a href="/index/indicatorBrowse.jsp">指标浏览</a></h2>
      <div class="position">
        <ul class="clearfix typeul">
        </ul>
      </div>
    </div>
    <div id="menu3" class="menusel">
      <h2><a href="dutyIndicatorBrowse.jsp">项目管理</a></h2>
      <div class="position">
        <ul class="clearfix typeul">
          <li><a href="dutyIndicatorB.jsp">责任项目</a></li>
	   	  <li><a href="dutyProjectReview.jsp">项目审核</a></li>
		  <li><a href="dutyProgressReport.jsp">进度申报</a></li>
		  <li><a href="dutyProgressReportF.jsp">重新申报</a></li>
		  <li class="lli"><a href="dutyProjectInquires.jsp">搜索</a></li>
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
  <div style="color:black;height:auto;">
  	<div id="qujikaoping_top" style="height:20px;margin-bottom:10px">
        <div style="margin-left:10px;margin-right:10px;float:right"><span id="clock"></span></div>
        <div style='float:left;'>欢迎  [<%=session.getAttribute("departmentName")%>] [<%=session.getAttribute("realName")%>] 光临</div>
        <div style="float:left;margin-left:100px"><span style="font-weight:bold">当前位置：</span>
                <a href="/index/index.jsp" style="color:rgb(120,48,120);">南川考评网</a>&gt;
                <a href="/index_duty/dutyProgressReport.jsp" style="color:rgb(120,48,120);">进度申报</a>
        </div>
    </div>
    <div id="right" style="width:976px;height:auto;margin:0 10px 5px 5px;border:1px solid lightblue;min-height:500px;">      
       		<div style='margin:5px 0px 5px 3px;'>
	       		1.项目指标申报失败的如下：		
			</div>
       		<table class='xiangmu' width='976px' cellspacing='0'>
				<tr style='background:#91C7E1'>
					<th width='150px' class='borderleft'>
						<span>项目名称</span>
					</th>
					<th width='30px'>
						<span>月份</span>
					</th>
					<th width='100px'>
						<span>该月进度</span>
					</th>
					<th width='200px'>
						<span>具体事项</span>
					</th>
					<th width='60px'>
						<span>牵头部门审批</span>
					</th>
					<th width='100px'>
						<span>牵头部门批示</span>
					</th>
					<th width='76px'>
						<span>区分管领导审批</span>
					</th>
					<th width='100px'>
						<span>区分管领导批示</span>
					</th>
					<th width='60px'>
						<span>督查室审批</span>
					</th>
					<th width='100px'>
						<span>督查室批示</span>
					</th>												
				</tr>
				<%
				  //取出该部门当前月份未申报的所有项目																								
				    ProjectManagement  pm=new ProjectManagement();
				    pm.OpenDB();					
				    ArrayList<ProjectMonthRecordBean> list= pm.searchProjectFaildByLeadDepatrment(departmentId);
					if(list.size()==0)
							out.println("您所在的部门没有任何项目申报失败");
								
					for(ProjectMonthRecordBean  pmrb:list){
						out.println("<tr>");
						DecimalFormat df = new DecimalFormat("###0.0#");
						int jindu_bar =(int)(100*pmrb.getMonthProgress());
						String jindu_baifenbi=df.format(pmrb.getMonthProgress()*100.00)+"";
						out.print(	"<td width='150px' class='borderleft'><span>"+pmrb.getProjectName()+"</span></td>");
						out.print("<td width='30px'><span>"+pmrb.getEvaMonth()+"</span></td>");
						out.print("<td width='100px'><div id='jindu_bar' style='background:white;width:100px;height:20px;border:1px solid #91C7E1;'>");
						out.print("<div id='jindu' style='background:#91C7E1;width:"+jindu_bar+"px;height:20px;float:left'>"+jindu_baifenbi+"%</div></div></td>");
						out.print("<td width='300px'><span>"+pmrb.getMonthFinish()+"</span></td>");				//该月事项
						String status=pmrb.getStatus();
						out.print("<td ><span>"+pm.CTS(status,0)+"</span></td>");
						out.print("<td width='60px'><span>"+pmrb.getFirstView()+"</span></td>");			//牵头部门审批																			
						out.print("<td ><span>"+pm.CTS(status,1)+"</span></td>");
						out.print("<td width='60px'><span>"+pmrb.getSecondView()+"</span></td>");			//区分管领导审批
						out.print("<td ><span>"+pm.CTS(status,2)+"</span></td>");
						out.print("<td width='60px'><span>"+pmrb.getThirdView()+"</span></td>");			//督查室审批
						out.println("</tr>");
					}
					pm.CloseDB();									
				%>				
			</table>
			<div style='margin:5px 0px 5px 3px;'>
	       		2.非项目指标申报失败的如下：		
			</div>
			<table class='xiangmu' width='976px' cellspacing='0'>
				<tr style='background:#91C7E1'>
					<th width='150px' class='borderleft'>
						<span>考核指标</span>
					</th>
					<th width='30px'>
						<span>月份</span>
					</th>
					<th width='300px'>
						<span>具体事项</span>
					</th>
					<th width='60px'>
						<span>牵头部门审批</span>
					</th>
					<th width='100px'>
						<span>牵头部门批示</span>
					</th>
					<th width='76px'>
						<span>区分管领导审批</span>
					</th>
					<th width='100px'>
						<span>区分管领导批示</span>
					</th>
					<th width='60px'>
						<span>督查室审批</span>
					</th>
					<th width='100px'>
						<span>督查室批示</span>
					</th>
				</tr>
				<%
				  //取出该部门当前月份未申报的所有项目																													
				    ArrayList<NoProjectEvaluationBean> list1= pm.searchNoProjectFaildEvaluation(departmentId);
					if(list.size()==0)
							out.println("您所在的部门没有任何非项目指标申报失败");
								
					for(NoProjectEvaluationBean  pmrb:list1){
						out.println("<tr>");
						out.print("<td width='150px' class='borderleft'><span>"+pmrb.getEvaluationContent()+"</span></td>");
						out.print("<td width='30px'><span>"+pmrb.getEvaMonth()+"</span></td>");						
						out.print("<td width='300px'><span>"+pmrb.getMonthFinish()+"</span></td>");				//该月事项
						String status=pmrb.getStatus();
						out.print("<td ><span>"+pm.CTS(status,0)+"</span></td>");
						out.print("<td width='60px'><span>"+pmrb.getFirstView()+"</span></td>");			//牵头部门审批																			
						out.print("<td ><span>"+pm.CTS(status,1)+"</span></td>");
						out.print("<td width='60px'><span>"+pmrb.getSecondView()+"</span></td>");			//区分管领导审批
						out.print("<td ><span>"+pm.CTS(status,2)+"</span></td>");
						out.print("<td width='60px'><span>"+pmrb.getThirdView()+"</span></td>");			//督查室审批
						out.println("</tr>");
					}
					pm.CloseDB();									
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
<script src="../js/meun.js" type="text/javascript"></script>
</body>
</html>
