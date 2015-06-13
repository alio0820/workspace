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
		<script type='text/javascript'>
			function check(link){
				var Apply_ID= link.name;
				var isManApproval;
				if(document.getElementsByName(Apply_ID)[0].checked)		//radio选中是属性
					isManApproval='true';
				else
					isManApproval='false';
				document.form1.action="manApp_ManApprovalUpdate.action?Apply_ID="+Apply_ID+"&isManApproval="+isManApproval;
				document.form1.submit();
			}
		</script>
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
								批准员工申请信息
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
							<form name='form1' method ='post' action ='appForm_insertForm.action'>
								<div style="margin-left:30px;margin-top:20px;">
								<table class='xiangmu' width='960px' cellSpacing=0 cellPadding=4>
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
											<span>管理层批准操作</span>
										</th>														
										<th width='80px'>
											<span>申请时间</span>
										</th>				
										<th width='80px'>
											<span>提交</span>
										</th>																			
									</tr>
								<%
									ManagementApproval manapp=new ManagementApproval();
									manapp.OpenDB();
									
									ArrayList<ApplicationForm> list=manapp.ManApproval();
									
									for(ApplicationForm af:list){
										out.print("<tr><td  class='borderleft'>"+af.getApply_ID()+"</td>");
										out.print("<td >"+af.getApplicant()+"</td>");
										out.print("<td >"+af.getAmount()+"</td>");
										out.print("<td >"+af.getReason()+"</td>");
										out.print("<td >"+af.getShroffAccountNumber()+"</td>");
										out.print("<td >批准<input type='radio' name='"+af.getApply_ID()+"' value='pizhun' checked/>未批准<input type='radio' name='"+af.getApply_ID()+"' value='weipizhun'/></td>");									
										out.print("<td >"+af.getAppTime()+"</td>");	
										out.print("<td ><input type='button' name='"+af.getApply_ID()+"' value='提交' onclick='return check(this)'></td></tr>");																			
									}
									manapp.CloseDB();
									if(list.size()==0)
										out.print("您现在没有财务申请信息需要批准...");
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