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
				border:1px solid #6F9FC0;
				text-align:center;
				overflow:hidden;				
				}	
			table.xiangmu th {
				border:1px solid #6F9FC0;
				text-align:center;				
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
			function query_xiangmu(){
				var d =  document.getElementById('query_select');
				var index = d.selectedIndex;
				var value = d.options[index].value;
				document.getElementById('query_danwei').style.display='none';
				document.getElementById('query_mingcheng').style.display='none';
				document.getElementById('query_wancheng').style.display='none';
				document.getElementById('query_shen').style.display='none';
				document.getElementById(value).style.display='block';
			}
			function query(){
				alert('查询成功');
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
							<SPAN style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
							<SPAN style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(images/main_hb.gif); COLOR: white; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0 px: ">
								项目查询
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
							<div>&nbsp;&nbsp;&nbsp;&nbsp;项目查询</div><br/>
							<div style='width:600px;height:auto;border:1px solid rgb(119,119,170);padding-top:5px;padding-left:10px;padding-right:10px;margin-left:30px;'>
								<div>
									<span>请选择查询方式：</span>
									<select id='query_select' onchange='query_xiangmu()'>
										<option value='query_danwei'selected>按部门</option>
										<option value='query_mingcheng'>名称</option>
										<option value='query_wancheng'>完成情况</option>
										<option value='query_shen'>未申报</option>
										<option value='query_shen'>未审核</option>
									</select>
									<span>请选择月份：</span>
									<select id='query_month'>
										<option value=''selected>1月</option>
										<option value=''>2月</option>
										<option value=''>3月</option>
										<option value=''>4月</option>
										<option value=''>5月</option>
										<option value=''>6月</option>
										<option value=''>7月</option>
										<option value=''>8月</option>
										<option value=''>9月</option>
										<option value=''>10月</option>
										<option value=''>11月</option>
										<option value=''>12月</option>
									</select>
								</div>			
							</div>	
							<div id='query_danwei' style='width:600px;height:100px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;margin-left:30px;'>								
								<div class='new'>选择级别：
									<select>
										<option value="">选择级别</option>
										<option value="quji">区级部门</option>
										<option value="yuanqu">园区管委会</option>
										<option value="xiangz">乡镇街道</option>
									</select>	
									选择部门：
									<select>
										<option value="">选择部门</option>
										<option value="quji">管委会</option>
										<option value="yuanqu">财政部</option>
										<option value="xiangz">民政局</option>
										<option value="xiangz">......</option>
									</select>	
								</div>
																
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='查询' onclick='query()'/>
								</div>
							</div>
							
							<div id='query_mingcheng' style='width:600px;height:70px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;margin-left:30px;display:none;'>								
								<div class='new'>
									<span>请输入项目名：</span>
									<input type='text' size='20'/>
								</div>															
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='查询' onclick='query()'/>
								</div>
							</div>
							
							<div id='query_wancheng' style='width:600px;height:70px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;margin-left:30px;display:none;'>								
								<div class='new'>选择级别：
									<select>
										<option value="">所有级别</option>
										<option value="quji">区级部门</option>
										<option value="yuanqu">园区管委会</option>
										<option value="xiangz">乡镇街道</option>
									</select>
									选择部门：
									<select>
										<option value="">所有部门</option>
										<option value="quji">管委会</option>
										<option value="yuanqu">财政部</option>
										<option value="xiangz">民政局</option>
										<option value="xiangz">......</option>
									</select>
									完成情况：
									<select>
										<option value="">完成10%</option>
										<option value="">完成20%</option>
										<option value="">完成30%</option>
										<option value="">完成40%</option>
										<option value="">完成50%</option>
										<option value="">完成60%</option>
										<option value="">完成70%</option>
										<option value="">完成80%</option>
										<option value="">完成90%</option>
										<option value="">全部完成</option>
									</select>			
								</div>															
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='查询' onclick='query()'/>
								</div>
							</div>
							<div id='query_shen' style='width:600px;height:70px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;margin-left:30px;display:none;'>								
								<div class='new'>选择级别：
									<select>
										<option value="">所有级别</option>
										<option value="quji">区级部门</option>
										<option value="yuanqu">园区管委会</option>
										<option value="xiangz">乡镇街道</option>
									</select>
									选择部门：
									<select>
										<option value="">所有部门</option>
										<option value="quji">管委会</option>
										<option value="yuanqu">财政部</option>
										<option value="xiangz">民政局</option>
										<option value="xiangz">......</option>
									</select>										
								</div>															
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='查询' onclick='query()'/>
								</div>
							</div><br>
							<div style='width:600px;height:auto;border:1px solid rgb(119,119,170);padding-top:5px;padding-left:10px;padding-right:10px;margin-left:30px;'>
								<span>查询结果</span>
							</div>
							<div id='query_shen' style='width:600px;height:70px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;margin-left:30px;'>	
								项目名称，考核指标，责任部门，进展情况
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