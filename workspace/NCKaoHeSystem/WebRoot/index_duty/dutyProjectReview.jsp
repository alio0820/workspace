<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.bean.*,swu.edu.cn.sql.*"%>
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
		<% String  leadDeparmtentId = "department052";
		%>
		<script type='text/javascript'>
			function shenhe(projectId,taskMonth){
				var name =projectId+"_"+taskMonth;
				var selectName= "select_"+name;
				alert(selectName);
				var yijian = document.getElementsByName("text_"+name)[0].value;
				alert(yijian);
				var tongguo = document.getElementsByName(selectName)[0].value;			//table中的select无法通过form对象来取得
				alert(tongguo);
				document.form1.action="projectR_shenheQiantou.action?projectId="+projectId+"&taskMonth="+taskMonth+"&tongguo="+tongguo+"&yijian="+yijian;
		        document.form1.submit();
			}
			function shenhe_feixm(evaluationId, taskMonth){
				var name =evaluationId+"_"+taskMonth;
				var selectName= "select_"+name;
				alert(selectName);
				var yijian = document.getElementsByName("text_"+name)[0].value;
				alert(yijian);
				var tongguo = document.getElementsByName(selectName)[0].value;			//table中的select无法通过form对象来取得
				alert(tongguo);
				document.form1.action="projectR_shenheQiantou_feixm.action?projectId="+evaluationId+"&taskMonth="+taskMonth+"&tongguo="+tongguo+"&yijian="+yijian+"&departmentId=<%=leadDeparmtentId%>";
		        document.form1.submit();
			}
		</script>
</head>
<body>
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
      <h2><a href="dutyIndicatorB.jsp">项目管理</a></h2>
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
  	<div id="dutyProject_top" style="height:20px;margin-bottom:10px">
        <div style="margin-left:10px;margin-right:10px;float:right"><span id="clock"></span></div>
        <div style='float:left;'>欢迎  [<%=session.getAttribute("departmentName")%>] [<%=session.getAttribute("realName")%>] 光临</div>
        <div style="float:left;margin-left:100px"><span style="font-weight:bold">当前位置：</span>
                <a href="/index/index.jsp" style="color:rgb(120,48,120);">南川考评网</a>&gt;
                <a href="dutyProjectReview.jsp" style="color:rgb(120,48,120);">项目审核</a>
        </div>
    </div>
    <div id="right" style="width:976px;height:auto;margin:0 10px 5px 5px;border:1px solid lightblue;min-height:500px;"> 
    <form name='form1' method='post'>
    </form>
    	<div style='margin:5px 0px 5px 3px;'>
	       		1.项目指标审核：		
		</div>
      	<table class='xiangmu' width='976px' cellSpacing=0 cellPadding=4>
			<tr style='background:#91C7E1'>
				<th width='150px' class='borderleft'>
					<span>项目名称</span>
				</th>
				<th width='100px'>
					<span>责任部门</span>
				</th>
				<th width='20px'>
					<span>月份</span>
				</th>
				<th width='300px'>
					<span>该月进展情况</span>
				</th>
				<th width='90px'>
					<span>完成资金(万元)</span>
				</th>
				<th width='60px'>
					<span>该月进度</span>
				</th>			
				<th width='60px'>
					<span>牵头部门审批</span>
				</th>	
				<th width='166px'>
					<span>牵头部门批示</span>
				</th>
				<th width='60px'>
					<span>审核提交</span>
				</th>
			</tr>
			<%
				ProjectManagement  pm=new ProjectManagement();
				pm.OpenDB();

						ArrayList<ProjectMonthRecordBean> list= pm.searchProjectByLeadDepatrment(leadDeparmtentId);
				if(list.size()==0)
					out.println("您所在的部门该月份没有项目需要申报");
				String money;
				for(ProjectMonthRecordBean prb:list ){
					if(prb.getIsMoney().trim().equals("true"))
						money = prb.getMonthMoney()+"";
					else
						money = "-";
					String projectId= prb.getProjectId();
					int  taskMonth= prb.getEvaMonth();
					String name = projectId+"_"+taskMonth;
					out.println("<tr><td width='150px' class='borderleft'>"+prb.getProjectName()+"</td>");
					out.println("<td width='100px'>"+prb.getResDepartmentName()+"</td>");
					out.println("<td width='30px'>"+prb.getEvaMonth()+"</td>");
					out.println("<td width='300px'>"+prb.getMonthFinish()+"</td>");
					out.println("<td width='60px'>"+money+"</td>");
					out.println("<td width='60px'>"+prb.getMonthProgress()+"</td>");
					out.println("<td width='60px'><select name='select_"+name+"'><option value='T' selected>通过</option><option value='F'>不通过</option></select></td>");
					out.println("<td width='166px'><textarea name='text_"+name+"'></textarea></td>");%>
					<td width='60px'><input type='button' value='提交' onclick="shenhe('<%=projectId %>','<%=taskMonth %>')"/></td></tr>											
				<%}%>
		</table>
		<div style='margin:5px 0px 5px 3px;'>
	       		2.非项目指标审核：
		</div>
		<table class='xiangmu' width='976px' cellSpacing=0 cellPadding=4>
			<tr style='background:#91C7E1'>
				<th width='200px' class='borderleft'>
					<span>考核指标</span>
				</th>
				<th width='100px'>
					<span>责任部门</span>
				</th>
				<th width='300px'>
					<span>该月进展情况</span>
				</th>
				<th width='60px'>
					<span>牵头部门审批</span>
				</th>
				<th width='256px'>
					<span>牵头部门批示</span>
				</th>
				<th width='60px'>
					<span>审核提交</span>
				</th>
			</tr>
			<%
				ArrayList<NoProjectEvaluationBean> list1= pm.searchNoProjectByLeadDepatrment(leadDeparmtentId);
				if(list.size()==0)
					out.println("您所在的部门该月份没有非项目指标需要申报");
				for(NoProjectEvaluationBean  npeb:list1){
					String evaluationId= npeb.getEvaluationId();
					int  taskMonth= npeb.getEvaMonth();
					String name = evaluationId+"_"+taskMonth;
					out.println("<tr>");
					out.println("<td width='200px' class='borderleft'><span>"+npeb.getEvaluationContent()+"</span></td>");
					out.println("<td width='100px'><span>"+npeb.getEvaDepartmentName()+"</span></td>");
					out.println("<td width='300px'><span>"+npeb.getMonthFinish()+"</span></td>");
					out.println("<td width='60px'><select name='select_"+name+"'><option value='T' selected>通过</option><option value='F'>不通过</option></select></td>");
					out.println("<td><textarea style='width:256px;height:40px;font-size:12px;' name='text_"+npeb.getEvaluationId()+"' maxlength='100'></textarea></td>");%>
					<td width='60px'><input type='button' value='提交' onclick="shenhe_feixm('<%=evaluationId %>','<%=taskMonth %>')"/></td></tr>	
				<%  out.println("</tr>");
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
<body>%</body>
</html>
