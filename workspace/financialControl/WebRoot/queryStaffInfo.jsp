<%@page import="DM.LedgerDM"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,cn.edu.swu.sql.*,DM.*,PD.*"%>
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
				text-align:center;
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
								查询员工当前明细账
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
								<div style="margin-left:30px;margin-top:10px;">
									1.当月工资计算如下：
								</div>
								<div style="margin-left:30px;margin-top:10px;">
								<table class='xiangmu' width='800px' cellSpacing=0 cellPadding=4>
									<tr style='background:#91C7E1' height='30px'>
										<th width='200px' class='borderleft'>
											<span>基本工资</span>
										</th>
										<th width='200px' >
											<span>福利费</span>
										</th>
										<th width='200px'>
											<span>保险费</span>
										</th>
										<th width='200px'>
											<span>总工资</span>
										</th>																													
									</tr>
								<%
									String name = session.getAttribute("name").toString();
									LedgerDM ldDm=new LedgerDM();
									ldDm.OpenDB();
									
									ArrayList<QueryLedger> list=ldDm.searchLedger(name);
									
									for(QueryLedger ql:list){
										out.print("<tr><td width='200px' class='borderleft'>"+ql.getBasicWage()+"</td>");
										out.print("<td width='200px'>"+ql.getWelfareCost()+"</td>");
										out.print("<td width='200px'>"+ql.getPremium()+"</td>");
										out.println("<td width='200px'>"+ql.getTotalSalary()+"</td></tr>");																				
									}
									ldDm.CloseDB();
								 %>
								 </table>
							</div>
							<div style="margin-left:30px;margin-top:10px;">
									2.申请记录情况：
								</div>
								<div style="margin-left:30px;margin-top:10px;">
								<table class='xiangmu' width='1020px' cellSpacing=0 cellPadding=4>
									<tr style='background:#91C7E1' height='30px'>
										<th width='100px' class='borderleft'>
											<span>申请号</span>
										</th>
										<th width='100px' >
											<span>申请人姓名</span>
										</th>
										<th width='80px'>
											<span>申请金额</span>
										</th>
										<th width='250px'>
											<span>申请理由</span>
										</th>
										<th width='150px'>
											<span>银行卡号</span>
										</th>
										<th width='140px'>
											<span>财务部门批准情况</span>
										</th>		
										<th width='140px'>
											<span>管理层批准情况</span>
										</th>		
										<th width='80px'>
											<span>申请时间</span>
										</th>																									
									</tr>
								<%
									AppFormDM afDm=new AppFormDM();
									afDm.OpenDB();
									
									ArrayList<ApplicationForm> list2=afDm.searchAll(name);
									
									for(ApplicationForm af:list2){
										String getIsFinApproval;
										if(af.getIsFinApproval()==null)
											getIsFinApproval="待定";
										else if(af.getIsFinApproval().equals("true"))
											getIsFinApproval="批准";
										else
											getIsFinApproval="未批准";
										String getIsManApproval;
										if(af.getIsManApproval()==null)
											getIsManApproval="待定";
										else if(af.getIsManApproval().equals("true"))
											getIsManApproval="批准";
										else
											getIsManApproval="未批准";
										out.print("<tr><td  class='borderleft'>"+af.getApply_ID()+"</td>");
										out.print("<td >"+af.getApplicant()+"</td>");
										out.print("<td >"+af.getAmount()+"</td>");
										out.print("<td >"+af.getReason()+"</td>");
										out.print("<td >"+af.getShroffAccountNumber()+"</td>");
										out.print("<td >"+getIsFinApproval+"</td>");
										out.print("<td >"+getIsManApproval+"</td>");
										out.println("<td >"+af.getAppTime()+"</td></tr>");																				
									}
									afDm.CloseDB();
								 %>
								 </table>
							</div>
							<div style="margin-left:30px;margin-top:10px;">
									3.报账记录情况：
								</div>
								<div style="margin-left:30px;margin-top:10px;">
								<table class='xiangmu' width='700px' cellSpacing=0 cellPadding=4>
									<tr style='background:#91C7E1' height='30px'>
										<th width='100px' class='borderleft'>
											<span>申请号</span>
										</th>
										<th width='80px'>
											<span>申请金额</span>
										</th>
										<th width='80px'>
											<span>花费金额</span>
										</th>
										<th width='80px'>
											<span>余额</span>
										</th>
										<th width='140px'>
											<span>财务部门核实情况</span>
										</th>
										<th width='140px'>
											<span>管理层核实情况</span>
										</th>		
										<th width='80px'>
											<span>报账时间</span>
										</th>																									
									</tr>
								<%
									RenderAccountDM raDm=new RenderAccountDM();
									raDm.OpenDB();
									
									ArrayList<RenderAccount> list3=raDm.searchAll(name);
									
									for(RenderAccount ra:list3){
										if(ra.getBztime()!=null){
											String getIsFinCheck;
										if(ra.getIsFinCheck()==null)
											getIsFinCheck="待定";
										else if(ra.getIsFinCheck().equals("true"))
											getIsFinCheck="批准";
										else
											getIsFinCheck="未批准";
										String getIsManCheck;
										if(ra.getIsManCheck()==null)
											getIsManCheck="待定";
										else if(ra.getIsManCheck().equals("true"))
											getIsManCheck="批准";
										else
											getIsManCheck="未批准";
											out.print("<tr><td  class='borderleft'>"+ra.getApply_ID()+"</td>");
											out.print("<td >"+ra.getAmount()+"</td>");
											out.print("<td >"+ra.getReceiptAccount()+"</td>");
											out.print("<td >"+ra.getBalance()+"</td>");
											out.print("<td >"+getIsFinCheck+"</td>");
											out.print("<td >"+getIsManCheck+"</td>");
											out.println("<td >"+ra.getBztime()+"</td></tr>");	
										}																	
									}
									raDm.CloseDB();
								 %>
								 </table>
							</div>
							<div style="margin-left:30px;margin-top:10px;">
									4.项目完成记录情况：
								</div>
								<div style="margin-left:30px;margin-top:10px;">
								<table class='xiangmu' width='620px' cellSpacing=0 cellPadding=4>
									<tr style='background:#91C7E1' height='30px'>
										<th width='100px' class='borderleft'>
											<span>申请号</span>
										</th>
										<th width='80px'>
											<span>申请金额</span>
										</th>
										<th width='80px'>
											<span>项目收入</span>
										</th>
										<th width='140px'>
											<span>财务部门核实情况</span>
										</th>		
										<th width='140px'>
											<span>管理层核实情况</span>
										</th>		
										<th width='80px'>
											<span>提交时间</span>
										</th>																									
									</tr>
								<%
									ProjectIncomeDM piDm=new ProjectIncomeDM();
									piDm.OpenDB();
									
									ArrayList<ProjectIncome> list4=piDm.searchAll(name);
									
									for(ProjectIncome pi:list4){
										if(pi.getProtime()!=null){
										String getIsFinProjectCheck;
										if(pi.getIsFinProjectCheck()==null)
											getIsFinProjectCheck="待定";
										else if(pi.getIsFinProjectCheck().equals("true"))
											getIsFinProjectCheck="批准";
										else
											getIsFinProjectCheck="未批准";
										String getIsManProjectCheck;
										if(pi.getIsManProjectCheck()==null)
											getIsManProjectCheck="待定";
										else if(pi.getIsManProjectCheck().equals("true"))
											getIsManProjectCheck="批准";
										else
											getIsManProjectCheck="未批准";
											out.print("<tr><td  class='borderleft'>"+pi.getApply_ID()+"</td>");
											out.print("<td >"+pi.getAmount()+"</td>");
											out.print("<td >"+pi.getIncome()+"</td>");
											out.print("<td >"+getIsFinProjectCheck+"</td>");
											out.print("<td >"+getIsManProjectCheck+"</td>");
											out.println("<td >"+pi.getProtime()+"</td></tr>");	
										}																	
									}
									piDm.CloseDB();
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