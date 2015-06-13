<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Untitled Page</TITLE>
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
			function createXDOM() {
				if (window.XMLHttpRequest) {
		
					xmlHttp = new XMLHttpRequest();
		
				} else if (window.ActiveXObject) {
		
					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
				} else {
				
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
			}
			function display(){
			    createXDOM();
			    var myDate = new Date();
				var str = myDate.getTime();			//加入时间戳，解决IE等浏览器的缓存问题
			    var leibie = document.form1.leibie.value;	
				var url = "fileupload?leibie="+leibie+"&str="+str;
				xmlHttp.open("get",url,true);				//如果是servlet，直接执行doGet方法；不需要为其指定方法
				xmlHttp.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				xmlHttp.onreadystatechange = wancheng;
				xmlHttp.send(null);
			}
			function wancheng(){
				if (xmlHttp.readyState == 4) {
//					responseContext = xmlHttp.responseText;
//					alert(responseContext);
					}
			}
			function sub(){
				var myfile = document.form1.myfile.value;
				if(myfile=null||myfile=="")
					{
						result.innerHTML= "文件为空...";
						return false;
					}
				return true;
			}
			
		</script>
	</HEAD>
	<BODY onload='display()'>
		<%	String result="";
			Object result_o = request.getAttribute("result");
		  if(result_o!=null)
		  	result= result_o.toString();%>
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
						<form name='form1' method='post' enctype="multipart/form-data" action='fileupload'>
							<div style="background:url(images/ResultManager_2.png);width:auto;height:57px;">
						    	<div class="ResultM_1"></div>						    
					    	</div>
							<div>&nbsp;&nbsp;&nbsp;&nbsp;项目录入</div><br/>
							<div style='width:600px;height:auto;border:1px solid rgb(119,119,170);padding-top:5px;padding-left:10px;padding-right:10px;margin-left:30px;'>
								<span class='class1'><a href='javascript:void(0)'>项目录入</a></span>		
							</div>
							<div id='div_new' style='width:600px;height:200px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;margin-left:30px;'>
								<div>选择分类：
									<select name="leibie"  onchange='display()'>
								       <option value="evaluation">导入评估</option>
								       <option value="department" selected>导入部门</option>
								       <option value="project">导入项目</option>
								    </select>
								</div>																		
								<div class='new'><input type="file" name="myfile">
								<label id='result' style='color:red'><%=result %></label>
								<br/><br/>
       								<input type="submit" name="button" value="导入" onclick='return sub()'>
       							</div>
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