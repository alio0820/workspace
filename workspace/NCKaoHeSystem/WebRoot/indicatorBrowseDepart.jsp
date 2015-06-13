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
				width:90px;				
				}
			table.xiangmu th{
				border:1px solid #9AB5D0;	
				width:1170px;
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
							<hr style='width:690px;height:2px;color:lightblue;'>
							<div style="width:690px;margin:0 auto;">      						
            					<%  int i=0;
            						String evaluationId = request.getParameter("evaId");
									DepartmentManagement  dm=new DepartmentManagement();
									dm.OpenDB();
									ArrayList<DepartmentBean>  list=dm.searchDepartmentByEvaluation(evaluationId);
									DepartmentBean db_forward =list.get(0);
									for(DepartmentBean db:list){
										if(i==0){
											out.println("<table class='xiangmu' cellSpacing=0 cellPadding=4 style='border:1px solid #6F9FC0;'>");
											out.print("<tr><th colspan='10' style='background:#3399CC'><span>"+db.getSecondClassify()+"</span></th></tr>");
										}										
										if(db.getSecondClassify().equals(db_forward.getSecondClassify())){
											if(i%10 ==0){
												out.println("<tr>");
												out.println("<td class='borderleft'>");
											}else{
												out.println("<td>");
											}											
											out.println("<a href='IC_classify.action?dpId="+db.getDepartmentId()+"&evaId="+evaluationId+"&dpName="+db.getDepartmentName()+"'>"+db.getDepartmentName()+"</a></td>");	
											if((i+1)%10 ==0) {
												out.println("</tr>");
									 		}			
										}else{
											i=0;	//改变一个类别过后重置i;
											if(i%10!=0)
												out.println("</tr></table><table style='height:10px;'></table>");
											else
												out.println("</table><table style='height:10px;'></table>");
											out.print("");
											out.println("<table class='xiangmu' cellSpacing=0 cellPadding=4 style='border:1px solid #6F9FC0;'>");
											out.print("<tr><th colspan='10' style='background:#3399CC'><span>"+db.getSecondClassify()+"</span></th></tr>");	//小标题
											out.println("<tr><td class='borderleft'><a href='departIC_classify.action?dpId="+db.getDepartmentId()+"&evaId="+evaluationId+"&dpName="+db.getDepartmentName()+"'>"+db.getDepartmentName()+"</a></td>");	//小标题的子项
										}
										db_forward = db;
										i++;
									}
									if(i%10 !=0) {
										out.println("</tr></table><table style='height:10px;'></table>");     
									}							
									dm.CloseDB();
								%>        
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