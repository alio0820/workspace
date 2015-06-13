<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.weather.WeatherForCountry"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>EIP考勤系统</title>
<link rel="shortcut icon" href="images/a.ico">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.1.js"></script>
<script src="js/jquery.color.js"></script>
<script src="js/greetings.js"></script>
<script src="js/comment.js"></script>
</head>

<body>
<!--top-->
<div id="top_div">
<div class="div_1004px">
<div  class="top_01">
<div>
	<a href="http://www.amarsoft.com" target="_blank" class="logo"></a>
</div>
<div class="menu">
	<ul>
		<li><a href="javascript:void(0)">进入EIP系统</a></li>
		<li><a href="javascript:void(0)">进入CRM系统</a></li>
		<li><a href="javascript:void(0)">请假申请</a></li>
		<li><a href="javascript:void(0)">直通总经理</a></li>
		<li><a href="javascript:void(0)">EIP问题反馈</a></li>
		<li><a href="javascript:void(0)">差旅计划</a></li>
		<li><a href="javascript:void(0)">BUG跟踪</a></li>
		<li><a href="javascript:void(0)">设备借用</a></li>
	</ul>
</div>
<div class="exit"><a href="#">退出</a></div>
<div class="user_info">
	<a style="cursor:pointer;">翟灿东</a></div>
	<div id="user_info_message">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>我的基本信息</th>
			</tr>
			<tr><td colspan="2">工号：4392  姓名：翟灿东  Mail：cdzhai</td></tr>
			<tr><td>手机号码：</td><td>15123364298</td></tr>
			<tr><td>办公室电话：</td><td>&nbsp;</td></tr>
			<tr><td>Skype帐号：</td><td>&nbsp;</td></tr>
			<tr><td>MSN帐号：</td><td>&nbsp;</td></tr>
			<tr><td>婚姻状况：</td><td>未婚男女</td></tr>
		</table>
	</div>
</div>
<div class="infom">
<span>通知</span>
<a href="javascript:showContent(&quot;2013120001&quot;);">标题：安硕移动办公平台V2.1版本(Android端),IOS1.1版本发布[2013/12/03]</a>
</div>
</div>
</div>
<!--main-->
<div id="main_div">
<!--button-->
<div class="button_div">
<div class="button_left">
<span>再坚持一会儿，美好的下班时间即将到来！！</span><br />
<script>
	var date = new Date();
	document.write(date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日");
</script>
</div>
<div class="button_right">
	<div class="weather">
		<span id="weather_unit_today" class="weather_unit">
			<span>今天(周四,多云)</span><br/>
			<img src="images/a1.jpg" width="26" height="26"></img><br/>
			<span>10-3℃</span>
			<span>北风4-5级</span>
		</span>
		<span id="weather_unit_tomorrow" class="weather_unit">
			<span>明天(周五,晴）</span><br/>
			<img src="images/a0.jpg" width="26" height="26"></img><br/>
			<span>7-1℃</span>
			<span>西北风4-5级</span>
		</span>
		<span id="weather_unit_tomorrowAfter" class="weather_unit">
			<span>后天(周六,晴)</span><br/>
			<img src="images/a0.jpg" width="26" height="26"></img><br/>
			<span>7-3℃</span>
			<span>北风4-5级</span>
		</span>
		<span class="weather_today">
			<span>上海</span>：<img src="images/a1.jpg" width="18" height="18"></img><span>10～3 ℃</span> 空气质量：<span>轻度污染</span><br/>
			今日空气质量指数(AQI):<span>186</span><br/>
			<span>
			农历十一月二十四</span>
			<a href="http://www.weather.com.cn/html/weather/areaNo.shtml#7d" target="_blank" style="margin-left:10px;">未来七天预报</a>
		</span>
	</div> 
</div>
</div>

<div class="main_left">
<!--考勤-->
<div class="checkon">
<div class="title">
	<h1>签到</h1>
	<span class="yellow_12px" style="line-height:40px;">美好的一天从签到开始</span>
</div>
<div style="float:left;width:100%;">
	<span id="editCheckon" class="icon icon-gear" title="编辑"></span>
	<form id="checkon_form" action="http://192.168.5.1:8080/EIP/DeskTop/TimeBookDetail.jsp" onsubmit="return validate();" autocomplete="off" method="post" name="checkon_form">
		<input type="hidden" value="s" name="oper"/>
		<input id="workdate" type="hidden" value="2013/12/17" name="workdate">
		<input id="ap" type="hidden" value="A" name="ap">
		<input id="workspot" type="hidden" value="O" name="workspot">
	<%@ include file="checkonbyday.jsp"%>
	<table width="100%" cellspacing="0" cellpadding="0" border="0" cellpading="0" class="info">
	<tbody>
		<tr>
			<td width="100px" class="input_label">工作场所</td>
			<td align="center" colspan="3" class="workspot">
				<ul>
					<li onclick="changeWorkSpot(this)" id="workspot_O" class="over">公司</li>         
					<li onclick="changeWorkSpot(this)" id="workspot_F">客户地</li>         
					<li onclick="changeWorkSpot(this)" id="workspot_J">旅途</li>
					<li onclick="changeWorkSpot(this)" id="workspot_H">非工作</li>        
				</ul>
				<script>
					var lastSpot = document.getElementById("workspot_"+"O");
					lastSpot.className="over";
				</script>
			</td>
		</tr>
		<tr>
			<td class="input_label">任务/活动</td>
			<td colspan="3">
				<input type="hidden" value="TD00028" id="threadid" name="threadid">
				<input ondblclick="this.value='';getMyTask(this);" onkeyup="getMyTask(this)" onfocus="getMyTask(this)" value="上海安硕  日常应用研发-信贷类" class="input_text" id="taskname" name="taskname">
				<div style="width:1px;height:1px;"><div class="mytask" style="display:none" id="mytask">
					<table><tbody id="mytask_table"></tbody></table></div>	
				</div>	
				<div style="display:none;color:red;" id="taskattention"></div>	
			</td>
		</tr>
		<tr>
			<td class="input_label">出勤状态</td>
			<td style="width:150px">
				<select class="input_text" id="workstatus" name="workstatus">
		 			<option value="10">出勤</option><option value="21">迟到</option><option value="22">早退</option><option value="23">旷工</option>
		 		</select>
			</td>
			<td class="input_label">工作地点</td>
			<td style="width:150px">
				<select class="input_text" id="workplace" name="workplace">
					<option value="001001">上海公司</option>
					<option value="001002">北京公司</option>
					<option value="001003">重庆公司</option>
					<option value="001004">深圳公司</option>
					<option value="001005">厦门公司</option>
					<option value="001006">苏州公司</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="input_label">工作内容备忘(限100汉字)</td>
			<td colspan="3">
				<textarea class="input_textarea" rows="5" id="workcomment" name="workcomment">搜索框的优化，探索  </textarea>
			</td>
		</tr>
		<tr>
			<td class="input_label">移动备忘，个人填写自己，项目经理填写所有成员移动(限100汉字)</td>
			<td colspan="3">
				<textarea class="input_textarea" rows="5" id="movecomment" name="movecomment"></textarea>
			</td>
		</tr>
		<tr>
			<td class="input_label">费用备忘，登记需报销费用(限100汉字)</td>
			<td colspan="3">
				<textarea class="input_textarea" rows="5" id="chargecomment" name="chargecomment"></textarea>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="4">
				<input type="submit" class="input_button" value="保存">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" onclick="$('.info').hide()" class="input_button" value="收起">
			</td>
		</tr>
	</tbody>
	</table>
	</form>
</div>
</div>
<div class="notice_info" style="width=100%;height:187px;overflow-x:hidden;overflow-y:hidden">
	<h1>EIP公告版</h1>
	<div style="width:100%;height:145px;overflow-y:hidden">
	<ul class="active">
		<li><a href="javascript:showContent(&quot;2013120001&quot;);" style="color:red">
		标题：安硕移动办公平台V2.1版本(Android端),IOS1.1版本发布[2013/12/03]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013110001&quot;);" style="color:red">
		安硕2013年度体检上海和北京地区安排[2013/11/12]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013090001&quot;);" style="color:red">
		上海公司打卡考勤规定发布[2013/09/02]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013120004&quot;);">
		“安硕线上读书会”第一期：《史玉柱自述：我的营销心得》，敬请关注！[2013/12/04]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013120002&quot;);">
		晒祝福，收礼物&mdash;&mdash;12月生日会 期待您的祝福[2013/12/04]</a></li>
	</ul>
	<ul>
		<li><a href="javascript:showContent(&quot;2013100003&quot;);">
		安硕移动办公2.0发布（支持苹果了）[2013/10/28]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013050003&quot;);">
		安硕移动考勤登记（for Android）[2013/05/20]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013050001&quot;);">
		考勤任务填写变化说明[2013/05/02]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013030003&quot;);">
		EIP销假功能上线通知[2013/03/29]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013010001&quot;);">
		2013版考勤登记变更通知[2013/01/04]</a></li>
	</ul>
	<ul>
		<li><a href="javascript:showContent(&quot;2012120002&quot;);">
		关于办公区域禁止用餐通知[2012/12/18]</a></li>
		
		<li><a href="javascript:showContent(&quot;2012110002&quot;);">
		统一邮件和文档标准的通知[2012/11/01]</a></li>
		
		<li><a href="javascript:showContent(&quot;2012110001&quot;);">
		考勤制度补充说明发布通知[2012/11/01]</a></li>
		
		<li><a href="javascript:showContent(&quot;2012040002&quot;);">
		再次发布关于加强使用正版软件的通知[2012/04/26]</a></li>
		
		<li><a href="javascript:showContent(&quot;2011120004&quot;);">
		项目调休假规定[2011/12/29]</a></li>
	</ul>
	<ul>
		<li><a href="javascript:showContent(&quot;2011060003&quot;);">
		加强公司邮件合理使用管理的通知[2011/06/23]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013120005&quot;);">
		上海农商行风险偏好与限额系统建设项目成功上线[2013/12/17]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013120003&quot;);">
		【11月线上生日会】幸运名单公布，快来看看中奖了没有！[2013/12/04]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013090004&quot;);">
		关于社保通知单及个税专函领取[2013/09/25]</a></li>
	</ul>
	<a class="more" href="javascript:void(0)"></a>
	<a class="less" href="javascript:void(0)"></a>
	</div>
</div>
<!--最近动态信息-->
<div class="myAdvancedInfo">
<div class="title">
<h1>最新动态信息</h1>
<div class="logMonth">
<select name="logMonth" onchange="getMyAdvancedInfo()">
    <option value="2013/06" selected>本月(2013/06)</option>
    <option value="2013/05">上月(2013/05)</option>
    <option value="2013/04">2013/04</option>
    <option value="2013/03">2013/03</option>
    <option value="2013/02">2013/02</option>
    <option value="2013/01">2013/01</option>
</select>
<span class="yellow_12px">注意当天EIP登录的信息经过整理后，才会反映在下面的表格中</span>
</div>
</div>
<ul>
	<li href="#table_info05">费用申请记录 </li>
	<li href="#table_info04">当前借用设备 </li>
	<li href="#table_info03">费用报销记录 </li>
	<li href="#table_info02">项目补贴参数表 </li>
	<li class="over" href="#table_info01">补贴概况 </li>
</ul>
<div class="table_info active" id="table_info01">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th>No.</th>
    <th>工作场所</th>
    <th>工作地点</th>
    <th>出勤状态</th>
    <th>天数</th>
    <th>考勤扣款</th>
    <th>餐贴</th>
    <th>项目补贴</th>
    <th>差旅补贴</th>
    <th>其他补贴</th>
  </tr>
  <tr>
    <td>1</td>
    <td>非工作</td>
    <td>&nbsp;</td>
    <td>法定假</td>
    <td>3</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>2</td>
    <td>非工作</td>
    <td>&nbsp;</td>
    <td>休息日</td>
    <td>2</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>3</td>
    <td>公司</td>
    <td>上海公司</td>
    <td>出勤</td>
    <td>15</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>合计</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>20</td>
    <td>0.0</td>
    <td>220</td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
  </tr>
</table>
</div>
<div class="table_info" id="table_info02">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th>No.</th>
    <th>项目</th>
    <th>开始日</th>
    <th>基本补贴</th>
    <th>补贴系数</th>
    <th>餐贴</th>
    <th>其他补贴（月）</th>
  </tr>
  <tr>
    <td>1</td>
    <td>吉林农信信贷管理系统三期改造项目</td>
    <td>2013/08/19</td>
    <td>0.00</td>
    <td>1.00</td>
    <td>15.00</td>
    <td>0.00</td>
  </tr>
  <tr>
    <td>2</td>
    <td>吉林农信信贷管理系统三期改造项目</td>
    <td>2013/10/02</td>
    <td>0.00</td>
    <td>0.40</td>
    <td>15.00</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
<div class="table_info" id="table_info03">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th>No.</th>
    <th>报销单号</th>
    <th>分类</th>
    <th>状态</th>
    <th>金额</th>
    <th>客户</th>
    <th>费用人</th>
    <th>操作</th>
  </tr>
  <tr>
    <td>1</td>
    <td>2013110768</td>
    <td>管理</td>
    <td>报销完成(付款)</td>
    <td>39.50</td>
    <td>上海安硕信息技术股份有限公司上海总部</td>
    <td>翟灿东</td>
    <td><input type="button" value="看报销单" onclick="alert('稍等一下，马上就好...')"/></td>
  </tr>
  <tr>
    <td>合计</td>
    <td colspan="3">&nbsp;</td>
    <td>39.50</td>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>
</div>
<div class="table_info" id="table_info04">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th>序号</th>
    <th>设备序列号</th>
    <th>类型</th>
    <th>型号</th>
    <th>当前配置</th>
    <th>购买日期</th>
    <th>登记日期</th>
    <th>操作</th>
  </tr>
  <tr>
    <td>201306250005</td>
    <td>3l3sJW1</td>
    <td>笔记本</td>
    <td>DELL 3421</td>
    <td>i3-2375M/4G/500G</td>
    <td>2013/06/25</td>
    <td>2013/08/08</td>
    <td><input type="button" value="查看" onclick="alert('稍等一下，马上就好...')"/></td>
  </tr>
</table>
</div>
<div class="table_info" id="table_info05">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th>No.</th>
    <th>申请日期</th>
    <th>状态</th>
    <th>申请金额</th>
    <th>批准金额</th>
    <th>审批意见</th>
  </tr>
  <tr>
    <td>合计</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>0.00</td>
    <td>0.00</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
</div>
<!--公共服务信息-->
<div class="publicinfo">
<h1>公共服务信息</h1>
<ul>
	<li href="#content03">差旅指南 </li>
	<li href="#content02">规章制度和资料汇总</li>
	<li class="over" href="#content01">公共服务岗</li>
</ul>
<div class="content active" id="content01" style="display:block;">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td width="50%" align="left" valign="top"><label>人事：</label><a class="mailAddress">hr_service@amarsoft.com</a>   <br />
      <span>人力资源部_日常管理，一般性人事问题，如转正、 <br />
      续签、个人资料修改等事宜</span></td>
    <td width="48%" align="left" valign="top"><label>请假：</label><a class="mailAddress">hr_vacation@amarsoft.com</a><br />
      <span>人力资源部_请假管理，处理请假、加班相关事宜 </span><br /></td>
  </tr>
  <tr>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top"><label>招聘：</label><a class="mailAddress">hr_resume@amarsoft.com</a> 
    <br />
    <span>人力资源部_招聘事务，处理招聘、人员推荐等事宜</span>
</td>
    <td align="left" valign="top"> <label>考勤：</label><a class="mailAddress">timebook@amarsoft.com</a><br />
<span>考勤管理，考勤相关问题</span></td>
  </tr>
  <tr>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top"><label>薪酬：</label><a class="mailAddress">salary@amarsoft.com</a> <br />
    <span>薪酬管理，薪资、福利等相关事宜</span></td>
    <td align="left" valign="top"><label>运营：</label><a class="mailAddress">yyzx@amarsoft.com</a><br />
<span>运营中心，一般运营事务，负责项目和一般人员后勤事宜，如差旅、报销、项目费用申请等</span></td>
  </tr>
  <tr>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top"><label>支持：</label><a class="mailAddress">support@amarsoft.com</a> <br />
<span>技术支持中心，对内部和客户提供技术支持</span> </td>
    <td align="left" valign="top"><label>PMO：</label><a class="mailAddress">pmo@amarsoft.com</a><br />
<span>PMO项目管理办公室，项目管理、人员调动相关事宜</span></td>
  </tr>
  <tr>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top"><label>邮件：</label><a class="mailAddress">mailadmin@amarsoft.com</a> <br />
<span>邮件管理员，处理邮件帐号和邮件系统和相关事宜</span></td>
    <td align="left" valign="top"> <label>网管：</label><a class="mailAddress">sysadmin@amarsoft.com</a><br />
<span>网络管理员，处理计算机设备和网络等事宜</span></td>
  </tr>
</table>
</div>
<div class="content" id="content02">
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="position:relative;">
  <tr>
    <td align="left" valign="top">关于启用“苏州安硕软科软件有限公司人事专用章”的通知<br />
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">关于启用“上海安硕信息技术股份有限公司人事专用章”的通知</td>
  </tr>
  <tr>
    <td align="left" valign="top">内部推荐伯乐奖-2013Q4 </td>
  </tr>
  <tr>
    <td align="left" valign="top">2013北京公司体检须知</td>
  </tr>
  <tr>
    <td align="left" valign="top">上海公司打卡考勤规定</td>
  </tr>
  <tr>
    <td align="left" valign="top">苏州安硕软科软件有限公司宿舍管理规定_2013-V1.0</td>
  </tr>
  <tr>
    <td align="left" valign="top">内部推荐伯乐奖-13Q2</td>
  </tr>
  <tr>
    <td align="left" valign="top">上海佰圆宾馆管理规定</td>
  </tr>
  <tr>
    <td align="left" valign="top">项目组宿舍管理制度</td>
  </tr>
  <tr>
    <td align="left" valign="top">关于在职员工申请办理【上海市居住证】的通知</td>
  </tr>
  <tr>
    <td align="left" valign="top">在职员工职称信息收集通知</td>
  </tr>
  <tr>
    <td align="left" valign="top">内部推荐伯乐奖-13Q1</td>
  </tr>
  <tr>
    <td align="left" valign="top">光大项目组表扬通告</td>
  </tr>
  <tr>
    <td align="left" valign="top">2013版考勤登记变更通知</td>
  </tr>
  <tr>
    <td align="left" valign="top">工作总结考评系统操作手册</td>
  </tr>
  <tr>
    <td align="left" valign="top">关于2012年下半年工作总结及评估的通知</td>
  </tr>
  <tr>
    <td align="left" valign="top">2013元旦放假通知</td>
  </tr>
  <tr>
    <td align="left" valign="top">2012北京分公司体检通知</td>
  </tr>
  <tr>
    <td align="left" valign="top">知识分享：2012第10期</td>
  </tr>
  <tr>
    <td align="left" valign="top">考勤制度补充说明</td>
  </tr>
  <tr>
    <td align="left" valign="top">知识分享：2012第9期</td>
  </tr>
  <tr>
    <td align="left" valign="top">【2012上半年工作总结及评估】反馈</td>
  </tr>
  <tr>
    <td align="left" valign="top">知识分享：2012第8期</td>
  </tr>
  <tr>
    <td align="left" valign="top">知识分享：2012第6期</td>
  </tr>
  <tr>
    <td align="left" valign="top">知识分享：2012第4期</td>
  </tr>
  <tr>
    <td align="left" valign="top">知识分享：2012第2期</td>
  </tr>
  <tr>
    <td align="left" valign="top">桌面环境软件清单</td>
  </tr>
  <tr>
    <td align="left" valign="top">Amarsoft内部管理[试用期]-转正申请审批表.xls</td>
  </tr>
  <tr>
    <td align="left" valign="top">试用期汇报-【ppt汇报模板】_201110</td>
  </tr>
  <tr>
    <td align="left" valign="top">导师辅导-【邮件汇报沟通模板】_201110</td>
  </tr>
  <tr>
    <td align="left" valign="top">上海安硕内部管理制度-考勤制度（2011-V2.0）</td>
  </tr>
  <tr>
    <td align="left" valign="top">Buzilla使用手册</td>
  </tr>
  <tr>
    <td align="left" valign="top">Amarsoft计算机设备管理制度摘要</td>
  </tr>
  <tr>
    <td align="left" valign="top">安硕协议酒店交通指南</td>
  </tr>
  <tr>
    <td align="left" valign="top">上海安硕员工基本职业规范--三大纪律八项注意</td>
  </tr>
  <tr>
    <td align="left" valign="top">上海安硕内部管理制度-项目组费用申请和报销制度（2009-V1.0）</td>
  </tr>
  <tr>
    <td align="left" valign="top">上海安硕内部管理制度-费用报销制度（2009-V1.0）</td>
  </tr>
  <tr>
    <td align="left" valign="top">EIP考勤登录系统录入细则和使用说明书（2009版）</td>
  </tr>
</table>
</div>
<div class="content" id="content03">
<select onchange="getJourneyHelp()" name="journeyCity">
	<option value="001000">00000不确定地点</option>
	<option value="010000" selected>Hu He Hao Te呼和浩特市</option>
	<option value="014000">Bao Tou包头市</option>
	<option value="016000">Wu Hai乌海市</option>
	<option value="030000">Tai Yuan太原市</option>
	<option value="037000">Da Tong大同市</option>
	<option value="044000">Yun Cheng运城</option>
	<option value="046000">Chang Zhi长治市</option>
	<option value="048000">Jin Cheng晋城市</option>
	<option value="050000">Shi Jia Zhuang石家庄市</option>
	<option value="053000">Heng Shui衡水市</option>
	<option value="054000">Xint Tai邢台市</option>
	<option value="061000">Cang Zhou沧州市</option>
	<option value="063000">Tang Shan唐山市</option>
	<option value="066000">Qin Huang Dao秦皇岛市</option>
	<option value="067000">Cheng De承德市</option>
	<option value="071000">Bao Ding保定市</option>
	<option value="072750">Zhuo Zhou涿州市</option>
	<option value="075000">Zhang Jia Kou张家口市</option>
	<option value="100000">Bei Jing北京市</option>
	<option value="102800">Lang Fang廊坊市</option>
	<option value="110000">Shen Yang沈阳市</option>
	<option value="111000">Liao Yang辽阳市</option>
	<option value="112000">Tie Ling铁岭市</option>
	<option value="113000">Fu Shun抚顺市</option>
	<option value="114000">An Shan鞍山市</option>
	<option value="115000">Ying Kou营口市</option>
	<option value="116010">Da Lian大连市</option>
	<option value="117000">Ben Xi本溪市</option>
	<option value="118000">Dan Dong丹东市</option>
	<option value="121000">Jin Zhou锦州市</option>
	<option value="121500">Hu Lu Dao葫芦岛</option>
	<option value="123000">Fu Xin阜新市</option>
	<option value="124000">Pan Jin盘锦市</option>
	<option value="130000">Chang Chun长春市</option>
	<option value="130500">Jiu Tai九台市</option>
	<option value="132000">Ji Lin吉林市</option>
	<option value="150000">Ha Er Bin哈尔滨</option>
	<option value="157000">Mu Dan Jiang牡丹江</option>
	<option value="161000">Qi Qi Ha Er齐齐哈尔市</option>
	<option value="163000">Da Qing大庆市</option>
	<option selected="" value="200000">Shang Hai上海市</option>
	<option value="210000">Nan Jing南京市</option>
	<option value="212000">Zhen Jiang镇江市</option>
	<option value="212310">dan yang丹阳</option>
	<option value="213000">Chang Zhou常州市</option>
	<option value="213100">Wu Jin武进</option>
	<option value="214000">Wu Xi无锡市</option>
	<option value="214200">Yi Xing宜兴市</option>
	<option value="214400">Jiang yin江阴市</option>
	<option value="214500">Jing Jiang靖江市</option>
	<option value="215000">Su Zhou苏州市</option>
	<option value="215300">Kun Shan昆山市</option>
	<option value="215400">Tai Cang太仓市</option>
	<option value="215500">Chang Shu常熟市</option>
	<option value="215600">Zhang Jia Gang张家港市</option>
	<option value="221000">Xu Zhou徐州市</option>
	<option value="222000">Lian Yun Gang连云港市</option>
	<option value="223000">Huai'an淮安市</option>
	<option value="225000">Yang Zhou扬州市</option>
	<option value="225300">Tai Zhou泰州市</option>
	<option value="226000">Nan Tong南通市</option>
	<option value="230000">He Fei合肥市</option>
	<option value="241000">Wu Hu芜湖市</option>
	<option value="242700">Huang Shan黄山市</option>
	<option value="250010">Ji Nan济南市</option>
	<option value="253010">De Zhou德州市</option>
	<option value="255000">Zi Bo淄博市</option>
	<option value="257000">Dong Ying东营市</option>
	<option value="261000">Wei Fang潍坊市</option>
	<option value="264000">Yan Tai烟台市</option>
	<option value="264200">Wei Hai威海市</option>
	<option value="266000">Qing Dao青岛市</option>
	<option value="271000">Tai'an泰安市</option>
	<option value="271100">Lai Wu莱芜市</option>
	<option value="272000">Yan Zhou兖州</option>
	<option value="272100">Ji Ning济宁市</option>
	<option value="273100">Qu Fu曲阜</option>
	<option value="276000">Lin Yi临沂市</option>
	<option value="276800">Ri Zhao日照市</option>
	<option value="277100">Zao Zhuang枣庄市</option>
	<option value="300200">Tin Jin天津市</option>
	<option value="310000">Hang Zhou杭州市</option>
	<option value="311200">Xiao Shan萧山市</option>
	<option value="312000">Shao Xing绍兴市</option>
	<option value="313000">Hu Zhou 湖州市</option>
	<option value="314000">Jia Xing嘉兴市</option>
	<option value="315000">Ning Bo宁波市</option>
	<option value="315207">Zhen Hai镇海</option>
	<option value="317000">Tai Zhou台州市</option>
	<option value="317500">Wen Lin温岭市</option>
	<option value="321000">Wen Ling金华市</option>
	<option value="322000">Yi Wu义乌市</option>
	<option value="325000">Wen Ling温州市</option>
	<option value="330000">Nan Chang南昌市</option>
	<option value="332000">Jiu Jiang九江市</option>
	<option value="333000">Jing De Zhen景德镇市</option>
	<option value="334000">Shang Rao上饶市</option>
	<option value="341000">Gan Zhou赣州市</option>
	<option value="350000">Fu Zhou福州市</option>
	<option value="361000">Xia Men厦门市</option>
	<option value="362000">Quan Zhou泉州市</option>
	<option value="362200">Jin Jiang晋江</option>
	<option value="400000">Chong Qing重庆</option>
	<option value="410000">Chang Sha 长沙市</option>
	<option value="410300">Liu Yang浏阳</option>
	<option value="411100">Xiang Tan湘潭市</option>
	<option value="412000">Zhu Zhou 株洲市</option>
	<option value="414000">Yue Yang岳阳市</option>
	<option value="421000">Heng Yang衡阳市</option>
	<option value="422000">Shao Yang邵阳市</option>
	<option value="43000 ">Han Kou汉口市</option>
	<option value="430000">Wu Han武汉市</option>
	<option value="430011">Wu Chang武昌</option>
	<option value="432100">Xiao Gan孝感市</option>
	<option value="434100">Jing Sha荆沙</option>
	<option value="435000">Huang Shi黄石</option>
	<option value="437300">Xiang Fan 襄樊市</option>
	<option value="443000">Yi Chang宜昌市</option>
	<option value="450000">Zheng Zhou郑州市</option>
	<option value="453000">Xin Xiang新乡市</option>
	<option value="454100">Jiao Zuo焦作市</option>
	<option value="455000">An Yang安阳</option>
	<option value="458000">He Bi鹤壁市</option>
	<option value="461000">Xu Chang许昌市</option>
	<option value="463000">Zhu Ma Dian驻马店</option>
	<option value="467000">Ping DingShan平顶山市</option>
	<option value="471000">Luo Yang洛阳市</option>
	<option value="47200 ">San Men Xia三门峡</option>
	<option value="473000">Yan Yang南阳市</option>
	<option value="475000">Kai Feng开封市</option>
	<option value="510000">Guang Zhou广州市</option>
	<option value="511700">Dong Guan 东莞市</option>
	<option value="518000">Shen Zhen深圳市</option>
	<option value="519000">Zhu Hai珠海市</option>
	<option value="524040">Zhan Jiang湛江市</option>
	<option value="528000">Fo Shan佛山市</option>
	<option value="528200">Nan Hai 南海市</option>
	<option value="529300">Kai Ping开平市</option>
	<option value="530000">Nan Ning南宁市</option>
	<option value="541000">Gui Lin桂林市</option>
	<option value="543200">Cen Xi岑溪市</option>
	<option value="546000">Liu Zhou柳州市</option>
	<option value="550000">Gui Yang贵阳市</option>
	<option value="563000">Zun Yi遵义市</option>
	<option value="570000">Hai Kou海口市</option>
	<option value="572100">San Ya三亚市</option>
	<option value="610000">Cheng Du成都市</option>
	<option value="614300">Le Shan乐山市</option>
	<option value="615000">Xi Chang西昌市</option>
	<option value="617000">Pan Zhi Hua攀枝花</option>
	<option value="618000">De Yang德阳市</option>
	<option value="621000">Min Yang绵阳市</option>
	<option value="628000">Guang Yuan广元市</option>
	<option value="629000">Sui Ning遂宁市</option>
	<option value="637100">Nan Chong南充市</option>
	<option value="643000">Zi Gong自贡市</option>
	<option value="644000">Yi Bin宜宾市</option>
	<option value="646000">Lu Zhou泸州市</option>
	<option value="652200">Kun Ming昆明市</option>
	<option value="653100">Yu Xi玉溪地区</option>
	<option value="655000">Qu Jing曲靖地区</option>
	<option value="674100">li Jiang丽江市</option>
	<option value="674400">Shangri-la香格里拉</option>
	<option value="710000">Xi'an西安市</option>
	<option value="712000">Xian Yang咸阳市</option>
	<option value="721000">Bao Ji宝鸡市</option>
	<option value="730000">Lan Zhou 兰州市</option>
	<option value="735100">Jia Yu Guan嘉峪关</option>
	<option value="736200">Dun Huang敦煌市</option>
	<option value="750000">Yin Chuan银川市</option>
	<option value="753200">Shi Zui Shan 石嘴山市</option>
	<option value="810000">Xi Ning西宁市</option>
	<option value="830000">Wu Lu Mu Qi乌鲁木齐市</option>
	<option value="834000">Ke La Ma Yi克拉玛依市</option>
	<option value="841000">Korla库尔勒</option>
	<option value="T00001">Tai Bei台北市</option>
 </select>

	<div id="journeyHelp">
		火车交通：1、从北京往返可坐火车，夕发朝至；<br/>
		2、从上海出发，坐飞机到呼和浩特机场，坐机场大巴，到新华大街站下，再打车到酒店，呼和浩特商行就在该酒店的马路斜对面。<br/>
		飞机交通：<br/>
		汽车交通：<br/>
		协议酒店：“锦江之星”内蒙古呼和浩特市新华大街61号。<br/>
		7天连锁酒店：会员卡号：92563709 密码：amarsoft65106600 网站：www.7daysinn.cn<br/>
		网站登录成功后进入快速预订页面进行预订，以网上公布的会员价为准，预订成功后入住人员只需在预订当日报公司会员卡号即可，预订保留至当天20：00，退房时由入住人员办理退房及结算费用。<br/>
		如家酒店：公司卡号：8000018807；密码：123456，通过全国订房电话：4008203333/8008203333或登陆www.homeinns.com进行预订（网上登陆时"会员名"处请填写公司简称---上海安硕）
		享受门市价的九折，退房时间可延至13:00<br/>
		其他酒店：<br/>
		饮食参考：<br/>
		其他信息：呼和浩特商行地址：内蒙古呼和浩特市新华大街50号。
	</div>
</div>
</div>
<div class="clear"></div>
</div>
<div class="main_right">
<!--邮件-->
<div class="mail_info">
<h1>最新邮件</h1>
<ul>
<li class="over"><a href="javascript:void(0)">三天会议纪要及截止节前最新版跟踪表</a>
<img src="images/mail_icon.png" width="15" height="11" title="回复"/>
<div class="tip-bubble tip-bubble-top"><span>您好，附件中是2月5日、2月6日、2月7日会议纪要及最新跟踪表，烦请您审阅，如有疑问待联系……</span></div>

</li>
<li><a href="javascript:void(0)">近两周美工一职的面试结果反馈....</a><img src="images/mail_icon.png" width="15" height="11" title="回复"/></li>
<li><a href="javascript:void(0)">iPad操作系统截图</a><img src="images/mail_icon.png" width="15" height="11" title="回复"/></li>
<li><a href="javascript:void(0)">复旦科技园区项目第一轮需求汇报...</a><img src="images/mail_icon.png" width="15" height="11" title="回复"/></li>
<li><a href="javascript:void(0)">下周工作计划及工作安排</a><img src="images/mail_icon.png" width="15" height="11" title="回复"/></li>
<li><a href="javascript:void(0)">广发Ipad 原始需求书</a><img src="images/mail_icon.png" width="15" height="11" title="回复"/></li>
</ul>
</div>
<!--论坛--->
<div class="bbs_info">
	<h1>论坛动态</h1>
	<ul>
		<li><a href="javascript:void(0)">端午节要放假啦</a>…………[行政服务]</li>
		<li><a href="javascript:void(0)">AWE2.6升级服务，具体新特性</a>[产品研发]</li>
	
	</ul>
</div>

</div>
<div class="clear"></div>
<div id="footer">Copyright &copy;2013 Amarsoft all rights reserved. 上海安硕信息技术股份有限公司</div>
</div>
</body>
</html>