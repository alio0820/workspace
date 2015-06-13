<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="swu.edu.cn.sql.ProjectRecordManagement"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
	    		background:url(images/projectReview.png);width:362px;height:57px;float:left;
	    	}		
		</STYLE>
		<% int leadDepartment = 31;
		%>
		<script type='text/javascript'>
			function shenhe(projectId,taskMonth){
				var name =projectId+"_"+taskMonth;
				var selectName= "select_"+name;
				alert(selectName);
				var yijian = document.getElementsByName("text_"+name)[0].value;
				var tongguo = document.getElementsByName(selectName)[0].value;			//table中的select无法通过form对象来取得
				alert(tongguo);
				document.form1.action="projectR_shenheQiantou.action?projectId="+projectId+"&taskMonth="+taskMonth+"&tongguo="+tongguo+"&yijian="+yijian;
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
								项目审核
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
							<div>&nbsp;&nbsp;&nbsp;&nbsp;项目审核(第八月份)</div>
							<div style="margin-left:30px;margin-top:20px;">
								<table class='xiangmu' width='1130px' cellSpacing=0 cellPadding=4>
									<tr style='background:#91C7E1'>
										<th width='200px' class='borderleft'>
											<span>项目名称</span>
										</th>
										<th width='100px'>
											<span>责任部门</span>
										</th>
										<th width='50px'>
											<span>任务月份</span>
										</th>
										<th width='400px'>
											<span>该月进展情况</span>
										</th>
										<th width='100px'>
											<span>该月进度</span>
										</th>
										<th width='70px'>
											<span>牵头部门审批</span>
										</th>	
										<th width='150px'>
											<span>牵头部门批示</span>
										</th>
										<th width='60px'>
											<span>审核提交</span>
										</th>							
									</tr>
									<%
										ProjectRecordManagement prm=new ProjectRecordManagement();
										prm.OpenDB();
										
										ArrayList<QianTouViewBean> list=prm.QianTouViewList(leadDepartment);
										for(QianTouViewBean prb:list ){
												int projectId= prb.getProjectID();
												int taskMonth= prb.getTaskMonth();
												String name = projectId+"_"+taskMonth;
												System.out.println(name);
												out.println("<tr><td width='200px' class='borderleft'>"+prb.getProjectName()+"</td>");
												out.println("<td width='100px'>"+prb.getResponsibleDepartemntName()+"</td>");
												out.println("<td width='50px'>"+prb.getTaskMonth()+"</td>");
												out.println("<td width='400px'>"+prb.getActualFinish()+"</td>");
												out.println("<td width='100px'>"+prb.getRate()+"</td>");
												out.println("<td width='70px'><select name='select_"+name+"'><option value='T' selected>通过</option><option value='F'>不通过</option></select></td>");
												out.println("<td width='150px'><textarea name='text_"+name+"'></textarea></td>");
												out.println("<td width='60px'><input type='button' value='提交' onclick='shenhe("+projectId+","+taskMonth+")'/></td></tr>");
												
											
										}				
										prm.CloseDB();
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
						<TD style="BACKGROUND-IMAGE: url(images/main_rf.gif)"></TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
	</BODY>
</HTML>