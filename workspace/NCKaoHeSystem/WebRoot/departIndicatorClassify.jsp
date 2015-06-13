<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.sql.*,swu.edu.cn.bean.*,java.sql.ResultSet"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Untitled Page</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
		<STYLE type=text/css>
			{
				FONT-SIZE:12px;
			}
			table.xiangmu td {
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:center;
				overflow:hidden;
				font-size:12px;		
				}
			table.xiangmu th{
				border:1px solid #9AB5D0;	
			}
			.borderleft {
				border-left:1px solid #6F9FC0;
			}
			a{
				text-decoration:none;
				color:black;
			}
			span.class1{
				border:1px solid rgb(119,119,170);
				margin-left:2px;
				margin-right:5px;
				margin-top:3px;
				margin-bottom:3px;
			}
			div.new{
				margin-top:5px;
				margin-bottom:5px;
				margin-left:10px;
			}
			.ResultM_1{
	    		background:url(images/departManager_1.png);width:362px;height:57px;float:left;
	    	}	
		</STYLE>		
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
							<SPAN style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
							<SPAN style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(images/main_hb.gif); COLOR: white; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0 px: ">
								部门管理
							</SPAN>
							<SPAN style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
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
					    	<center>
							<div style='width:350px;margin:10px auto 0;color:black;font-size:20px;'>2012年度南川区委单位职能工作目标</div>
							<hr style='width:976px;height:2px;color:lightblue;'>
							<%String dpName = request.getParameter("dpName");
                  			dpName = new String(dpName.getBytes("ISO8859-1"),"UTF-8");%>
                			<span style="color:rgb(120,48,120);">责任单位：<%=dpName%></span>
							<div id="right" style="width:976px;height:auto;margin:0 10px 5px 5px;border:1px solid lightblue;min-height:500px;">       						
						    <table class='xiangmu' width='976px' style="border-collapse:collapse;border-spacing:0;">            						           						           						
            						<%	String evaluationId = request.getParameter("evaId");
            							String departmentId = request.getParameter("dpId");
            							System.out.print(evaluationId);
            							System.out.print(departmentId);
            							ProjectManagement  pm=new ProjectManagement();
										pm.OpenDB();
            							//有项目的接口 
            						%>
									<tr style='background:#91C7E1' height='30px'>
										<th width='70px' class='borderleft'>
											<span>项目一级</span>
										</th>
										<th width='70px' >
											<span>项目二级</span>
										</th>
										<th width='216px' >
											<span>项目名称</span>
										</th>				
										<th width='70px' >
											<span>责任部门</span>
										</th>
										<th width='70px'>
											<span>牵头部门</span>
										</th>
										<th width='80px' >
											<span>区分管领导</span>
										</th>						
										<th width='300px'>
											<span>考核指标</span>
										</th>
										<th width='100px'>
											<span>项目进度</span>
										</th>																												
									</tr>
								<%
									ArrayList<ProjectBean>	list=pm.searchProjectByDepartment(evaluationId,departmentId);
									for(ProjectBean pb : list){
//										 	System.out.print(prb.getProjectID()+"\t");
										 	out.print("<tr><td width='70px' class='borderleft'>"+pb.getFirstClassify()+"</td>");
										 	out.print("<td width='70px'>"+pb.getSecondClassify()+"</td>");
											out.print("<td width='216px'><a href='departIndicatorDetails.jsp?prId="+pb.getProjectId()+"'>"+pb.getProjectName()+"[<font style='color:rgb(21.2%, 43.1%, 72.9%);'>详情</font>]</a></td>");
											out.print("<td width='70px'>"+pb.getResDepartmentName()+"</td>");
											out.print("<td width='70px'>"+pb.getLeadDepartmentName()+"</td>");
											out.print("<td width='80px'>"+pb.getSeparateLeader()+"</td>");
											out.print("<td width='300px'>"+pb.getEvaContent()+"</td>");											
											out.println("<td width='100px'>"+pb.getCurrentFinish()+"</td></tr>");											
									 }
									 pm.CloseDB();
								 %>
								 </table>
						    </div>
						    </center>
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