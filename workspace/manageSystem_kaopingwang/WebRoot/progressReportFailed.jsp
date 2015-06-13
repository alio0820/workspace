<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="swu.edu.cn.sql.*"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.bean.*,swu.edu.cn.sql.DBConnection,java.sql.ResultSet,java.text.DecimalFormat;"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Untitled Page</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
		<STYLE type=text/css>
			{
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
	    		background:url(images/progressReport.png);width:362px;height:57px;float:left;
	    	}		
		</STYLE>
		<script type='text/javascript'>
			<%
			int departmentId=112;  //session.get(....);
			String strTaskMonth= request.getParameter("taskMonth");
									int taskMonth;
									if(strTaskMonth==null){
									taskMonth=(new Date()).getMonth()+1;
									}else{
									taskMonth=Integer.parseInt(strTaskMonth);
									}%>
			function shenbao(name){
				 var name = name;
				 alert(name);
				 var projectId= name.substring(7);
				 alert(projectId);
				 var rate = document.getElementsByName(name)[0].value/100;
				 alert(rate);
				 var actualFinish = document.getElementsByName(name)[1].value;
				 alert(actualFinish);
				 var taskMonth = document.form1.select_yue.value;
				 alert(taskMonth);
				 document.form1.action="projectR_shenbao.action?projectId="+projectId+"&rate="+rate+"&actualFinish="+actualFinish+"&taskMonth="+taskMonth;
		         document.form1.submit(); 
			}
		</script>
	</HEAD>
	<BODY style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(images/bg.gif); BACKGROUND-REPEAT: repeat-x">
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
								进度申报
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
							<form name='form1' method='post'>
							<div style="background:url(images/ResultManager_2.png);width:auto;height:57px;">
						    	<div class="ResultM_1"></div>						    
					    	</div>
					    	
							<div>申报未通过的项目</div>
							
							<div style="margin-left:30px;margin-top:20px;">
								<table class='xiangmu' width='1140px' cellSpacing=0 cellPadding=4>
									<tr style='background:#91C7E1'>
										<th width='200px' class='borderleft'>
											<span>项目名称</span>
										</th>
										<th width='60px'>
											<span>任务月份</span>
										</th>
										<th width='100px'>
											<span>该月进度</span>
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
										<th width='60px'>
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
									//ProjectRecordManagement  prm=new ProjectRecordManagement();
									//prm.OpenDB();
								SerachProjectRecord  spr=new SerachProjectRecord();
								spr.OpenDB();
									//ArrayList<ProjectRecordBean> list=prm.getResponsibleDepartmentTask(departmentId,taskMonth,"%");
								  ArrayList<ProjectRecordBean> list= spr.searchProjectByReportFaild(departmentId);
									if(list.size()==0)
											out.println("您所在的部门没有承担任何项目");
												
									for(ProjectRecordBean  prb:list){
										//ProjectRecordBean prb=list.get(0);	
										System.out.println(prb.getProjectID());
									
										//System.out.print("------------------------");
										out.println("<tr>");
																		
										//if(prb.getStatus()==null){
										//System.out.print(prb.getProjectID()+"\t");
										DecimalFormat df = new DecimalFormat("###0.0#");
										int jindu_bar =(int)(100*prb.getRate());
										System.out.println(jindu_bar);
										String jindu_baifenbi=df.format(prb.getCurrentProgress()*100.00)+"";
										out.print(	"<td width='200px' class='borderleft'><span>"+prb.getProjectName()+"</span></td>");
//										out.print("<td ><span>"+prb.getComment()+"</span></td>");
//										out.print("<td ><span>"+prb.getLeadDepartment()+"</span></td>");
//										out.print("<td><span id='jindu_bar' style='background:white;width:200px;height:20px;border:1px solid #91C7E1;'>");
//										out.print("<span id='jindu' style='background:#91C7E1;width:"+200*prb.getCurrentProgress()+"px;height:20px;float:left'>"+df.format(prb.getCurrentProgress()*100.00)+"%</span>");
//										//out.print("<td ><span>"+prb.getCurrentProgress()+"</span></td>");
//										out.print("<td ><span>"+prb.getStatus1()+"</span></td>");
//										out.print("<td ><span>"+prb.getStatus2()+"</span></td>");
//										out.print("<td ><span>"+prb.getStatus3()+"</span></td>");
//										out.println("<td ><span>"+prb.getFlag()+"</span></td>");
//										out.println("<td width='60px'><span>"+list.size()+"</span></td>");
										out.print("<td width='60px'><span>"+prb.getTaskMonth()+"</span></td>");
										out.print("<td><span id='jindu_bar' style='background:white;width:100px;height:20px;border:1px solid #91C7E1;'>");
										out.print("<span id='jindu' style='background:#91C7E1;width:"+jindu_bar+"px;height:20px;float:left'>"+jindu_baifenbi+"%</span></td>");
										out.print("<td width='60px'><span>"+prb.getActualFinish()+"</span></td>");				//该月事项
										String status=prb.getStatus();
										out.print("<td ><span>"+spr.CTS(status,0)+"</span></td>");
										out.print("<td width='60px'><span>"+prb.getLeadCompanyView()+"</span></td>");			//牵头部门审批																			
										out.print("<td ><span>"+spr.CTS(status,1)+"</span></td>");
										out.print("<td width='60px'><span>"+prb.getSeparateLeaderView()+"</span></td>");			//区分管领导审批
										out.print("<td ><span>"+spr.CTS(status,2)+"</span></td>");
										out.print("<td width='60px'><span>"+prb.getSupervisionView()+"</span></td>");			//督查室审批
										
//										out.println("<td width='60px'><input type='button' name='submit_"+prb.getProjectID()+"' value='上报' onclick='shenbao("+'"'+"submit_"+prb.getProjectID()+'"'+")'/></td>");										
										out.println("</tr>");
										//}
										//"<td ><span>"+prb.getFlag()+"</span></td>"
										//	"<td><span id='jindu_bar' style='background:white;width:200px;height:20px;border:1px solid #91C7E1;'><span id='jindu' style='background:#91C7E1;width:150px;height:20px;float:left'>"+75+"%</span>"
										//list.remove(0);
									}
									//prm.CloseDB();
									spr.CloseDB();									
									%>									
								</table>
						</div>
						</form>
						</TD>
						<TD style="BACKGROUND-IMAGE: url(images/main_rs.gif)"></TD>
					</TR>
					<TR style="BACKGROUND-IMAGE: url(images/main_fs.gif); background-color: rgb(255, 255, 255); BACKGROUND-REPEAT: repeat-x" height=10>
						<TD style="BACKGROUND-IMAGE: url(images/main_lf.gif); BACKGROUND-REPEAT: no-repeat; width: 10px"></TD>
						<TD style="BACKGROUND-IMAGE: url(images/main_fs.gif)"></TD>
						<TD style="BACKGROUND-IMAGE: url(images/main_rf.gif)"><br><br></TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
	</BODY>
</HTML>