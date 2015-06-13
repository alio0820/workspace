<%@page import="swu.edu.cn.sql.ProjectRecordManagement"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.bean.*,swu.edu.cn.sql.*,java.sql.ResultSet,java.text.DecimalFormat;"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Untitled Page</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
		<style type="text/css">
			body{
				font-size:12px;
			}
			table.xiangmu td {
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:center;
				overflow:hidden;
				font-size:12px;			
				}
			table.xiangmu th {
				border-top:1px solid #6F9FC0;
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:center;
				font-size:12px;				
				}
			.borderleft {
				border-left:1px solid #6F9FC0;
			}	
			.ResultM_1{
	    		background:url(images/dutyProject.png);width:362px;height:57px;float:left;
	    	}	
		</style>
			<script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script>
    		<script language="javascript" type="text/javascript" src="js/jquery.js"></script>
    		<script language="javascript" type="text/javascript" src="js/jquery.flot.js"></script>
	</HEAD>
	<body style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(images/bg.gif); BACKGROUND-REPEAT: repeat-x;">
		<DIV>
			<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
				<TBODY>
					<TR
						style="BACKGROUND-IMAGE: url(images/bg_header.gif); BACKGROUND-REPEAT: repeat-x"
						height=47px>
						<TD width=15px>
							<SPAN
								style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hl.gif); WIDTH: 15px; background-position: left top; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
						</TD>
						<TD>
							<SPAN
								style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN><SPAN
								style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(images/main_hb.gif); COLOR: white; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0 px: ">
								责任项目
							</SPAN><SPAN
								style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
						</TD>
						<TD
							style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-REPEAT: no-repeat; BACKGROUND-IMAGE: url(images/main_rc.gif)"
							width=10></TD>
					</TR>
					<TR>
						<TD
							style="background: url(images/main_ls.gif); background-color: rgb(255, 255, 255); BACKGROUND-REPEAT: repeat-y;">
							&nbsp;
						</TD>
						<TD
							style="PADDING-RIGHT: 10px; PADDING-LEFT: 0px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 0px; BACKGROUND-COLOR: white"
							vAlign=top >
							<div style="background:url(images/ResultManager_2.png);width:auto;height:57px;">
						    	<div class="ResultM_1"></div>						    
					    	</div>
					    	<div>
								<span><img src="images/dutydepart.gif" alt='责任单位'/>责任单位：（...）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span><img src="images/dutyp.gif" alt='责任人'/>责任人：（...）</span>
								<span>发布日期：2012-04-12</span>
							</div><br/>
					    	<table cellpadding='0' cellspacing='1'>
					    	<tr>
					    	<td>
							<div>本月进度审查情况</div>
								<div style="margin-left:30px;margin-top:10px;margin-bottom:30px;">
									<table class="xiangmu" cellSpacing=0 cellPadding=5 width='1080px'>
										<tr style='background:#91C7E1'>
											<th class='borderleft'>
												项目名称
											</th>
											<th width=80px>
												责任部门
											</th>
											<th width=80px>
												牵头部门
											</th>
											<th width='400px'>
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

										<%  int projectId=Integer.parseInt(request.getParameter("projectId").toString());	
											SerachProjectRecord  spr=new SerachProjectRecord();
											spr.OpenDB();
											DecimalFormat df = new DecimalFormat("###0.0#");
											ArrayList<ProjectRecordBean> list=spr.searchProjectRecordByDetails(projectId);
											if(list.size()!=0){
												ProjectRecordBean  prb1=list.get(0);
												out.println("<tr>");
												out.print(	"<td width='200px' class='borderleft'><span>"+prb1.getProjectName()+"</span></td>");												
												out.print("<td ><span>"+prb1.getResponsibleDepartment()+"</span></td>");
												out.print("<td ><span>"+prb1.getLeadDepartment()+"</span></td>");
												out.print("<td ><span>"+prb1.getExpectTask()+"</span></td>");
												out.print("<td><span id='jindu_bar' style='background:white;width:100px;height:20px;border:1px solid #91C7E1;'>");
												out.print("<span id='jindu' style='background:#91C7E1;width:"+100*prb1.getCurrentProgress()+"px;height:20px;float:left'>"+df.format(prb1.getCurrentProgress()*100.00)+"%</span></td>");
												String status=prb1.getStatus();
												if(status==null){
													out.print("<td ><span>-</span></td>");
													out.print("<td ><span>-</span></td>");
													out.print("<td ><span>-</span></td>");
													out.println("<td ><span><a href='department.jsp?projectID="+prb1.getProjectID()+"'>未申报</a></span></td>");
												}else{
													out.print("<td ><span>"+spr.CTS(status,0)+"</span></td>");
													out.print("<td ><span>"+spr.CTS(status,1)+"</span></td>");
													out.print("<td ><span>"+spr.CTS(status,2)+"</span></td>");
													out.println("<td ><span><a href='department.jsp?projectID="+prb1.getProjectID()+"'>已申报</a></span></td>");
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
									<table class='xiangmu' width='700px' cellSpacing=0 cellPadding=4 style="margin-left:30px;margin-right:20px">
										<tr style='background:#91C7E1'>											
											<th width=80px class='boderleft'>
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
													
										for(ProjectRecordBean prb:list){
																		
											out.println("<tr>");
										//	ProjectRecordBean prb=list.get(0);
	//										out.print(prb.getProjectID()+"\t");
											
	//										out.print(	"<td width='200px' class='borderleft'><span>"+prb.getProjectName()+"</span></td>");
	//										out.print("<td ><span>"+prb.getExpectTask()+"</span></td>");
	//										out.print("<td ><span>"+prb.getResponsibleDepartment()+"</span></td>");
	//										out.print("<td ><span>"+prb.getLeadDepartment()+"</span></td>");
											out.print("<td class='borderleft'><span>"+prb.getTaskMonth()+"</span></td>");
											out.print("<td ><span>"+prb.getActualFinish()+"</span></td>");
											out.print("<td><span id='jindu_bar' style='background:white;width:100px;height:20px;border:1px solid #91C7E1;'>");
											out.print("<span id='jindu' style='background:#91C7E1;width:"+100*prb.getRate()+"px;height:20px;float:left'>"+df.format(prb.getRate()*100.00)+"%</span></td>");
											//out.print("<td ><span>"+prb.getCurrentProgress()+"</span></td>");
											String status=prb.getStatus();
											if(status==null){
												out.print("<td ><span>-</span></td>");
												out.print("<td ><span>-</span></td>");
												out.print("<td ><span>-</span></td>");
												out.println("<td ><span><a href='department.jsp?projectID="+prb.getProjectID()+"'>未申报</a></span></td>");
											}else{
												out.print("<td ><span>"+spr.CTS(status,0)+"</span></td>");
												out.print("<td ><span>"+spr.CTS(status,1)+"</span></td>");
												out.print("<td ><span>"+spr.CTS(status,2)+"</span></td>");
												out.println("<td ><span><a href='department.jsp?projectID="+prb.getProjectID()+"'>已申报</a></span></td>");
											}
										//	list.remove(0);
											out.println("</tr>");
											
											//"<td ><span>"+prb.getFlag()+"</span></td>"
											//	"<td><span id='jindu_bar' style='background:white;width:200px;height:20px;border:1px solid #91C7E1;'><span id='jindu' style='background:#91C7E1;width:150px;height:20px;float:left'>"+75+"%</span>"									
										}
										spr.CloseDB();										
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
							<div style="margin-left:30px;margin-top:10px;">
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
										 LeaderCheckManagement lcm=new LeaderCheckManagement();
										 lcm.OpenDB();
										 ArrayList<LeaderCheckBean>  list1=lcm.getLeadCheck(projectId);
										 lcm.CloseDB();
										if(list1.size()==0){
										out.println("<tr><td colspan='3'class='borderleft'>该项目暂无领导批示</td></tr>");
										}
										else
									   		for(LeaderCheckBean lcb:list1){
									   			String month =""+ lcb.getTaskMonth();
									   			if(month.equals("-1"))
									   			 	month="年度";
									   			 else
									   			 	month=lcb.getTaskMonth()+"月";								   				
												out.println("<tr><td width=80px class='borderleft'>"+month+"</td>");
												out.println("<td width='80px'>"+lcb.getRealName()+"</td>");
												String leadView=lcb.getLeaderView().replaceAll( "\\s",   "");		//去掉空格等无用字符;
												if(leadView.equals(""))
												      leadView="无意见";
												out.println("<td width='80px'>"+leadView+"</td></tr>");
										}
									 %>
								</table>
							</div>
						</div>
						</td></tr>
						</table>
								<script type="text/javascript">
								<%  HuiTu ht=new HuiTu(projectId);
									ht.OpenDB();
									String str=ht.SelectHuituData();
									ht.CloseDB();%>
									<%System.out.println(str);%>
								$(function () {
									var d1=[]; var d2=[];
//								    for (var i = 0; i < 12; i++)
//								        d1.push([i,i*i-5*i]);
									var str = "<%=str%>";
									
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
						</TD>
						<TD style="BACKGROUND-IMAGE: url(images/main_rs.gif)"></TD>
					</TR>
					<TR style="BACKGROUND-IMAGE: url(images/main_fs.gif); background-color: rgb(255, 255, 255); BACKGROUND-REPEAT: repeat-x" height=10>
						<TD style="BACKGROUND-IMAGE: url(images/main_lf.gif); BACKGROUND-REPEAT: no-repeat; width: 10px"></TD>
						<TD style="BACKGROUND-IMAGE: url(images/main_fs.gif)"></TD>
						<TD style="BACKGROUND-IMAGE: url(images/main_rf.gif)"></TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
	</BODY>
</HTML>