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
<body onload='select_yue_init()'>
<%
	String  departmentId= "department119";//session.getAttribute("departmentId").toString();
	String strTaskMonth= request.getParameter("taskMonth");
	int taskMonth;
	if(strTaskMonth==null){
	taskMonth=(new Date()).getMonth()+1;
	}else{
	taskMonth=Integer.parseInt(strTaskMonth);
	}
%>
<script type='text/javascript'>
	function shenbao(name,isMoney){
		 var name = name;
		 alert(name);
		 var projectId= name.substring(7);
		 var rate = document.getElementsByName(name)[0].value;
		 var actualFinish = document.getElementsByName(name)[1].value;
		 var taskMonth = document.form1.select_yue.value;
		 document.form1.action="projectR_shenbao.action?projectId="+projectId+"&rate_string="+rate+"&actualFinish="+actualFinish+"&taskMonth="+taskMonth+"&isMoney="+isMoney;
	     document.form1.submit(); 
	}
	function shenbao_feixm(name,departmentId){
		alert(name);
		var projectId= name.substring(7);
		var actualFinish = document.getElementsByName(name)[0].value;
		var taskMonth = document.form1.select_yue.value;
		document.form1.action="projectR_shenbao_feixm.action?projectId="+projectId+"&actualFinish="+actualFinish+"&taskMonth="+taskMonth+"&departmentId="+departmentId;
	    document.form1.submit();
	}
	function shenbao_yue(){
		var taskMonth = document.select_yue.value;				//下拉框的对象可以通过form对象去取得[选下拉框就发生动作]
		document.form1.action="projectR_shenbao_yue.action?taskMonth="+taskMonth;
        document.form1.submit();
	}
	function select_yue_init(){
		document.form1.select_yue.value=<%=taskMonth%>;
		document.getElementById('tip').innerHTML=<%=taskMonth%>+'月';
	}
</script>
<div class="zhong" >
  <div class="banner"><embed src="../images/nanchuan2.swf" style="width:1000px;height:150px;"></embed></div>
  <div class="menu" >
    <div class="menusel" style="width:95px;">
      <h2><a href="../index/index.jsp">首页</a></h2>
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
                <a href="dutyProgressReport.jsp" style="color:rgb(120,48,120);">进度申报</a>
        </div>
    </div>
    <div id="right" style="width:976px;height:auto;margin:0 10px 5px 5px;border:1px solid lightblue;min-height:500px;">
    	<form name='form1' method='post'>     	     
	       	 <div style='margin:5px 0px 5px 3px;'>
	       		选择需要申报的月份：(
				<select name='select_yue' onchange='shenbao_yue()'>
					<option value='1'>1</option>
					<option value='2'>2</option>
					<option value='3'>3</option>
					<option value='4'>4</option>
					<option value='5'>5</option>
					<option value='6'>6</option>
					<option value='7'>7</option>
					<option value='8'>8</option>
					<option value='9'>9</option>
					<option value='10'>10</option>
					<option value='11'>11</option>
					<option value='12'>12</option>
				</select>
				月)，您当前正在申报的月份为：<label id='tip' style='color:red'></label>
			</div>
			<div style='margin:5px 0px 5px 3px;'>
	       		1.项目指标进度申报：		
			</div>
		</form>
			<table class='xiangmu' width='976px' cellSpacing=0 cellPadding=4>
				<tr style='background:#91C7E1'>
					<th width='80px' class='borderleft'>
						<span>考核指标</span>
					</th>
					<th width='140px'>
						<span>项目名称</span>
					</th>
					<th width='100px'>
						<span>累积进度</span>
					</th>
					<th width='80px'>
						<span>资金(元)</span>
					</th>
					<th width='80px'>
						<span>本月进度</span>
					</th>
					<th width='446px'>
						<span>具体事项<font style='color:rgb(201,201,201)'>（小于100个字）</font></span>
					</th>
					<th width='50px'>
						<span>申报</span>
					</th>													
				</tr>
				<%
					//取出该部门当前月份未申报的所有项目																								
					ProjectManagement  pm=new ProjectManagement();
					pm.OpenDB();
					
				  	ArrayList<ProjectMonthRecordBean> list= pm.searchProjectByNoReport(departmentId,taskMonth);
					if(list.size()==0)
						out.println("您所在的部门该月份没有项目指标需要申报");
												
					for(ProjectMonthRecordBean  prb:list){
						String isProjectMoney=prb.getIsMoney().trim();
						System.out.print(isProjectMoney);
						out.println("<tr>");														
						DecimalFormat df = new DecimalFormat("###0.0#");
						int jindu_bar =(int)(95*prb.getTotalProgress());
						System.out.println(jindu_bar);
						out.print(	"<td width='80px' class='borderleft'><span>"+prb.getEvaluationContent()+"</span></td>");
						out.print("<td width='140px'><span>"+prb.getProjectName()+"</span></td>");				
						out.print("<td><div id='jindu_bar' style='background:white;width:95px;height:20px;border:1px solid #91C7E1;'>");
						out.print("<div id='jindu' style='background:#91C7E1;width:"+jindu_bar+"px;height:20px;float:left'>"+df.format(prb.getTotalProgress()*100.00)+"%</div></div></td>");
						if(isProjectMoney.equals("true")){
							out.print("<td ><input type='text' name='submit_"+prb.getProjectId()+"' size='10'></td>");
							out.print("<td >&nbsp;</td>");
						}
						else{
							out.print("<td >&nbsp;</td>");
							out.print("<td ><input type='text' name='submit_"+prb.getProjectId()+"' size='10'>%</td>");
						}						
						out.print("<td><textarea style='width:440px;height:40px;font-size:12px;' name='submit_"+prb.getProjectId()+"' maxlength='100'></textarea></td>");
						out.println("<td width='50px' style='text-align:center'><input type='button' name='submit_"+prb.getProjectId()+"' value='上报' onclick='shenbao(this.name,"+isProjectMoney+")'/></td>");										
						out.println("</tr>");
					}									
				%>								
			</table>
			<div style='margin:5px 0px 5px 3px;'>
	       		2.非项目指标进度申报：
			</div>
			<table class='xiangmu' width='976px' cellSpacing=0 cellPadding=4>
				<tr style='background:#91C7E1'>
					<th width='200px' class='borderleft'>
						<span>考核指标</span>
					</th>
					<th width='726px'>
						<span>具体事项</span>
					</th>
					<th width='50px'>
						<span>申报</span>
					</th>
				</tr>
				<%
					ArrayList<NoProjectEvaluationBean> list1= pm.searchNoProjectEvaluationByNoReport(departmentId,taskMonth);
					if(list.size()==0)
						out.println("您所在的部门该月份没有非项目指标需要申报");
												
					for(NoProjectEvaluationBean  npeb:list1){
						out.println("<tr>");
						out.println("<td width='200px' class='borderleft'><span>"+npeb.getEvaluationContent()+"</span></td>");
						out.println("<td><textarea style='width:720px;height:40px;font-size:12px;' name='submit_"+npeb.getEvaluationId()+"' maxlength='100'></textarea></td>");%>
						<td width='50px' style='text-align:center'><input type='button' name='submit_"+npeb.getEvaluationId()+"' value='上报' onclick='shenbao_feixm(this.name,"<%=npeb.getEvaDepartmentId()%>")'/></td>	
					<%	out.println("</tr>");
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
