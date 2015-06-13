<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.sql.DepartmentManagement,swu.edu.cn.bean.DepartmentBean"%>
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
			div.new{
				margin-top:5px;
				margin-bottom:5px;
				margin-left:10px;
			}	
			.ResultM_1{
	    		background:url(images/ResultManager_1.png);width:362px;height:57px;float:left;
	    	}	
		</STYLE>
		<script type='text/javascript'>
			var departList = new Array();
			var departListId =new Array();
			departList['选择分类'] = ['选择部门'];
			departList['区级部门'] = [];
		    departList['园区管委会'] = [];
		    departList['乡镇街道'] = [];
		    
		    departListId['选择分类'] = ['选择部门'];
			departListId['区级部门'] = [];
		    departListId['园区管委会'] = [];
		    departListId['乡镇街道'] = [];
		    
		    
			function user_right(name){
				document.getElementById('div_add').style.display='none';
				document.getElementById('div_del').style.display='none';
				document.getElementById('div_hebing').style.display='none';
				document.getElementById(name).style.display='block';
			}
			function depart_add()
		    {
		        var d =  document.getElementById('select_fenlei');
				var index = d.selectedIndex;
				var value = d.options[index].value;
		        document.form1.action="departM_addDepart.action?fenlei="+value;
		        document.form1.submit(); 
		    }
		    function depart_del()
		    {
		    	var d =  document.getElementById('select_depart');
				var index = d.selectedIndex;
				var value = d.options[index].value;	        
		        document.form1.action="departM_delDepart.action?departId="+value;
		        document.form1.submit(); 
		    }
		    function del_desplay(){
//		    	var departList = new Array();
//		    	departList['选择分类'] = ['选择部门'];
//		    	departList['区级部门'] = ['选择部门','政府办','组织部','宣传部'];
//		    	departList['园区管委会'] = ['选择部门','工业园区管委会','新城区管委会','农业园区管委会'];
//		    	departList['乡镇街道'] = ['选择部门','东城街道','南城街道','神童镇'];
		    	var index = document.form1.select_fenlei2.value;		//当选择改变时，获取选中的text
		    	document.form1.select_depart.options.length = 0;
		    	for(var i in departList[index])
		    		document.form1.select_depart.options.add(new Option(departList[index][i],departListId[index][i]));
		    }
		    function hebing_desplay1(){
		    	var index = document.form1.select_fenlei3.value;
		    	document.form1.select_depart3.options.length = 0;
		    	for(var i in departList[index])
		    		document.form1.select_depart3.options.add(new Option(departList[index][i],departListId[index][i]));
		    }
		    function hebing_desplay2(){
		    	var index = document.form1.select_fenlei4.value;
		    	document.form1.select_depart4.options.length = 0;
		    	for(var i in departList[index])
		    		document.form1.select_depart4.options.add(new Option(departList[index][i],departListId[index][i]));
		    }
		    function initbody(){
		    	<% DepartmentManagement  dm=new DepartmentManagement();
				   dm.OpenDB();
				   List list=dm.getAllDepartment();
				   while(!list.isEmpty()){
				   		DepartmentBean db=new DepartmentBean();
						db=(DepartmentBean) list.get(0);
						%>
							departListId['<%=db.getDepartmentClassify()%>'].push('<%=db.getDepartmenID()%>');
							departList['<%=db.getDepartmentClassify()%>'].push('<%=db.getDepartmentName()%>');
						<%list.remove(0);
				   }%>
		    }
		    initbody();
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
								机构管理
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
							<form name='form1' method='post'>
							<div style="background:url(images/ResultManager_2.png);width:auto;height:57px;">
						    	<div class="ResultM_1"></div>						    
					    	</div>
							<div>&nbsp;&nbsp;&nbsp;&nbsp;机构管理</div><br/>
							<div style='width:600px;height:auto;border:1px solid rgb(119,119,170);padding-top:5px;padding-left:10px;padding-right:10px;margin-left:30px;background:rgb(20%, 60%, 100%);'>
								<span class='class1'><a href='javascript:void(0)' onclick="user_right('div_add');">新增部门</a></span>
								<span class='class1'><a href='javascript:void(0)' onclick="user_right('div_del');">删除部门</a></span>		
								<span class='class1'><a href='javascript:void(0)' onclick="user_right('div_hebing');">合并部门</a></span>			
							</div>
							
							<div id='div_add' style='width:600px;height:200px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;margin-left:30px;'>
								<div>新增一个部门：</div><br/>
								<div class='new'>选择分类：
									<select id='select_fenlei'>
										<option value="">选择分类</option>
										<option value="区级部门">区级部门</option>
										<option value="园区管委会">园区管委会</option>
										<option value="乡镇街道">乡镇街道</option>
									</select>
								</div>
								<div class='new'>部门名称：<input name='departname' type='text' /></div>
								<div class='new'>部门职能：<textarea name='departfunction' style='height:50px;width:300px'></textarea></div>
								
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='确定' onclick='depart_add()'/>
								</div>
							</div>
							<div id='div_del' style='width:600px;height:200px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;display:none;margin-left:30px;'>
								<div>删除一个部门：</div><br/>
								<div class='new'>选择分类：
									<select id='select_fenlei2' onchange='del_desplay()'>
										<option value="选择分类">选择分类</option>
										<option value="区级部门">区级部门</option>
										<option value="园区管委会">园区管委会</option>
										<option value="乡镇街道">乡镇街道</option>
									</select>
									选择部门：
									<select id='select_depart' onchange='javascript:alert(document.form1.select_depart.value)'>
										<option value="">选择部门</option>
									</select>
								</div><br/>
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='确定' onclick='depart_del'/>
								</div>
							</div>
							<div id='div_hebing' style='width:600px;height:200px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;display:none;margin-left:30px;'>
								<div>合并两个部门：</div><br/>
								<div class='new'>选择分类：
									<select id='select_fenlei3' onchange='hebing_desplay1()'>
										<option value="">选择分类</option>
										<option value="区级部门">区级部门</option>
										<option value="园区管委会">园区管委会</option>
										<option value="乡镇街道">乡镇街道</option>
									</select>
									选择部门1：
									<select id='select_depart3'>
										<option value="选择部门">选择部门</option>
									</select>
								</div>
								<div class='new'>选择分类：
									<select id='select_fenlei4' onchange='hebing_desplay2()'>
										<option value="选择分类">选择分类</option>
										<option value="区级部门">区级部门</option>
										<option value="园区管委会">园区管委会</option>
										<option value="乡镇街道">乡镇街道</option>
									</select>
									选择部门2：
									<select id='select_depart4'>
										<option value="选择部门">选择部门</option>
									</select>			
								</div>
								<div class='new'>新的名称：<input type='text' /></div>
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='确定'/>
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