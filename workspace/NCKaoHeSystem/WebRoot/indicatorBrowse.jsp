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
							<div id="right" style="width:976px;height:auto;margin:0 10px 5px 5px;border:1px solid lightblue;min-height:500px;">       						
						    <table class='xiangmu' width='976px' style="border-collapse:collapse;border-spacing:0;">
									<tr style='background:#6699CC ' style='height:30px'>
										<th width='20px' class='borderleft'>
											<span>编号</span>
										</th>
										<th width='100px' >
											<span>考核指标</span>
										</th>
										<th width='100px'>
											<span>牵头责任单位</span>
										</th>
										<th width='100px'>
											<span>区分管领导</span>
										</th>
										<th width='260px'>
											<span>考核标准</span>
										</th>
										<th width='396px'>
											<span>完成情况</span>
										</th>																											
									</tr>
								<%
									EvaluationManagement  em=new EvaluationManagement();
									em.OpenDB();
									ArrayList<EvaluationBean> list=em.searchAllEvaluaion();									
									for(EvaluationBean eb:list){
										String id = eb.getEvaluationId().substring(10);
										out.print("<tr><td width='20px' class='borderleft'>"+id+"</td>");
										out.print("<td width='100px'><a href='indicatorBrowseDepart.jsp?evaId="+eb.getEvaluationId()+"'>"+eb.getEvaluationContent()+"[<font style='color:rgb(21.2%, 43.1%, 72.9%);'>详情</font>]</a></td>");
										out.print("<td width='100px'>"+eb.getLeadDepartmentName()+"</td>");
										out.print("<td width='100px'>"+eb.getSeparateLeader()+"</td>");
										out.println("<td width='260px'>"+eb.getEvaluationStandard()+"</td>");
										out.println("<td width='260px' class='tdleft'>"+eb.getCurrentFinish()+"</td></tr>");															
									}
									em.CloseDB();
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