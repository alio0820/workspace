<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.bean.*,swu.edu.cn.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>无标题页</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<LINK href="css/public.css" type=text/css rel=stylesheet>
		<LINK href="css/login.css" type=text/css rel=stylesheet>
		<STYLE type=text/css>
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
	
		//实现下拉框的级联，当前一个select改变时触发
			function desplay(){
		    	var index = document.getElementsByName("jibie")[0].value;		//通过form去取select的id时，select的id不能用字符串表示，只能是名称,form只能去form表单中找，不能接字符串
		    	document.getElementsByName('department')[0].options.length = 0;
		    	for(var i in departList[index])
		    		document.getElementsByName('department')[0].options.add(new Option(departList[index][i],departListId[index][i]));
		    }
	
	
	function select_check(){;
		var jibie = document.form1.select1.value;
		if (jibie=='领导')
			{
				document.form1.jibie.style.display='none';
				document.form1.department.style.display='none';
			}
		else{
				document.form1.jibie.style.display='inline';
				document.form1.department.style.display='inline';
		}
	}
	function querenmima(){
		if(form1.password.value!=form1.password2.value)
			wrong_pass.innerHTML= '密码不一致';
		else
			wrong_pass.innerHTML = '&nbsp;';
	}
	function check(){
		if(form1.user.value=='')
			wrong_user.innerHTML='用户名为空';
		else 
			wrong_user.innerHTML='&nbsp;';
		if(form1.password.value=='')
			wrong_password.innerHTML='密码为空';
		else
			wrong_password.innerHTML='&nbsp;';
		if(form1.name.value=='')
			wrong_name.innerHTML='姓名为空';
		else
			wrong_name.innerHTML='&nbsp;';
		if(form1.password.value!=form1.password2.value)
			wrong_pass.innerHTML = '密码不一致';
		else 
			wrong_pass.innerHTML = '&nbsp;';
		if(form1.select1.value=='部门')
			if(form1.department.value=='选择部门'){
				wrong_department.innerHTML='请选择部门';
			}
			else
				wrong_department.innerHTML='&nbsp;';
		if(form1.user.value==''||form1.password.value==''||form1.name.value==''||(form1.password.value!=form1.password2.value)||(form1.select1.value=='部门'&&form1.department.value=='选择部门')){			
			return false;
		}
	}
	
	//初始化下拉框，用于级联
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
				   }
				   dm.CloseDB();%>
		    }
		    initbody();
</script>
	</HEAD>
	<BODY>
		<form name='form1' method='post' action='register.action'>
			<DIV id=div1>

				<TABLE id=login height="100%" cellSpacing=0 cellPadding=0 width=800
					align=center>
					<TBODY>
						<TR id=main>
							<TD>
								<table height="100%" cellspacing=0 cellpadding=0 width="100%">
									<tbody>
										<tr>
											<td colspan=4 style="font-size: 60px; text-align: right">
												<b>南川区政府考核系统</b>
											</td>
										</tr>
										<tr height=30>
											<td width=380>
												&nbsp;
											</td>
											<td width=70>
												<b><font style='font-size: 13px'>用户注册：</font> </b>
											</td>
											<td>
												&nbsp;
											</td>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr height=30>
											<td rowspan=5>
												&nbsp;
											</td>
											<td>
												用户名：
											</td>
											<td>
												<input class=textbox id=txtUserName name='user'>
											</td>
											<td width=100>
												<label id='wrong_user' style='color: red'>
													&nbsp;
												</label>
											</td>
										</tr>
										<tr height=30>
											<td>
												密 码：
											</td>
											<td>
												<input class=textbox id=txtUserPassword type=password
													name='password'>
											</td>
											<td width=100>
												<label id='wrong_password' style='color: red'>
													&nbsp;
												</label>
											</td>
										</tr>
										<tr height=30>
											<td>
												确认密码：
											</td>
											<td>
												<input class=textbox id=txtUserPassword type=password
													name='password2' onblur='querenmima()'>
											</td>
											<td width=100>
												<label id='wrong_pass' style='color: red'>
													&nbsp;
												</label>
											</td>
										</tr>
										<tr height=30>
											<td>
												姓 名：
											</td>
											<td>
												<input id=txtSN class=textbox name='name' />
											</td>
											<td width=100>
												<label id='wrong_name' style='color:red'>
													&nbsp;
												</label>
											</td>
										</tr>
										<tr height=50>
											<td colspan=2>
												<select name='select1' onchange='select_check()'>
													<option value='部门'>
														部门
													</option>
													<option value='领导'>
														领导
													</option>
												</select>
												<select id='jibie' name='jibie' onchange='desplay()'>
													<option value='选择级别'>
														选择级别
													</option>
													<option value='区级部门'>
														区级部门
													</option>
													<option value='园区管委会'>
														园区管委会
													</option>
													<option value='乡镇街道'>
														乡镇街道
													</option>
												</select>
												<select id ='department' name='department'>
													<option value='选择部门'>
														选择部门
													</option>
													<option>
														经信委
													</option>
													<option>
														财政部
													</option>
													<option>
														金佛山旅游景区管委会
													</option>
												</select>
												<div style="float: right; margin-bottom: 0px;">
													<input id=btnLogin type=submit value=" 注册 " name=btnLogin
														onclick='return check()'>
												</div>
											</td>
											<td width=100>
												<label id='wrong_department' style='color: red'>
													&nbsp;
												</label>
											</td>
										</tr>
										<tr height=110>
											<td colspan=4>
												&nbsp;
											</td>
										</tr>
									</tbody>
								</table>

							</TD>
						</TR>
						<TR id=root height=104>
							<TD>
								&nbsp;
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>
			<DIV id=div2 style="DISPLAY: none"></DIV>
		</form>
	</BODY>
</HTML>
