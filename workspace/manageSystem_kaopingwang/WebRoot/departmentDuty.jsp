<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.bean.*,swu.edu.cn.sql.*"%>
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
			body{
				BACKGROUND-POSITION-Y: -120px;
				BACKGROUND-IMAGE: url(images/bg.gif);
				BACKGROUND-REPEAT: repeat-x
			}
			table.xiangmu td {
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:left;
				overflow:hidden;
				font-size:12px;			
				}	
			table.xiangmu th {
				border-top:1px solid #6F9FC0;
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:center;
				font-size:14px;				
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
				margin-left:5px;
				margin-right:2px;
				margin-top:3px;
				padding:4px 4px 0 4px;
				display:inline-block;
			}
			div.new{
				margin-top:5px;
				margin-bottom:5px;
				margin-left:10px;
			}	
			.ResultM_1{
	    		background:url(images/projectInquires.png);width:362px;height:57px;float:left;
	    	}	
		</STYLE>
	</HEAD>
	<BODY>
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
								项目分类
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
							style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 0px; BACKGROUND-COLOR: white"
							vAlign=top >
								<div style="background:url(images/ResultManager_2.png);width:auto;height:57px;">
						    		<div class="ResultM_1"></div>						    
					    		</div>
								<div style="margin-left:30px;margin-top:20px;">
								<table class='xiangmu' width='1150px' cellSpacing=0 cellPadding=4>
									<tr style='background:#91C7E1' height='30px'>
										<th width='100px' class='borderleft'>
											<span>项目一级</span>
										</th>
										<th width='100px' >
											<span>项目二级</span>
										</th>
										<th width='250px' >
											<span>项目名称</span>
										</th>				
										<th width='100px' >
											<span>责任部门</span>
										</th>
										<th width='100px' >
											<span>区分管领导</span>
										</th>						
										<th width='200px'>
											<span>考核指标</span>
										</th>
										<th width='200px'>
											<span>项目进度</span>
										</th>																												
									</tr>
								<%
									String classify = request.getParameter("classify");
									int departmentId=Integer.parseInt(request.getParameter("departmentId"));
									classify=new String(classify.getBytes("ISO8859-1"),"UTF-8");
									ProjectManagement  pm=new  ProjectManagement();
									pm.OpenDB();
									ArrayList<ProjectBean> list=pm.searchProjectByEvaluation(departmentId,classify);									
									for(ProjectBean prb : list){
//										 	System.out.print(prb.getProjectID()+"\t");
										 	out.print("<tr><td width='100px' class='borderleft'>"+prb.getSecondClassify()+"</td>");
										 	out.print("<td width='100px'>"+prb.getThirdClassify()+"</td>");
											out.print("<td width='250px'><a href='xiangmu_xiangqing.jsp?projectId="+prb.getProjectID()+"'>"+prb.getProjectName()+"[<font style='color:rgb(21.2%, 43.1%, 72.9%);'>详情</font>]</a></td>");
											out.print("<td width='100px'>"+prb.getResponsibleDepartment()+"</td>");
											out.print("<td width='100px'>"+prb.getLeader()+"</td>");
											out.print("<td width='200px'>"+prb.getExpectTask()+"</td>");											
											out.println("<td width='200px'>"+prb.getCurrentProgress()+"</td></tr>");
							//				System.out.println(prb.getStatus());											
									 }
									pm.CloseDB();
								 %>
								 </table>
							</div> 
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