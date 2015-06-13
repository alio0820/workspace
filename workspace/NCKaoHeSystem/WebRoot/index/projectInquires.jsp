<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,swu.edu.cn.bean.*,swu.edu.cn.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>南川区科学发展工作考核网</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
		<script src="../js/Clock.js" type=text/javascript></script>
		<style type="text/css">
html,body {
	font-size:14px;
}

table.xiangmu td {
	border-bottom: 1px solid #6F9FC0;
	border-right: 1px solid #6F9FC0;
	text-align: left;
	overflow: hidden;
	font-size: 14px;
	padding: 3px;
}

table.xiangmu th {
	border-top: 1px solid #6F9FC0;
	border-bottom: 1px solid #6F9FC0;
	border-right: 1px solid #6F9FC0;
	text-align: center;
	font-size: 15px;
	padding: 5px;
}
select{
	font-size:15px;
}
.borderleft {
	border-left: 1px solid #6F9FC0;
}

a {
	text-decoration: none;
	color: black;
}

div.new {
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left: 10px;
	font-size:15px;
}
</style>
		<script type='text/javascript'>
			var departList = new Array();
			var departListId =new Array();
			departList['选择分类'] = ['选择部门'];
			departList['综合服务、党务、群团和法检类区管部门'] = [];
		    departList['经济发展和公共事务类区管部门'] = [];
		    departList['上管部门、单位'] = [];
		    departList['处级学校'] = [];
		    departList['处级医院'] = [];
		    departList['国融集团子公司'] = [];
		    departList['指挥部'] = [];
		    departList['园区管委会'] = [];
		    departList['乡镇（街道）第二组'] = [];
		    departList['乡镇（街道）第一组'] = [];
		    departList['乡镇（街道）第三组'] = [];
		    
		    departListId['选择分类'] = ['选择部门'];
			departListId['综合服务、党务、群团和法检类区管部门'] = [];
		    departListId['经济发展和公共事务类区管部门'] = [];
		    departListId['上管部门、单位'] = [];
		    departListId['处级学校'] = [];
		    departListId['处级医院'] = [];
		    departListId['国融集团子公司'] = [];
		    departListId['指挥部'] = [];
		    departListId['园区管委会'] = [];
		    departListId['乡镇（街道）第二组'] = [];
		    departListId['乡镇（街道）第一组'] = [];
		    departListId['乡镇（街道）第三组'] = [];
			
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
				   List list=dm.searchAllDepartment();
				   while(!list.isEmpty()){
				   		DepartmentBean db=new DepartmentBean();
						db=(DepartmentBean) list.get(0);
						%>
							departListId['<%=db.getSecondClassify().trim().substring(2)%>'].push('<%=db.getDepartmentId()%>');
							departList['<%=db.getSecondClassify().trim().substring(2)%>'].push('<%=db.getDepartmentName()%>');
						<%list.remove(0);
				   }
				   dm.CloseDB();%>
		    }
		    initbody();
		</script>
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
	</head>
	<body>
		<div class="zhong">
			<div class="banner">
				<embed src="../images/nanchuan2.swf"
					style="width:1000px;height:150px;"></embed>
			</div>
			<div class="menu">
				<div class="menusel" style="width: 95px;">
					<h2>
						<a href="../index/index.jsp">首页</a>
					</h2>
				</div>
				<div id="menu1" class="menusel">
					<h2>
						<a href="../index/departClassify.jsp">部门分类</a>
					</h2>
					<div class="position">
						<ul class="clearfix typeul">
						</ul>
					</div>
				</div>
				<div id="menu2" class="menusel">
					<h2>
						<a href="../index/indicatorBrowse.jsp">指标浏览</a>
					</h2>
					<div class="position">
						<ul class="clearfix typeul">
						</ul>
					</div>
				</div>
				<div id="menu3" class="menusel">
					<h2><a href="<%=href1 %>">项目管理</a></h2>
				      <div class="position">
				        <ul class="clearfix typeul">
				       <% if(position.equals("bumen")){ %>
				          <li><a href="../index_duty/dutyIndicatorB.jsp">责任项目</a></li>
					   	  <li><a href="../index_duty/dutyProjectReview.jsp">项目审核</a></li>
						  <li><a href="../index_duty/dutyProgressReport.jsp">进度申报</a></li>
						  <li><a href="../index_duty/dutyProgressReportF.jsp">重新申报</a></li>
						<%}else if(position.equals("qufenguan")){ %>
						  <li><a href="../index_qfg/qfgProjectReview.jsp">区领导审核</a></li>
						<%}else if(position.equals("duchashi")){ %>
						  <li><a href="../index_dcs/dcsProjectReview.jsp">督查室审核</a></li>
						<%}else{ %>
						  <li><a href="../index_leader/leadProjectPS.jsp">领导批示</a></li>
						<%} %>
						  <li class="lli"><a href="projectInquires.jsp">搜索</a></li>
				        </ul>
				      </div>
				</div>
				<div id="menu4" class="menusel">
					<h2>
						<a href="#">下载中心</a>
					</h2>
					<div class="position">
						<ul class="clearfix typeul">
						</ul>
					</div>
				</div>
				<div id="menu5" class="menusel">
					<h2>
						<a href="#">在线留言</a>
					</h2>
					<div class="position">
						<ul class="clearfix typeul">
							<li>
								<a href="#">发表留言</a>
							</li>
							<li>
								<a href="#">留言列表</a>
							</li>
							<li>
								<a href="#">留言</a>
							</li>
							<li>
								<a href="#">建议</a>
							</li>
							<li class="lli">
								<a href="#">投诉</a>
							</li>
						</ul>
					</div>
				</div>
				<div style="float: right; height: 36px; width: 240px;">
					<input type="text" name="search"
						style="height: 18px; width: 160px; margin-top: 7px; float: left; margin-right: 5px;" />
					<input type="image" src="../images2/12.png" style="float: right"
						onclick="javascript:alert('正在搜索...')" />
				</div>
			</div>

			<div class="main">
				<div style="color: black; height: auto;">
					<div id="departClassify_top"
						style="height: 20px; margin-bottom: 10px">
						<div style="margin-left: 10px; margin-right: 10px; float: right">
							<span id="clock"></span>
						</div>
						<div style='float: left;'>
							欢迎 [<%=session.getAttribute("departmentName")%>] [<%=session.getAttribute("realName")%>]
							光临
						</div>
						<div style="float: left; margin-left: 100px">
							<span style="font-weight: bold">当前位置：</span>
							<a href="../index/index.jsp" style="color: rgb(120, 48, 120);">南川考评网</a>&gt;
							<a href="dutyProjectInquires.jsp"
								style="color: rgb(120, 48, 120);">搜索</a>
						</div>
					</div>
					<div id="right"
						style="width: 976px; height: auto; margin: 0 10px 5px 5px; border: 1px solid lightblue; min-height: 500px;font-size:15px;">
						<form name='form1' method='post'>
							<div
								style='width: 640px; height: auto; border: 1px solid rgb(119, 119, 170); padding-top: 5px; padding-left: 10px; padding-right: 10px; margin-left: 20px;margin-top:10px;'>
								<div>
									<span>请选择查询方式：</span>
									<select id='query_select' onchange='query_xiangmu()'>
										<option value='query_bumen' selected>
											按部门
										</option>
										<option value='query_mingcheng'>
											名称
										</option>
										<option value='query_wancheng'>
											完成情况
										</option>
										<option value='query_shen'>
											未申报
										</option>
										<option value='query_shen'>
											审核失败
										</option>
									</select>
								</div>
							</div>
							<div id='query_bumen'
								style='width: 640px; height: 90px; border: 1px solid rgb(119, 119, 170); border-top: none; padding: 10px; margin-left: 20px;'>
								<div class='new'>
									选择级别：
									<select id='select_fenlei1' onchange='desplay(1)'>
										<option value="选择级别">
											选择级别
										</option>
										<option value="综合服务、党务、群团和法检类区管部门">
											综合服务、党务、群团和法检类区管部门
										</option>
										<option value="经济发展和公共事务类区管部门">
											经济发展和公共事务类区管部门
										</option>
										<option value="上管部门、单位">
											上管部门、单位  
										</option>
										<option value="处级学校">
											处级学校
										</option>
										<option value="处级医院">
											处级医院
										</option>
										<option value="国融集团子公司">
											国融集团子公司
										</option>
										<option value="指挥部">
											指挥部
										</option>
										<option value="园区管委会">
											园区管委会
										</option>
										<option value="乡镇（街道）第一组">
											乡镇（街道）第一组
										</option>
										<option value="乡镇（街道）第二组">
											乡镇（街道）第二组
										</option>
										
										<option value="乡镇（街道）第三组">
											乡镇（街道）第三组
										</option>										
									</select>
									选择部门：
									<select id='select_depart1'>
										<option value="选择部门">
											选择部门
										</option>
									</select>
								</div>

								<div class='new'>
									<input type='button' style="width: 46px; height: 25px;"
										value='查询' onclick='query_bumen()' />
								</div>
							</div>

							<div id='query_mingcheng'
								style='width: 640px; height: 90px; border: 1px solid rgb(119, 119, 170); border-top: none; padding: 10px; margin-left: 20px; display: none;'>
								<div class='new'>
									<span>请输入项目名：</span>
									<input type='text' name='xiangmuname' size='20' />
								</div>
								<div class='new'>
									<input type='button' style="width: 46px; height: 25px;"
										value='查询' onclick='query_mingcheng()' />
								</div>
							</div>

							<div id='query_wancheng'
								style='width: 640px; height: 90px; border: 1px solid rgb(119, 119, 170); border-top: none; padding: 10px; margin-left: 20px; display: none;'>
								<div class='new'>
									选择级别：
									<select id='select_fenlei2' onchange='desplay(2)'>
										<option value="选择级别">
											选择级别
										</option>
										<option value="综合服务、党务、群团和法检类区管部门">
											综合服务、党务、群团和法检类区管部门
										</option>
										<option value="经济发展和公共事务类区管部门">
											经济发展和公共事务类区管部门
										</option>
										<option value="上管部门、单位">
											上管部门、单位  
										</option>
										<option value="处级学校">
											处级学校
										</option>
										<option value="处级医院">
											处级医院
										</option>
										<option value="国融集团子公司">
											国融集团子公司
										</option>
										<option value="指挥部">
											指挥部
										</option>
										<option value="园区管委会">
											园区管委会
										</option>
										<option value="乡镇（街道）第一组">
											乡镇（街道）第一组
										</option>
										<option value="乡镇（街道）第二组">
											乡镇（街道）第二组
										</option>
										
										<option value="乡镇（街道）第三组">
											乡镇（街道）第三组
										</option>
									</select>
									选择部门：
									<select id='select_depart2'>
										<option value="选择部门">
											选择部门
										</option>
									</select>
									完成情况：
									<select id='select_wancheng'>
										<option value='8'>
											未完成
										</option>
										<option value="10">
											完成10%
										</option>
										<option value="20">
											完成20%
										</option>
										<option value="30">
											完成30%
										</option>
										<option value="40">
											完成40%
										</option>
										<option value="50">
											完成50%
										</option>
										<option value="60">
											完成60%
										</option>
										<option value="70">
											完成70%
										</option>
										<option value="80">
											完成80%
										</option>
										<option value="90">
											完成90%
										</option>
										<option value="100">
											全部完成
										</option>
									</select>
								</div>
								<div class='new'>
									<input type='button' style="width: 46px; height: 25px;"
										value='查询' onclick='query_wancheng()' />
								</div>
							</div>

							<div id='query_shen'
								style='width: 640px; height: 90px; border: 1px solid rgb(119, 119, 170); border-top: none; padding: 10px; margin-left: 20px; display: none;'>
								<div class='new'>
									选择级别：
									<select id='select_fenlei3' onchange='desplay(3)'>
										<option value="选择级别">
											选择级别
										</option>
										<option value="综合服务、党务、群团和法检类区管部门">
											综合服务、党务、群团和法检类区管部门
										</option>
										<option value="经济发展和公共事务类区管部门">
											经济发展和公共事务类区管部门
										</option>
										<option value="上管部门、单位">
											上管部门、单位  
										</option>
										<option value="处级学校">
											处级学校
										</option>
										<option value="处级医院">
											处级医院
										</option>
										<option value="国融集团子公司">
											国融集团子公司
										</option>
										<option value="指挥部">
											指挥部
										</option>
										<option value="园区管委会">
											园区管委会
										</option>
										<option value="乡镇（街道）第一组">
											乡镇（街道）第一组
										</option>
										<option value="乡镇（街道）第二组">
											乡镇（街道）第二组
										</option>
										
										<option value="乡镇（街道）第三组">
											乡镇（街道）第三组
										</option>
									</select>
									选择部门：
									<select id='select_depart3'>
										<option value="选择部门">
											选择部门
										</option>
									</select>
									<span>请选择月份：</span>
									<select id='query_month'>
										<option value='1' selected>
											1月
										</option>
										<option value='2'>
											2月
										</option>
										<option value='3'>
											3月
										</option>
										<option value='4'>
											4月
										</option>
										<option value='5'>
											5月
										</option>
										<option value='6'>
											6月
										</option>
										<option value='7'>
											7月
										</option>
										<option value='8'>
											8月
										</option>
										<option value='9'>
											9月
										</option>
										<option value='10'>
											10月
										</option>
										<option value='11'>
											11月
										</option>
										<option value='12'>
											12月
										</option>
									</select>
								</div>
								<div class='new'>
									<input type='button' style="width: 46px; height: 25px;"
										value='查询' onclick='query_weishenbao()' />
								</div>
							</div><br/>
							<%if(request.getAttribute("list")!=null){%>
							<div
								style='width: 900px; height: auto; border: 1px solid rgb(119, 119, 170); padding-top: 5px; padding-left: 10px; padding-right: 10px; margin-left: 20px;'>
								<span>查询结果</span>
								<%if(((List)request.getAttribute("list")).size()==0){ %>
								<span>(未查询到相关的项目)</span>
								<%} %>
							</div>
							<div id='query_list'
								style='width:880px; height: auto; border: 1px solid rgb(119, 119, 170); border-top: none; padding: 20px; margin-left: 20px;'>
								<table class='xiangmu' width='780px' cellSpacing=0>
									<tr style='background: #91C7E1' style='height:30px'>
										<th width='200px' class='borderleft'>
											<span>项目名称</span>
										</th>
										<th width='380px'>
											<span>考核指标</span>
										</th>
										<th width='100px'>
											<span>责任部门</span>
										</th>
										<th width='100px'>
											<span>任务进度</span>
										</th>
									</tr>

									<s:iterator value="list" status="s" var="var">
										<tr>
											<td class="borderleft">
												<s:property value="#var.ProjectName" />
											</td>
											<td>
												<input name="<s:property value='comment'/>" type="hidden"
													value="<s:property  value='comment'/>" />
												<s:property value="comment" />
											</td>
											<td>
												<input name="<s:property value='responsibleDepartment'/>"
													type="hidden"
													value="<s:property  value='responsibleDepartment'/>" />
												<s:property value="responsibleDepartment" />
											</td>
											<td>
												<input name="<s:property value='currentProgress'/>"
													type="hidden"
													value="<s:property  value='currentProgress'/>" />
												<s:property value="currentProgress" />
											</td>
										</tr>

									</s:iterator>
								</table><%}%>
							</div>
						</form>
					</div>
				</div>
				<div class="bottom">
					<table cellpadding="3" cellspacing="0" width="100%">
						<tr>
							<td
								style='font-size: 25px; border-right: 1px solid lightblue; height: 70px; width: 500px;'>
								南川区综合考评委员会办公室
							</td>
							<td>
								<table border="0" cellpadding="" cellspacing="1" width="80%"
									style="text-align: left; margin-left: 50px; font-size: 13px">
									<tbody>
										<tr>
											<td style="color: red">
												<a href="#" target="_blank" style="color: red">网站简介</a>&nbsp;&nbsp;|&nbsp;
												<a href="#" target="_blank" style="color: red">联系我们</a>&nbsp;&nbsp;|&nbsp;
												<a href="#" target="_blank" style="color: red">保存网站</a>&nbsp;&nbsp;|&nbsp;
											</td>
										</tr>
										<tr>
											<td>
												Copyright &copy; 2012 南川区综合考评委员会办公室
											</td>
										</tr>
										<tr>
											<td>
												技术支持：1007工作室
											</td>
										</tr>
										<tr>
											<td>
												自2012年5月1日起，您是本站第21926位访问者
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<script type=text/javascript>
    var clock = new Clock();
    clock.display(document.getElementById("clock"));
</script>
		<script src="../js/meun.js" type="text/javascript"></script>
	</body>
</html>
