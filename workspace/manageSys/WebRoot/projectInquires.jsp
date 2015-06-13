<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.bean.*,swu.edu.cn.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
				font-size:12px;				
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
			function desplay(num){
				var select_fenlei = "select_fenlei"+num;
				var select_depart = "select_depart"+num;
		    	var index = document.getElementById(select_fenlei).value;		//通过form去取select的id时，select的id不能用字符串表示，只能是名称,form只能去form表单中找，不能接字符串
		    	document.getElementById(select_depart).options.length = 0;
		    	for(var i in departList[index])
		    		document.getElementById(select_depart).options.add(new Option(departList[index][i],departListId[index][i]));
		    }
			//显示各个DIV层
			function query_xiangmu(){
				var d =  document.getElementById('query_select');
				var index = d.selectedIndex;
				var value = d.options[index].value;
				document.getElementById('query_bumen').style.display='none';
				document.getElementById('query_mingcheng').style.display='none';
				document.getElementById('query_wancheng').style.display='none';
				document.getElementById('query_shen').style.display='none';
				document.getElementById(value).style.display='block';
			}
			//按名称查询
			function query_mingcheng(){
				document.form1.action="query_mingcheng.action";
		        document.form1.submit(); 
			}
			
			//按部门查询
			function query_bumen(){
				var departmentId= document.form1.select_depart1.value;
				if(departmentId!='选择部门'){
					document.form1.action="query_bumen.action?departmentId="+departmentId;
			        document.form1.submit(); 
		        }
			}
			
			//按完成情况
			function query_wancheng(){
				var departmentId= document.form1.select_depart2.value;
				var wancheng = document.form1.select_wancheng.value;
				if(departmentId!='选择部门'){
					document.form1.action="query_wancheng.action?departmentId="+departmentId+"&wancheng="+wancheng;
			        document.form1.submit(); 
		        }
			}
			
			//未申报、未审核
			function query_weishenbao(){
				var d =  document.getElementById('query_select');
				var index = d.selectedIndex;
				if((d.options[index].text)=='未申报')
					method= 'weishenbao';
				else
					method = 'weishenhe';
				var departmentId = document.form1.select_depart3.value;
				var taskMonth = document.form1.query_month.value;
//				alert('部门ID '+departmentId);
//				alert('任务月份 '+taskMonth);
//				alert('执行方法 '+method);
				if(departmentId!='选择部门'){
					document.form1.action="query_"+method+".action?departmentId="+departmentId+"&taskMonth="+taskMonth;
					document.form1.submit();
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
							style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 0px; BACKGROUND-COLOR: white"
							vAlign=top >
							<form name='form1' method='post'>
							<div style="background:url(images/ResultManager_2.png);width:auto;height:57px;">
						    	<div class="ResultM_1"></div>						    
					    	</div>
							<div>&nbsp;&nbsp;&nbsp;&nbsp;项目查询</div><br/>
							<div style='width:640px;height:auto;border:1px solid rgb(119,119,170);padding-top:5px;padding-left:10px;padding-right:10px;margin-left:30px;'>
								<div>
									<span>请选择查询方式：</span>
									<select id='query_select' onchange='query_xiangmu()'>
										<option value='query_bumen'selected>按部门</option>
										<option value='query_mingcheng'>名称</option>
										<option value='query_wancheng'>完成情况</option>
										<option value='query_shen'>未申报</option>
										<option value='query_shen'>审核失败</option>
									</select>									
								</div>			
							</div>	
							<div id='query_bumen' style='width:640px;height:90px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;margin-left:30px;'>								
								<div class='new'>选择级别：
									<select id='select_fenlei1' onchange='desplay(1)'>
										<option value="选择级别">选择级别</option>
										<option value="区级部门">区级部门</option>
										<option value="园区管委会">园区管委会</option>
										<option value="乡镇街道">乡镇街道</option>
									</select>
									选择部门：
									<select id='select_depart1'>
										<option value="选择部门">选择部门</option>
									</select>	
								</div>
																
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='查询' onclick='query_bumen()'/>
								</div>
							</div>
							
							<div id='query_mingcheng' style='width:640px;height:90px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;margin-left:30px;display:none;'>								
								<div class='new'>
									<span>请输入项目名：</span>
									<input type='text' name = 'xiangmuname' size='20'/>
								</div>															
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='查询' onclick='query_mingcheng()'/>
								</div>
							</div>
							
							<div id='query_wancheng' style='width:640px;height:90px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;margin-left:30px;display:none;'>								
								<div class='new'>选择级别：
									<select id='select_fenlei2' onchange='desplay(2)'>
										<option value="选择级别">选择级别</option>
										<option value="区级部门">区级部门</option>
										<option value="园区管委会">园区管委会</option>
										<option value="乡镇街道">乡镇街道</option>
									</select>
									选择部门：
									<select id='select_depart2'>
										<option value="选择部门">选择部门</option>
									</select>
									完成情况：
									<select id='select_wancheng'>
										<option value="10">完成10%</option>
										<option value="20">完成20%</option>
										<option value="30">完成30%</option>
										<option value="40">完成40%</option>
										<option value="50">完成50%</option>
										<option value="60">完成60%</option>
										<option value="70">完成70%</option>
										<option value="80">完成80%</option>
										<option value="90">完成90%</option>
										<option value="100">全部完成</option>
									</select>			
								</div>															
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='查询' onclick='query_wancheng()'/>
								</div>
							</div>
							
							<div id='query_shen' style='width:640px;height:90px;border:1px solid rgb(119,119,170);border-top:none;padding:10px;margin-left:30px;display:none;'>								
								<div class='new'>选择级别：
									<select id='select_fenlei3' onchange='desplay(3)'>
										<option value="选择级别">选择级别</option>
										<option value="区级部门">区级部门</option>
										<option value="园区管委会">园区管委会</option>
										<option value="乡镇街道">乡镇街道</option>
									</select>
									选择部门：
									<select id='select_depart3'>
										<option value="选择部门">选择部门</option>
									</select>
									<span>请选择月份：</span>
									<select id='query_month'>
										<option value='1'selected>1月</option>
										<option value='2'>2月</option>
										<option value='3'>3月</option>
										<option value='4'>4月</option>
										<option value='5'>5月</option>
										<option value='6'>6月</option>
										<option value='7'>7月</option>
										<option value='8'>8月</option>
										<option value='9'>9月</option>
										<option value='10'>10月</option>
										<option value='11'>11月</option>
										<option value='12'>12月</option>
									</select>										
								</div>															
								<div class='new'>
									<input type='button' style="width:46px;height:25px;" value='查询' onclick='query_weishenbao()'/>
								</div>
							</div>							
							<%if(request.getAttribute("list")!=null){%>
							<div style='width:1022px;height:auto;border:1px solid rgb(119,119,170);padding-top:5px;padding-left:10px;padding-right:10px;margin-left:30px;'>
								<span>查询结果</span>
								<%if(((List)request.getAttribute("list")).size()==0){ %>
									<span>(未查询到相关的项目)</span>
								<%} %>
							</div>							
							<div id='query_list' style='width:1000px;height:auto;border:1px solid rgb(119,119,170);border-top:none;padding:20px;margin-left:30px;'>	
								<table class='xiangmu' width='980px' cellSpacing=0 cellPadding=4>
									<tr style='background:#91C7E1' height='40px'>
										<th width='300px' class='borderleft'>
											<span>项目名称</span>
										</th>
										<th width='380px'>
											<span>考核指标</span>
										</th>
										<th  width='100px'>
											<span>责任部门</span>
										</th>										
										<th width='200px'>
											<span>任务进度</span>
										</th>
									</tr>
									
									<s:iterator value="list" status="s" var="var">
										<tr>
										     <td class="borderleft">
										          <s:property value="#var.ProjectName"/>
										     </td>
										     <td>
										          <input name="<s:property value='comment'/>" type="hidden" value="<s:property  value='comment'/>"/>
										          <s:property  value="comment"/>
										     </td>
								             <td>
								                  <input name="<s:property value='responsibleDepartment'/>" type="hidden" value="<s:property  value='responsibleDepartment'/>"/>
								                  <s:property value="responsibleDepartment"/>
								             </td>
								             <td>
								                  <input name="<s:property value='currentProgress'/>" type="hidden" value="<s:property  value='currentProgress'/>"/>
								                  <s:property value="currentProgress"/>
								             </td>
								        </tr>
								       
								    </s:iterator>
								    </table>
								   <% }%>															 
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