<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.bean.*,swu.edu.cn.sql.*"%>
<!DOCTYPE HTML> 
<html>
	<head>
		<title>Untitled Page</title>
		<link rel="stylesheet" type="text/css" href="css/motaiduihk.css"/>
		<script type="text/javascript" src="js/motaiduihk.js"></script>
		
		<style type=text/css>
			{
				FONT-SIZE:12px;
			}
			html,body{
				BACKGROUND-POSITION-Y: -120px;
				BACKGROUND-IMAGE: url(images/bg.gif);
				BACKGROUND-REPEAT: repeat-x;
				padding:3px 1px 3px 1px;
				width:100%;
				height:100%;
			}
			table.table1 td{
				padding:0;
				margin:0;
			}
			table.xiangmu td {
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:left;
				overflow:hidden;
				font-size:12px;	
				padding:4px;		
				}	
			table.xiangmu th {
				border-top:1px solid #6F9FC0;
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:center;
				font-size:14px;
				padding:4px;				
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
		</style>
		<script type='text/javascript'>
		    var projectId;
			function test(name){
				var str = "<div><textarea name='lingdao_ps' style='width:325px;height:80px'></textarea><br/><input type='button' onclick='display(lingdao_ps.value,"+name+")'value='提交'></div>";
				var dialog = new ModelDialog({
				template : str,
				//shadowOpy : 0.1,
				//dragable : false
				dragInWin : false
				//area : [0,500,0,500]
				});
					dialog['onbi'] = function(){
						;
					};
			}
			//向后台发送数据
			function createXDOM() {
				if (window.XMLHttpRequest) {
					xmlHttp = new XMLHttpRequest();		
				} else if (window.ActiveXObject) {		
					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
				} else {				
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
			}
			function display(value,name){
				if(value==""){
					
					return false;
				}
				projectId = name;
			    createXDOM();
				var url = "LeaderCheck_ps.action?value="+value+"&projectId="+name;
				xmlHttp.open("post",url,true);
				xmlHttp.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				xmlHttp.onreadystatechange = ps;
				xmlHttp.send(null);
			}
			function ps(){
				if (xmlHttp.readyState == 4) {
					responseContext = xmlHttp.responseText;
					document.getElementById(projectId).innerHTML =responseContext;
					}
			}
		</script>
	</head>
	<body>
		<div style='width:100%;height:100%'>
			<table class='table1' style='height:100%;width:100%;border-collapse:collapse'>
				<tbody>
					<tr
						style="BACKGROUND-IMAGE: url(images/bg_header.gif); BACKGROUND-REPEAT: repeat-x"
						height=47px>
						<td width=15px>
							<span 
								style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hl.gif); WIDTH: 15px; background-position: left top; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></span>
						</td>
						<td>
							<span style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></span>
							<span style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(images/main_hb.gif); COLOR: white; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0 px: ">
								项目分类
							</span>
							<span style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></span>
						</td>
						<td
							style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-REPEAT: no-repeat; BACKGROUND-IMAGE: url(images/main_rc.gif)"
							width=10></td>
					</tr>
					<tr>
						<td
							style="background: url(images/main_ls.gif); background-color: rgb(255, 255, 255); BACKGROUND-REPEAT: repeat-y;">
							&nbsp;
						</td>
						<td style="PADDING-RIGHT:10px;PADDING-LEFT:10px;PADDING-BOTTOM:10px;COLOR:#566984;PADDING-TOP:0px;BACKGROUND-COLOR:white;" vAlign=top >
								<div style="background:url(images/ResultManager_2.png);width:auto;height:57px;">
						    		<div class="ResultM_1"></div>
					    		</div>
								<div style="margin-left:30px;margin-top:20px;">
								<table class='xiangmu' style='width:1010px;border-collapse:collapse;border-spacing:0;color:black;'>
									<tr style='background:#91C7E1' height='30px'>
										<th width='80px' class='borderleft'>
											<span>项目一级</span>
										</th>
										<th width='80px' >
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
										<th width='100px'>
											<span>项目进度</span>
										</th>	
										<th width='80px'>
											<span>领导批示</span>
										</th>																											
									</tr>
								<%
									String classify = request.getParameter("classify");
									classify=new String(classify.getBytes("ISO8859-1"),"UTF-8");
									ProjectManagement  pm=new  ProjectManagement();
									pm.OpenDB();
									ArrayList<ProjectBean> list=pm.searchProjectByClassify(classify);									
									for(ProjectBean prb : list){
//										 	System.out.print(prb.getProjectID()+"\t");
//										 	out.print("<tr><td width='100px' class='borderleft'>"+prb.getFirstClassify()+"</td>");
										 	out.print("<td width='100px' class='borderleft'>"+prb.getSecondClassify()+"</td>");
										 	out.print("<td width='100px'>"+prb.getThirdClassify()+"</td>");
											out.print("<td width='250px'><a href='xiangmu_xiangqing.jsp?projectId="+prb.getProjectID()+"'>"+prb.getProjectName()+"[<font style='color:rgb(21.2%, 43.1%, 72.9%);'>详情</font>]</a></td>");
											out.print("<td width='100px'>"+prb.getResponsibleDepartment()+"</td>");
											out.print("<td width='100px'>"+prb.getLeader()+"</td>");
											out.print("<td width='200px'>"+prb.getExpectTask()+"</td>");											
											out.println("<td width='200px'>"+prb.getCurrentProgress()+"</td>");
											out.println("<td id= '"+prb.getProjectID()+"'width='80px'><input type='button' name='"+prb.getProjectID()+"' value='给予批示' onclick='test(this.name)'/></td></tr>");
							//				System.out.println(prb.getStatus());											
									 }
									pm.CloseDB();
								 %>
								 </table>
								 <input type='button' value='确定' onclick='test()'/>
							</div>
						</td>
						<td style="BACKGROUND-IMAGE: url(images/main_rs.gif)"></td>
					</tr>
					<tr style="BACKGROUND-IMAGE: url(images/main_fs.gif); background-color: rgb(255, 255, 255); BACKGROUND-REPEAT: repeat-x;" height=10>
						<td style="BACKGROUND-IMAGE: url(images/main_lf.gif); BACKGROUND-REPEAT: no-repeat; width: 10px"></td>
						<td style="BACKGROUND-IMAGE: url(images/main_fs.gif)"></td>
						<td style="BACKGROUND-IMAGE: url(images/main_rf.gif)"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>