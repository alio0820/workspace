<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>查看管理员信息</title>
		<!--引入css文件-->
		<link rel="stylesheet" type="text/css" href="css/manageUpdate.css" />
		<!--引入js文件-->
		<script type="text/javascript" src="js/jquery-1.6.4.js"></script>
		<script type="text/javascript" src="js/manageJs.js"></script>
	</head>

	<body>
		<div id="rightbar">
			<!--rightbar 开始-->
			<div class="title">
				管理管理员
			</div>
			<div class="managerList">
				<!--managerList 开始-->
				<div class="listHead">
					<!--listHead 开始-->
					<div class="listHeadLeft"></div>
					<div class="listHeadMiddle">
						管理员信息
					</div>
					<div class="listHeadRight"></div>
					<div class="clear"></div>
				</div>
				<!--listHead 结束-->
				<div class="listBody">
					<table cellpadding="0" cellspacing="0">
						<thead>
							<tr>
								<td class="firstCol">
									<input type="checkbox" class="cb" onclick="selectAllManager()" />
								</td>
								<td class="secondCol">
									管理员工号
								</td>
								<td class="thirdCol">
									管理员姓名
								</td>
								<td class="fourthCol">
									管理员部门
								</td>
								<td class="fifthCol">
									编辑管理员
								</td>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="list" status="s" id="l">
								<tr>
									<td class="firstCol">
										<input type="checkbox" class="cb" id="test" />
									</td>
									<td class="secondCol">
										${l[1]}
									</td>
									<td class="thirdCol">
										<a href="#">${l[0]}</a>
									</td>
									<td class="fourthCol">
										<a href="#">${l[2]}</a>
									</td>
									<td class="fifthCol">
										<a href="#" title="查看"><img
												src="images/manageMent/systemIcon/pencil.png" /> </a>
										<a href="#" title="修改"><img
												src="images/manageMent/systemIcon/hammer_screwdriver.png" />
										</a>
										<a href="#" title="删除"><img
												src="images/manageMent/systemIcon/cross.png" /> </a>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					<div class="addManagerBtn">
						<input class="btn" type="button" value="修改选中的管理员信息" />
						<input class="btn" type="button" value="删除选中的管理员" />
						<div class="pages">
							<a href="#" title="第一页">第一页</a>
							<a href="#" title="上一页">&laquo;上一页</a>
							<a href="#" class="num" title="1">1</a>
							<a href="#" class="num" title="2">2</a>
							<a href="#" class="selNum" title="3">3</a>
							<a href="#" class="num" title="4">4</a>
							<span>...</span>
							<a href="#" class="num" title="99">99</a>
							<a href="#" title="下一页">下一页&raquo;</a>
							<a href="#" title="最后一页">最后一页</a>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="listFoot">
					<div class="listHeadLeft"></div>
					<div class="listHeadMiddle"></div>
					<div class="listHeadRight"></div>
					<div class="clear"></div>
				</div>
			</div>
			<!--managerList 结束-->
		</div>
		<!--rightbar 结束-->
	</body>
</html>
