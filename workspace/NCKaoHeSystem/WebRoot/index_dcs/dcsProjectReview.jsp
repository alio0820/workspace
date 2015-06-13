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
<script type='text/javascript'>
	function shenhe(projectId,taskMonth,isMoney){
		var name =projectId+"_"+taskMonth;
		var selectName= "select_"+name;
		alert(selectName);
		var yijian = document.getElementsByName("text_"+name)[0].value;
		var tongguo = document.getElementsByName(selectName)[0].value;			//table中的select无法通过form对象来取得
		alert(tongguo);
		document.form1.action="projectR_duchashenhe.action?projectId="+projectId+"&taskMonth="+taskMonth+"&tongguo="+tongguo+"&yijian="+yijian+"&isMoney="+isMoney;
        document.form1.submit();
	}
	function shenhe_feixm(evaluationId,taskMonth,departmentId){
		var name =evaluationId+"_"+taskMonth;
		var selectName= "select_"+name;
		alert(selectName);
		var yijian = document.getElementsByName("text_"+name)[0].value;
		var tongguo = document.getElementsByName(selectName)[0].value;			//table中的select无法通过form对象来取得
		alert(tongguo);
		document.form1.action="projectR_qufenguan_feixm.action?projectId="+evaluationId+"&taskMonth="+taskMonth+"&tongguo="+tongguo+"&yijian="+yijian+"&departmentId="+departmentId;
        document.form1.submit();
	}
</script>
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
<div class="banner">
	<embed src="../images/nanchuan2.swf"
		style="width:1000px;height:150px;"></embed>
</div>
<div class="menu">
	<div class="menusel" style="width: 95px;">
		<h2>
			<a href="../index/index.jsp">首页</a>
		</h2>
	</div>
	<div id="menu1" class="menusel">
		<h2>
			<a href="../index/departClassify.jsp">部门分类</a>
		</h2>
		<div class="position">
			<ul class="clearfix typeul">
			</ul>
		</div>
	</div>
	<div id="menu2" class="menusel">
		<h2>
			<a href="../index/indicatorBrowse.jsp">指标浏览</a>
		</h2>
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
		<h2>
			<a href="#">下载中心</a>
		</h2>
		<div class="position">
			<ul class="clearfix typeul">
			</ul>
		</div>
	</div>
	<div id="menu5" class="menusel">
		<h2>
			<a href="#">在线留言</a>
		</h2>
		<div class="position">
			<ul class="clearfix typeul">
				<li>
					<a href="#">发表留言</a>
				</li>
				<li>
					<a href="#">留言列表</a>
				</li>
				<li>
					<a href="#">留言</a>
				</li>
				<li>
					<a href="#">建议</a>
				</li>
				<li class="lli">
					<a href="#">投诉</a>
				</li>
			</ul>
		</div>
	</div>
	<div style="float: right; height: 36px; width: 240px;">
		<input type="text" name="search"
			style="height: 18px; width: 160px; margin-top: 7px; float: left; margin-right: 5px;" />
		<input type="image" src="../images2/12.png" style="float: right"
			onclick="javascript:alert('正在搜索...')" />
	</div>
</div>

<div class="main">
	<div style="color: black; height: auto;">
		<div id="departClassify_top"
			style="height: 20px; margin-bottom: 10px">
			<div style="margin-left: 10px; margin-right: 10px; float: right">
				<span id="clock"></span>
			</div>
			<div style='float: left;'>
				欢迎 [<%=session.getAttribute("departmentName")%>] [<%=session.getAttribute("realName")%>]
				光临
			</div>
			<div style="float: left; margin-left: 100px">
				<span style="font-weight: bold">当前位置：</span>
				<a href="../index/index.jsp" style="color: rgb(120, 48, 120);">南川考评网</a>&gt;
				<a href="dutyProjectInquires.jsp"
					style="color: rgb(120, 48, 120);">搜索</a>
			</div>
		</div>
    <div id="right" style="width:976px;height:auto;margin:0 10px 5px 5px;border:1px solid lightblue;min-height:500px;padding-top:10px;">  
    <form name='form1' method='post'> 
    </form>
    	<div style='margin:5px 0px 5px 3px;'>
	       		1.项目指标审核：		
		</div>   
    	<table class='xiangmu' width='1365px' style='margin-left:-200px;background-color:white;' cellSpacing=0 cellPadding=4>
		<tr style='background:#91C7E1'>
			<th width='200px' class='borderleft'>
				<span>项目名称</span>
			</th>
			<th width='150px'>
				<span>责任部门</span>
			</th>
			<th width='30px'>
				<span>月份</span>
			</th>
			<th width='225px'>
				<span>该月进展情况</span>
			</th>
			<th width='90px'>
				<span>该月进度</span>
			</th>
			<th width='70px'>
				<span>牵头部门审批</span>
			</th>
			<th width='100px'>
				<span>牵头部门批示</span>
			</th>
			<th width='75px'>
				<span>区分管领导审批</span>
			</th>
			<th width='100px'>
				<span>区分管领导批示</span>
			</th>
			<th width='75px'>
				<span>督查室审批</span>
			</th>
			<th width='200px'>
				<span>督查室批示</span>
			</th>
			<th width='50px'>
				<span>审核提交</span>
			</th>							
		</tr>
		<%
			ProjectManagement pm=new ProjectManagement();
			pm.OpenDB();
			
			ArrayList<ProjectMonthRecordBean> list=pm.DuchaViewList();
			for(ProjectMonthRecordBean pmrb:list ){
					String projectId= pmrb.getProjectId();
					int taskMonth= pmrb.getEvaMonth();
					String name = projectId+"_"+taskMonth;
					String isMoney = pmrb.getIsMoney().trim();
					System.out.println(name);
					out.println("<tr><td  class='borderleft'>"+pmrb.getProjectName()+"</td>");
					out.println("<td >"+pmrb.getResDepartmentName()+"</td>");
					out.println("<td >"+pmrb.getEvaMonth()+"</td>");
					out.println("<td >"+pmrb.getMonthFinish()+"</td>");
					out.println("<td >"+pmrb.getMonthProgress()+"</td>");
					out.println("<td >"+pmrb.getStatus().charAt(0)+"</td>");
					out.println("<td >"+pmrb.getFirstView()+"</td>");
					out.println("<td >"+pmrb.getStatus().charAt(1)+"</td>");
					out.println("<td >"+pmrb.getSecondView()+"</td>");
					out.println("<td ><select name='select_"+name+"'><option value='T' selected>通过</option><option value='F'>不通过</option></select></td>");
					out.println("<td ><textarea  style ='width:190px;height:35px;' name='text_"+name+"'></textarea></td>");%>
					<td width='60px' style='text-align:center'><input type='button' value='提交' onclick="shenhe('<%=projectId %>','<%=taskMonth %>','<%=isMoney %>')"/></td></tr>										
			<%}
			pm.CloseDB();
		 %>
	</table>
	<div style='margin:5px 0px 5px 3px;'>
	     2.非项目指标审核：
	</div>
			<table class='xiangmu' width='1176px' style='margin-left:-200px;background-color:white;' cellSpacing=0 cellPadding=4>
			<tr style='background:#91C7E1'>
				<th width='150px' class='borderleft'>
					<span>考核指标</span>
				</th>
				<th width='100px'>
					<span>责任部门</span>
				</th>
				<th width='286px'>
					<span>该月进展情况</span>
				</th>
				<th width='60px'>
					<span>牵头部门审批</span>
				</th>
				<th width='120px'>
					<span>牵头部门批示</span>
				</th>
				<th width='80px'>
					<span>区分管领导审批</span>
				</th>
				<th width='120px'>
					<span>区分管领导批示</span>
				</th>
				<th width='80px'>
					<span>督查室审批</span>
				</th>
				<th width='120px'>
					<span>督查室批示</span>
				</th>
				<th width='60px'>
					<span>审核提交</span>
				</th>
			</tr>
			<%
				ArrayList<NoProjectEvaluationBean> list1= pm.DuchaNoProjectViewList();
				if(list.size()==0)
					out.println("您所在的部门该月份没有非项目指标需要申报");
				for(NoProjectEvaluationBean  npeb:list1){
					String evaluationId= npeb.getEvaluationId().trim();
					int  taskMonth= npeb.getEvaMonth();
					String name = evaluationId+"_"+taskMonth;
					out.println("<tr>");
					out.println("<td width='200px' class='borderleft'><span>"+npeb.getEvaluationContent()+"</span></td>");
					out.println("<td width='100px'><span>"+npeb.getEvaDepartmentName()+"</span></td>");
					out.println("<td width='236px'><span>"+npeb.getMonthFinish()+"</span></td>");
					out.println("<td width='60px'><span>"+pm.CTS(npeb.getStatus(),0)+"</span></td>");
					out.println("<td width='120px'><span>"+npeb.getFirstView()+"</span></td>");
					out.println("<td width='80px'><span>"+pm.CTS(npeb.getStatus(),1)+"</span></td>");
					out.println("<td width='120px'><span>"+npeb.getSecondView()+"</span></td>");
					out.println("<td width='80px'><select name='select_"+name+"'><option value='T' selected>通过</option><option value='F'>不通过</option></select></td>");
					out.println("<td width='120px'><textarea style='width:256px;height:40px;font-size:12px;' name='text_"+name+"' maxlength='100'></textarea></td>");%>
					<td width='60px' style='text-align:center'><input type='button' value='提交' onclick="shenhe_feixm('<%=evaluationId %>','<%=taskMonth%>','<%=npeb.getEvaDepartmentId().trim()%>')"/></td></tr>	
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
</body>
</html>
