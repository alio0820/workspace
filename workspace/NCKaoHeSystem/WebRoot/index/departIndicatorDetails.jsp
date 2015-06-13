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
<div class="zhong" >
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
  <div style="color:black;height:auto;">
  	<div id="qujikaoping_top" style="height:20px;">
        <div style="margin-left:10px;margin-right:10px;float:right"><span id="clock"></span></div>
        <div style='float:left;margin-right:100px'>欢迎  [<%=session.getAttribute("departmentName")%>] [<%=session.getAttribute("realName")%>] 光临</div>
        <div style="float:left"><span style="font-weight:bold">当前位置：</span>
                <a href="index.jsp" style="color:rgb(120,48,120);">南川考评网</a>&gt;
                <span style="color:rgb(120,48,120);">项目详情</span>
        </div>
    </div>
    <div id="right" style="width:976px;height:auto;margin:0 10px 5px 10px;border:1px solid lightblue;min-height:500px;">      
		 <div>
			<span><img src="../images/dutydepart.gif" alt='责任单位'/>责任单位：（...）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span><img src="../images/dutyp.gif" alt='责任人'/>责任人：（...）</span>
			<span>发布日期：2012-04-12</span>
		</div><br/>
		  	<table cellpadding='0' cellspacing='1'>
		  	<tr>
		  	<td>
		<div>本月进度审查情况</div>
			<div style="margin-left:0px;margin-top:10px;margin-bottom:30px;">
		<table class="xiangmu" cellSpacing=0 cellPadding=5 width='976px'>
			<tr style='background:#91C7E1'>
			<th width=200px class='borderleft'>
				项目名称
			</th>
			<th width=80px>
				责任部门
			</th>
			<th width='300px'>
				考核指标
			</th>											
			<th width='100px'>
				任务总进度
			</th>
			<th width='55px'>
				牵头部门审批
			</th>
			<th width='55px'>
				区领导审批
			</th>
			<th width='55px'>
				两办督查审批
			</th>
			<th width='55px'>
				申报情况
			</th>		
		</tr>
		
	<%  String projectId="evaluation002003";
		ProjectManagement pm=new ProjectManagement();
		pm.OpenDB();
		ArrayList<ProjectMonthRecordBean> list= pm.searchProjectByDetails(projectId);
		if(list.size()==0)
			out.println("您所在的部门该月份没有非项目指标需要申报");
		DecimalFormat df = new DecimalFormat("###0.0#");
		if(list.size()!=0){
			ProjectMonthRecordBean  pmrb=list.get(0);
			double jindu = 100*pmrb.getTotalProgress()>100?100:100*pmrb.getTotalProgress();
			out.println("<tr>");
			out.print(	"<td width='200px' class='borderleft'><span>"+pmrb.getProjectName()+"</span></td>");												
			out.print("<td ><span>"+pmrb.getResDepartmentName()+"</span></td>");
			out.print("<td ><span>"+pmrb.getProjectEvaContent()+"</span></td>");
			out.print("<td><span id='jindu_bar' style='background:white;width:100px;height:20px;border:1px solid #91C7E1;'>");
			out.print("<span id='jindu' style='background:#91C7E1;width:"+jindu+"px;height:20px;float:left'>"+df.format(jindu)+"%</span></td>");
			String status=pmrb.getStatus();
			if(status==null){
				out.print("<td ><span>-</span></td>");
				out.print("<td ><span>-</span></td>");
				out.print("<td ><span>-</span></td>");
				out.println("<td ><span><a href='department.jsp?projectID="+pmrb.getProjectId()+"'>未申报</a></span></td>");
			}else{
				out.print("<td ><span>"+pm.CTS(status,0)+"</span></td>");
				out.print("<td ><span>"+pm.CTS(status,1)+"</span></td>");
				out.print("<td ><span>"+pm.CTS(status,2)+"</span></td>");
				out.println("<td ><span><a href='department.jsp?projectID="+pmrb.getProjectId()+"'>已申报</a></span></td>");
			}
			out.println("</tr>");
		}		 
		%>
				</table>
			</div>
		</td>
		</tr>
		<tr><td>
		<div style="margin-top:10px;min-height:250px;">
		<div style='float:left;width:700px;'>
		<div style='margin-bottom:10px'>该项目详细审查情况</div>
		<table class='xiangmu' width='700px' cellSpacing=0 cellPadding=4 style="margin-left:0px;margin-right:20px">
		<tr style='background:#91C7E1'>
			<th width='80px'class='boderleft'>
				<span>考核月份</span>
			</th>
			<th width="255px">
				该月完成事项
			</th>									
			<th width='100px'>
				<span>该月进度</span>
			</th>
			<th width='55px'>
				<span>牵头部门审批</span>
			</th>
			<th width='55px'>
				<span>区领导审批</span>
			</th>
			<th width='55px'>
				<span>两办督查审批</span>
			</th>
			<th width='100px'>
				<span>申报情况</span>
			</th>									
		</tr>
		<%
																				
			if(list.size()==0)
					out.println("您所在的部门没有承担任何项目");
			for(ProjectMonthRecordBean prb:list){	
				double jindu = 100*prb.getTotalProgress()>100?100:100*prb.getTotalProgress();																
				out.println("<tr>");
				out.print("<td class='borderleft'><span>"+prb.getEvaMonth()+"</span></td>");
				out.print("<td ><span>"+prb.getMonthFinish()+"</span></td>");
				out.print("<td><span id='jindu_bar' style='background:white;width:100px;height:20px;border:1px solid #91C7E1;'>");
				out.print("<span id='jindu' style='background:#91C7E1;width:"+jindu+"px;height:20px;float:left'>"+df.format(jindu)+"%</span></td>");
				String status=prb.getStatus();
				if(status==null){
					out.print("<td ><span>-</span></td>");
					out.print("<td ><span>-</span></td>");
					out.print("<td ><span>-</span></td>");
					out.println("<td ><span><a href='#?projectID="+prb.getProjectId()+"'>未申报</a></span></td>");
				}else{
					out.print("<td ><span>"+pm.CTS(status,0)+"</span></td>");
					out.print("<td ><span>"+pm.CTS(status,1)+"</span></td>");
					out.print("<td ><span>"+pm.CTS(status,2)+"</span></td>");
					out.println("<td ><span><a href='#?projectID="+prb.getProjectId()+"'>已申报</a></span></td>");
				}
				out.println("</tr>");
			}
			pm.CloseDB();
		%>
			</table>
		</div>
		<div style='float:left;width:300px;height:250px;'>
		<div style='margin-bottom:10px'>项目进展（图示）：</div>						
		<div id="placeholder1" style="width:360px;height:240px;border:1px solid lightblue"></div>
		</div>
		</div>
		</td></tr>
		<tr><td>
		<div style='margin-top:20px;'>
		<div>该项目领导批示情况</div>
		<div style="margin-left:0px;margin-top:10px;">
		<table class='xiangmu' width='560px' cellSpacing=0 cellPadding=4 style="float:left;margin-right:10px">
			<tr style='background:#91C7E1'>											
				<th width=80px class='borderleft'>
					<span>任务月份</span>
				</th>
				<th width='80px'>
					<span>领导姓名</span>
				</th>
				<th width='400px'>
					<span>领导意见</span>
				</th>
			</tr>
			<%
				 SuggestionBean sb = new SuggestionBean();
				 sb.setProjectid(projectId);
				 sb.setMonth(7);
				 SuggestionManagement  dm=new SuggestionManagement(sb);
				 dm.OpenDB();
				 ArrayList<SuggestionBean>  list1=dm.searchSuggestionByProMonth();
				 dm.CloseDB();
				if(list1.size()==0){
					out.println("<tr><td colspan='3'class='borderleft'>该项目暂无领导批示</td></tr>");
				}
				else
			   		for(SuggestionBean sb1:list1){
			   			String month =""+ sb1.getMonth();
			   			if(month.equals("-1"))
			   			 	month="年度";
			   			 else
			   			 	month=sb1.getMonth()+"月";
						out.println("<tr><td width=80px class='borderleft' style='text-align:center'>"+month+"</td>");
						out.println("<td width='80px' style='text-align:center'>"+sb1.getRealName()+"</td>");
						String leadView=sb1.getLeaderSuggestion().trim();		//去掉空格等无用字符;
						if(leadView.equals(""))
						      leadView="无意见";
						out.println("<td width='400px'>"+leadView+"</td></tr>");
					}
		 %>
		</table>
			</div>
		</div>
		</td></tr>
		</table>
		<script type="text/javascript">
		<%/*HuiTu ht=new HuiTu(projectId);
		ht.OpenDB();
		String str=ht.SelectHuituData();
		ht.CloseDB();%>
		<%System.out.println(str);*/%>
								$(function () {
									var d1=[]; var d2=[];
//								    for (var i = 0; i < 12; i++)
//								        d1.push([i,i*i-5*i]);
									var str = "<%//=str%>";
									
									var huitu = str.split(":");
								    for(var i =1; i<huitu.length;i++)
								    d2.push([i,huitu[i]*100]);
								   
//								    d1.push([12,100]);         								    
								    $.plot($("#placeholder1"), 
								    [
								        {
								            data: d1,							            
								            lines: { show: true, fill: true },
								            points: { show: true } 
								        },
								        {
								            data: d2,
//								            label:"进度",
								            //bars: { show: true ,fill: true},
								             lines: { show: true, fill: true },
								            points: { show: true }
								        }
								    ],
								    {
								    	grid: { hoverable: true, clickable: true },
//								    	yaxis: { min: 0, max: 100 }
										xaxis: { ticks: [[1, "1月"], [2, "2月"],[3, "3月"],[4, "4月"],[5, "5月"], [6, "6月"], [7, "7月"], [8, "8月"],[9, "9月"], [10, "10月"],[11, "11月"],[12, "12月"]]},
										yaxis: { ticks: [[0, "0%"],[2.5, "2.5%"],[5, "5.0%"],[7.5, "7.5%"],[10, "10%"]]}
								    }
								    );
								
								$("#placeholder1").bind("plothover", function (event, pos, item) {
						            if (item) {					                    
//						                    $("#tooltip").remove();
						                    var x = item.datapoint[0].toFixed(2),
						                        y = item.datapoint[1].toFixed(2);					                    						                    
						                		showTooltip(item.pageX, item.pageY,
						                                 "该月已完成进度" + y+"%");				                
						            }						            
						            else {
						                $("#tooltip").remove();
						                previousPoint = null;            
						            }
								});
									function showTooltip(x, y, contents) {
								        $('<div id="tooltip">' + contents + '</div>').css( {
								            position: 'absolute',
								            display: 'none',
								            top: y + 5,
								            left: x + 5,
								            border: '1px solid #fdd',
								            padding: '2px',
								            'background-color': '#fee',
								            opacity: 0.80
								        }).appendTo("body").fadeIn(200);
								    }
								});
								</script>
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
