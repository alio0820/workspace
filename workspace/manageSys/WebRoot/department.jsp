<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <TITLE>Untitled Page</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
		<script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script>
    	<script language="javascript" type="text/javascript" src="js/jquery.js"></script>
    	<script language="javascript" type="text/javascript" src="js/jquery.flot.js"></script>
		<STYLE type=text/css>
			{
				FONT-SIZE:12px
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
		</STYLE>
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
								style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(images/main_hb.gif); COLOR: white; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0 px: ">责任部门
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
							style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white"
							vAlign=top >
							<div>
								<div>
									<span><img src="images/dutydepart.gif" alt='责任单位'/>责任单位：（...）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span><img src="images/dutyp.gif" alt='责任人'/>责任人：（...）</span>
									<span>发布日期：2012-04-12</span>
								</div><br/>
								<div>本月进度审查情况</div>
								<div style="margin-left:30px;margin-top:20px;">
									<table class="xiangmu" cellSpacing=0 cellPadding=5 width='1000px'>
										<tr style='background:#91C7E1'>
											<th class='borderleft'>
												项目名称
											</th>
											<th>
												项目指标
											</th>
											<th>
												任务总进度
											</th>
											<th>
												牵头部门审批
											</th>
											<th>
												区领导审批
											</th>
											<th>
												两办督查审批
											</th>		
										</tr>
										<tr>
											<td width='200px' class='borderleft'>
												博赛集团先锋氧化铝环保节能技改项目
											</td>
											<td width='300px'>
												将原有年产60万吨氧化铝生产规模实施技改扩能达到80万吨
											</td>
											<td width='205px'>
												<span id='jindu_bar' style='background:white;width:200px;height:20px;border:1px solid #91C7E1;'>
													<span id='jindu' style='background:#91C7E1;width:150px;height:20px;float:left'>
														75%
													</span>
												</span>
											</td>
											<td><span id='pishi1'>确认同意</span></td>
											<td><span id='pishi2'>确认同意</span></td>
											<td><span id='pishi3'>确认同意</span></td>
										</tr>
									</table>
								</div>
								<br/><br/>
								<div>项目进度情况</div><br>
								<div style="margin-left:30px;float:left">
									<table class="xiangmu" cellSpacing=0 cellPadding=4>
										<tr style='background:#91C7E1'>
											<th class='borderleft'>
												年度/月份
											</th>
											<th width='100px'>
												工作量(单位：元)
											</th>
											<th>
												占总指标比例
											</th>												
											<th width='400px'>
												具体事项
											</th>		
											<th>
												审核结果
											</th>				
										</tr>
										<tr>
											<td class='borderleft'>
												2012年度
											</td>
											<td><span>2000000</span></td>
											<td><span>100%</span></td>
											<td><span>2012年度需招商引资2000000元</span></td>
											<td><span>-</span></td>
										</tr>
										<tr>
											<td class='borderleft'>
												第一月份
											</td>
											<td><span>200000</span></td>
											<td><span>10%</span></td>
											<td><span>第一月份吸引资金200000元</span></td>
											<td><span>通过</span></td>
										</tr>
										<tr>
											<td class='borderleft'>
												第二月份
											</td>
											<td><span>200000</span></td>
											<td><span>10%</span></td>
											<td><span>第二月份吸引资金200000元</span></td>
											<td><span>通过</span></td>
										</tr>
										<tr>
											<td class='borderleft'>
												第三月份
											</td>
											<td><span>200000</span></td>
											<td><span>10%</span></td>
											<td><span>第三月份吸引资金200000元</span></td>
											<td><span>通过</span></td>
										</tr>
										<tr>
											<td class='borderleft'>
												第四月份
											</td>
											<td><span>200000</span></td>
											<td><span>10%</span></td>
											<td><span>第四月份吸引资金200000元</span></td>
											<td><span>通过</span></td>
										</tr>
										<tr>
											<td class='borderleft'>
												第五月份
											</td>
											<td><span>200000</span></td>
											<td><span>10%</span></td>
											<td><span>第五月份吸引资金200000元</span></td>
											<td><span>通过</span></td>
										</tr>
										<tr>
											<td class='borderleft'>
												第六月份
											</td>
											<td><span>200000</span></td>
											<td><span>10%</span></td>
											<td><span>第六月份吸引资金200000元</span></td>
											<td><span>通过</span></td>
										</tr>
										<tr>
											<td class='borderleft'>
												第七月份
											</td>
											<td><span>200000</span></td>
											<td><span>10%</span></td>
											<td><span>第七月份吸引资金200000元</span></td>
											<td><span>通过</span></td>
										</tr>
										
									</table>
								</div>
								<div id="placeholder1" style="float:right;width:300px;height:200px;border:1px solid lightblue" ></div>
								<script type="text/javascript">
								$(function () {
									var d1=[];var d2 =[];
								    for (var i = 0; i < 12; i++)
								        d1.push([i,i*i-5*i]);
								              								    
								    $.plot($("#placeholder1"), 
								    [
								        {
								            data: d1,
								            label:"进度",
								            lines: { show: true, fill: true },
								            points: { show: true } 
								        },
								        {
								            data: d2,
								            //bars: { show: true ,fill: true},
								             lines: { show: true, fill: true },
								            points: { show: true }
								        }
								    ],
								    {
								    	grid: { hoverable: true, clickable: true },
								    	yaxis: { min: 0, max: 1.0 }
								    }
								    );
								
								$("#placeholder1").bind("plothover", function (event, pos, item) {
						            if (item) {					                    
						                    $("#tooltip").remove();
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