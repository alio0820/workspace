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
	    		background:url(images/projectEntry.png);width:362px;height:57px;float:left;
	    	}	
		</STYLE>
		<script type='text/javascript'>
			function user_right(name){
				document.getElementById('div_new').style.display='none';
				document.getElementById('div_change').style.display='none';
				document.getElementById('div_del').style.display='none';
				document.getElementById(name).style.display='block';
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
								项目录入
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
							<div>&nbsp;&nbsp;&nbsp;&nbsp;项目录入</div><br/>
							<div style='width:600px;height:auto;border:1px solid rgb(119,119,170);padding-top:5px;padding-left:10px;padding-right:10px;margin-left:30px;'>
								<span class='class1'><a href='javascript:void(0)' onclick="user_right('div_new');">新增部门</a></span>
								<span class='class1'><a href='javascript:void(0)' onclick="user_right('div_change');">删除部门</a></span>		
								<span class='class1'><a href='javascript:void(0)' onclick="user_right('div_del');">合并部门</a></span>			
							</div>
							<div id='div_new' style='width:600px;height:200px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;margin-left:30px;'>
								<div>新增一个部门：</div><br/>
								<div class='new'>选择分类：
									<select>
										<option value="">选择分类</option>
										<option value="quji">区级部门</option>
										<option value="yuanqu">园区管委会</option>
										<option value="xiangz">乡镇街道</option>
									</select>			
								</div>
								<div class='new'>部门名称：<input type='text' /></div>
								<br/>
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='确定'/>
								</div>
							</div>
							<div id='div_change' style='width:600px;height:200px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;display:none;margin-left:30px;'>
								<div>删除一个部门：</div><br/>
								<div class='new'>选择分类：
									<select>
										<option value="">选择分类</option>
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
								</div><br/>
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='确定' onclick='deldepart'/>
								</div>
							</div>
							<div id='div_del' style='width:600px;height:200px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;display:none;margin-left:30px;'>
								<div>合并一个部门：</div><br/>
								<div class='new'>选择分类：
									<select>
										<option value="">选择分类</option>
										<option value="quji">区级部门</option>
										<option value="yuanqu">园区管委会</option>
										<option value="xiangz">乡镇街道</option>
									</select>
									选择部门1：
									<select>
										<option value="">选择部门</option>
										<option value="quji">管委会</option>
										<option value="yuanqu">财政部</option>
										<option value="xiangz">民政局</option>
										<option value="xiangz">......</option>
									</select>			
								</div>
								<div class='new'>选择分类：
									<select>
										<option value="">选择分类</option>
										<option value="quji">区级部门</option>
										<option value="yuanqu">园区管委会</option>
										<option value="xiangz">乡镇街道</option>
									</select>
									选择部门2：
									<select>
										<option value="">选择部门</option>
										<option value="quji">管委会</option>
										<option value="yuanqu">财政部</option>
										<option value="xiangz">民政局</option>
										<option value="xiangz">......</option>
									</select>			
								</div>
								<div class='new'>新的名称：<input type='text' /></div>
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='确定'/>
								</div>
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