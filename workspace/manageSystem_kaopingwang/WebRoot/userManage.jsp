<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Untitled Page</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
		<STYLE type=text/css>
			{
				FONT-SIZE:12px
			}
			div.new{
				margin-top:5px;
				margin-bottom:5px;
				margin-left:10px;
			}
			.ResultM_1{
	    		background:url(images/userManage.png);width:362px;height:57px;float:left;
	    	}	
	    	a{
				text-decoration:none;
				color:white;
			}
			span.class1{
				border:1px solid rgb(119,119,170);
				margin-left:5px;
				margin-right:2px;
				margin-top:3px;
				padding:4px 4px 0 4px;
				display:inline-block;
			}
			.div_changes{
				width:600px;
				height:200px;
				border:1px solid rgb(119,119,170);
				border-top:none;
				padding:10px 0 0 10px;
				margin-left:30px;
			}
		</STYLE>
		<script type='text/javascript'>
			function user_right(name){
				document.getElementById('div_new').style.display='none';
				document.getElementById('div_change').style.display='none';
				document.getElementById('div_del').style.display='none';
				document.getElementById('div_query').style.display='none';
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
							<SPAN
								style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN><SPAN
								style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(images/main_hb.gif); COLOR: white; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0 px: ">
								用户管理
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
							style="PADDING-RIGHT: 10px; PADDING-LEFT: 0px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white"
							vAlign=top >
							<div style="background:url(images/ResultManager_2.png);width:auto;height:57px;">
						    	<div class="ResultM_1"></div>						    
					    	</div>
							<div>&nbsp;&nbsp;&nbsp;&nbsp;用户管理</div><br/>
							<div style='width:600px;height:auto;border:1px solid rgb(119,119,170);padding-top:5px;padding-left:10px;padding-right:10px;margin-left:30px;background:rgb(20%, 60%, 100%);'>
								<span class='class1'><a href='javascript:void(0)' onclick="user_right('div_new');">添加</a></span>
								<span class='class1'><a href='javascript:void(0)' onclick="user_right('div_change');">修改</a></span>		
								<span class='class1'><a href='javascript:void(0)' onclick="user_right('div_del');">删除</a></span>
								<span class='class1'><a href='javascript:void(0)' onclick="user_right('div_query');">查看</a></span>				
							</div>
							<div id='div_new' class="div_changes">
								<div>添加一个用户：</div>
								<div class='new'>用户名：&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' /></div>
								<div class='new'>密&nbsp;&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;&nbsp;&nbsp;<input type='password' /></div>
								<div class='new'>确认密码：<input type='password' /></div>
								<div class='new'>真实姓名：<input type='text' /></div>
								<div class='new'>部&nbsp;&nbsp;&nbsp;&nbsp;门：&nbsp;&nbsp;&nbsp;
									<select>
										<option>经信委</option>
										<option>发改委</option>
										<option>财政部</option>
										<option>.....</option>
									</select>
								</div>
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='确定'/>
								</div>
							</div>
							<div id='div_change' class="div_changes" style='display:none;'>
								<div>修改密码：</div>
								<div class='new'>用户名：&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' /></div>
								<div class='new'>原始密码：<input type='password' /></div>
								<div class='new'>新的密码：<input type='password' /></div>							
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='确定'/>
								</div>
							</div>
							<div id='div_del' class="div_changes" style='display:none;'>
								<div>删除一个用户：</div>
								<div class='new'>用户名：<input type='text' /></div>		
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='确定'/>
								</div>
							</div>
							<div id='div_query' class="div_changes" style='display:none;'>
								<div>查询一个用户：</div>
								<div class='new'>用户名：<input type='text' /></div>
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