<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.sql.*,swu.edu.cn.bean.*,java.sql.ResultSet,java.text.DecimalFormat;"%>
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
						    <div>
			<span><img src="images/dutydepart.gif" alt='责任单位'/>责任单位：（...）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span><img src="images/dutyp.gif" alt='责任人'/>责任人：（...）</span>
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