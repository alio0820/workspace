<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.weather.WeatherForCountry"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>EIP����ϵͳ</title>
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
		<li><a href="javascript:void(0)">����EIPϵͳ</a></li>
		<li><a href="javascript:void(0)">����CRMϵͳ</a></li>
		<li><a href="javascript:void(0)">�������</a></li>
		<li><a href="javascript:void(0)">ֱͨ�ܾ���</a></li>
		<li><a href="javascript:void(0)">EIP���ⷴ��</a></li>
		<li><a href="javascript:void(0)">���üƻ�</a></li>
		<li><a href="javascript:void(0)">BUG����</a></li>
		<li><a href="javascript:void(0)">�豸����</a></li>
	</ul>
</div>
<div class="exit"><a href="#">�˳�</a></div>
<div class="user_info">
	<a style="cursor:pointer;">�ԲӶ�</a></div>
	<div id="user_info_message">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>�ҵĻ�����Ϣ</th>
			</tr>
			<tr><td colspan="2">���ţ�4392  �������ԲӶ�  Mail��cdzhai</td></tr>
			<tr><td>�ֻ����룺</td><td>15123364298</td></tr>
			<tr><td>�칫�ҵ绰��</td><td>&nbsp;</td></tr>
			<tr><td>Skype�ʺţ�</td><td>&nbsp;</td></tr>
			<tr><td>MSN�ʺţ�</td><td>&nbsp;</td></tr>
			<tr><td>����״����</td><td>δ����Ů</td></tr>
		</table>
	</div>
</div>
<div class="infom">
<span>֪ͨ</span>
<a href="javascript:showContent(&quot;2013120001&quot;);">���⣺��˶�ƶ��칫ƽ̨V2.1�汾(Android��),IOS1.1�汾����[2013/12/03]</a>
</div>
</div>
</div>
<!--main-->
<div id="main_div">
<!--button-->
<div class="button_div">
<div class="button_left">
<span>�ټ��һ��������õ��°�ʱ�伴����������</span><br />
<script>
	var date = new Date();
	document.write(date.getFullYear()+"��"+(date.getMonth()+1)+"��"+date.getDate()+"��");
</script>
</div>
<div class="button_right">
	<div class="weather">
		<span id="weather_unit_today" class="weather_unit">
			<span>����(����,����)</span><br/>
			<img src="images/a1.jpg" width="26" height="26"></img><br/>
			<span>10-3��</span>
			<span>����4-5��</span>
		</span>
		<span id="weather_unit_tomorrow" class="weather_unit">
			<span>����(����,�磩</span><br/>
			<img src="images/a0.jpg" width="26" height="26"></img><br/>
			<span>7-1��</span>
			<span>������4-5��</span>
		</span>
		<span id="weather_unit_tomorrowAfter" class="weather_unit">
			<span>����(����,��)</span><br/>
			<img src="images/a0.jpg" width="26" height="26"></img><br/>
			<span>7-3��</span>
			<span>����4-5��</span>
		</span>
		<span class="weather_today">
			<span>�Ϻ�</span>��<img src="images/a1.jpg" width="18" height="18"></img><span>10��3 ��</span> ����������<span>�����Ⱦ</span><br/>
			���տ�������ָ��(AQI):<span>186</span><br/>
			<span>
			ũ��ʮһ�¶�ʮ��</span>
			<a href="http://www.weather.com.cn/html/weather/areaNo.shtml#7d" target="_blank" style="margin-left:10px;">δ������Ԥ��</a>
		</span>
	</div> 
</div>
</div>

<div class="main_left">
<!--����-->
<div class="checkon">
<div class="title">
	<h1>ǩ��</h1>
	<span class="yellow_12px" style="line-height:40px;">���õ�һ���ǩ����ʼ</span>
</div>
<div style="float:left;width:100%;">
	<span id="editCheckon" class="icon icon-gear" title="�༭"></span>
	<form id="checkon_form" action="http://192.168.5.1:8080/EIP/DeskTop/TimeBookDetail.jsp" onsubmit="return validate();" autocomplete="off" method="post" name="checkon_form">
		<input type="hidden" value="s" name="oper"/>
		<input id="workdate" type="hidden" value="2013/12/17" name="workdate">
		<input id="ap" type="hidden" value="A" name="ap">
		<input id="workspot" type="hidden" value="O" name="workspot">
	<%@ include file="checkonbyday.jsp"%>
	<table width="100%" cellspacing="0" cellpadding="0" border="0" cellpading="0" class="info">
	<tbody>
		<tr>
			<td width="100px" class="input_label">��������</td>
			<td align="center" colspan="3" class="workspot">
				<ul>
					<li onclick="changeWorkSpot(this)" id="workspot_O" class="over">��˾</li>         
					<li onclick="changeWorkSpot(this)" id="workspot_F">�ͻ���</li>         
					<li onclick="changeWorkSpot(this)" id="workspot_J">��;</li>
					<li onclick="changeWorkSpot(this)" id="workspot_H">�ǹ���</li>        
				</ul>
				<script>
					var lastSpot = document.getElementById("workspot_"+"O");
					lastSpot.className="over";
				</script>
			</td>
		</tr>
		<tr>
			<td class="input_label">����/�</td>
			<td colspan="3">
				<input type="hidden" value="TD00028" id="threadid" name="threadid">
				<input ondblclick="this.value='';getMyTask(this);" onkeyup="getMyTask(this)" onfocus="getMyTask(this)" value="�Ϻ���˶  �ճ�Ӧ���з�-�Ŵ���" class="input_text" id="taskname" name="taskname">
				<div style="width:1px;height:1px;"><div class="mytask" style="display:none" id="mytask">
					<table><tbody id="mytask_table"></tbody></table></div>	
				</div>	
				<div style="display:none;color:red;" id="taskattention"></div>	
			</td>
		</tr>
		<tr>
			<td class="input_label">����״̬</td>
			<td style="width:150px">
				<select class="input_text" id="workstatus" name="workstatus">
		 			<option value="10">����</option><option value="21">�ٵ�</option><option value="22">����</option><option value="23">����</option>
		 		</select>
			</td>
			<td class="input_label">�����ص�</td>
			<td style="width:150px">
				<select class="input_text" id="workplace" name="workplace">
					<option value="001001">�Ϻ���˾</option>
					<option value="001002">������˾</option>
					<option value="001003">���칫˾</option>
					<option value="001004">���ڹ�˾</option>
					<option value="001005">���Ź�˾</option>
					<option value="001006">���ݹ�˾</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="input_label">�������ݱ���(��100����)</td>
			<td colspan="3">
				<textarea class="input_textarea" rows="5" id="workcomment" name="workcomment">��������Ż���̽��  </textarea>
			</td>
		</tr>
		<tr>
			<td class="input_label">�ƶ�������������д�Լ�����Ŀ������д���г�Ա�ƶ�(��100����)</td>
			<td colspan="3">
				<textarea class="input_textarea" rows="5" id="movecomment" name="movecomment"></textarea>
			</td>
		</tr>
		<tr>
			<td class="input_label">���ñ������Ǽ��豨������(��100����)</td>
			<td colspan="3">
				<textarea class="input_textarea" rows="5" id="chargecomment" name="chargecomment"></textarea>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="4">
				<input type="submit" class="input_button" value="����">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" onclick="$('.info').hide()" class="input_button" value="����">
			</td>
		</tr>
	</tbody>
	</table>
	</form>
</div>
</div>
<div class="notice_info" style="width=100%;height:187px;overflow-x:hidden;overflow-y:hidden">
	<h1>EIP�����</h1>
	<div style="width:100%;height:145px;overflow-y:hidden">
	<ul class="active">
		<li><a href="javascript:showContent(&quot;2013120001&quot;);" style="color:red">
		���⣺��˶�ƶ��칫ƽ̨V2.1�汾(Android��),IOS1.1�汾����[2013/12/03]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013110001&quot;);" style="color:red">
		��˶2013�������Ϻ��ͱ�����������[2013/11/12]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013090001&quot;);" style="color:red">
		�Ϻ���˾�򿨿��ڹ涨����[2013/09/02]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013120004&quot;);">
		����˶���϶���ᡱ��һ�ڣ���ʷ�����������ҵ�Ӫ���ĵá��������ע��[2013/12/04]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013120002&quot;);">
		ɹף����������&mdash;&mdash;12�����ջ� �ڴ�����ף��[2013/12/04]</a></li>
	</ul>
	<ul>
		<li><a href="javascript:showContent(&quot;2013100003&quot;);">
		��˶�ƶ��칫2.0������֧��ƻ���ˣ�[2013/10/28]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013050003&quot;);">
		��˶�ƶ����ڵǼǣ�for Android��[2013/05/20]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013050001&quot;);">
		����������д�仯˵��[2013/05/02]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013030003&quot;);">
		EIP���ٹ�������֪ͨ[2013/03/29]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013010001&quot;);">
		2013�濼�ڵǼǱ��֪ͨ[2013/01/04]</a></li>
	</ul>
	<ul>
		<li><a href="javascript:showContent(&quot;2012120002&quot;);">
		���ڰ칫�����ֹ�ò�֪ͨ[2012/12/18]</a></li>
		
		<li><a href="javascript:showContent(&quot;2012110002&quot;);">
		ͳһ�ʼ����ĵ���׼��֪ͨ[2012/11/01]</a></li>
		
		<li><a href="javascript:showContent(&quot;2012110001&quot;);">
		�����ƶȲ���˵������֪ͨ[2012/11/01]</a></li>
		
		<li><a href="javascript:showContent(&quot;2012040002&quot;);">
		�ٴη������ڼ�ǿʹ�����������֪ͨ[2012/04/26]</a></li>
		
		<li><a href="javascript:showContent(&quot;2011120004&quot;);">
		��Ŀ���ݼٹ涨[2011/12/29]</a></li>
	</ul>
	<ul>
		<li><a href="javascript:showContent(&quot;2011060003&quot;);">
		��ǿ��˾�ʼ�����ʹ�ù����֪ͨ[2011/06/23]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013120005&quot;);">
		�Ϻ�ũ���з���ƫ�����޶�ϵͳ������Ŀ�ɹ�����[2013/12/17]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013120003&quot;);">
		��11���������ջ᡿�����������������������н���û�У�[2013/12/04]</a></li>
		
		<li><a href="javascript:showContent(&quot;2013090004&quot;);">
		�����籣֪ͨ������˰ר����ȡ[2013/09/25]</a></li>
	</ul>
	<a class="more" href="javascript:void(0)"></a>
	<a class="less" href="javascript:void(0)"></a>
	</div>
</div>
<!--�����̬��Ϣ-->
<div class="myAdvancedInfo">
<div class="title">
<h1>���¶�̬��Ϣ</h1>
<div class="logMonth">
<select name="logMonth" onchange="getMyAdvancedInfo()">
    <option value="2013/06" selected>����(2013/06)</option>
    <option value="2013/05">����(2013/05)</option>
    <option value="2013/04">2013/04</option>
    <option value="2013/03">2013/03</option>
    <option value="2013/02">2013/02</option>
    <option value="2013/01">2013/01</option>
</select>
<span class="yellow_12px">ע�⵱��EIP��¼����Ϣ��������󣬲Żᷴӳ������ı����</span>
</div>
</div>
<ul>
	<li href="#table_info05">���������¼ </li>
	<li href="#table_info04">��ǰ�����豸 </li>
	<li href="#table_info03">���ñ�����¼ </li>
	<li href="#table_info02">��Ŀ���������� </li>
	<li class="over" href="#table_info01">�����ſ� </li>
</ul>
<div class="table_info active" id="table_info01">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th>No.</th>
    <th>��������</th>
    <th>�����ص�</th>
    <th>����״̬</th>
    <th>����</th>
    <th>���ڿۿ�</th>
    <th>����</th>
    <th>��Ŀ����</th>
    <th>���ò���</th>
    <th>��������</th>
  </tr>
  <tr>
    <td>1</td>
    <td>�ǹ���</td>
    <td>&nbsp;</td>
    <td>������</td>
    <td>3</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>2</td>
    <td>�ǹ���</td>
    <td>&nbsp;</td>
    <td>��Ϣ��</td>
    <td>2</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>3</td>
    <td>��˾</td>
    <td>�Ϻ���˾</td>
    <td>����</td>
    <td>15</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>�ϼ�</td>
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
    <th>��Ŀ</th>
    <th>��ʼ��</th>
    <th>��������</th>
    <th>����ϵ��</th>
    <th>����</th>
    <th>�����������£�</th>
  </tr>
  <tr>
    <td>1</td>
    <td>����ũ���Ŵ�����ϵͳ���ڸ�����Ŀ</td>
    <td>2013/08/19</td>
    <td>0.00</td>
    <td>1.00</td>
    <td>15.00</td>
    <td>0.00</td>
  </tr>
  <tr>
    <td>2</td>
    <td>����ũ���Ŵ�����ϵͳ���ڸ�����Ŀ</td>
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
    <th>��������</th>
    <th>����</th>
    <th>״̬</th>
    <th>���</th>
    <th>�ͻ�</th>
    <th>������</th>
    <th>����</th>
  </tr>
  <tr>
    <td>1</td>
    <td>2013110768</td>
    <td>����</td>
    <td>�������(����)</td>
    <td>39.50</td>
    <td>�Ϻ���˶��Ϣ�����ɷ����޹�˾�Ϻ��ܲ�</td>
    <td>�ԲӶ�</td>
    <td><input type="button" value="��������" onclick="alert('�Ե�һ�£����Ͼͺ�...')"/></td>
  </tr>
  <tr>
    <td>�ϼ�</td>
    <td colspan="3">&nbsp;</td>
    <td>39.50</td>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>
</div>
<div class="table_info" id="table_info04">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th>���</th>
    <th>�豸���к�</th>
    <th>����</th>
    <th>�ͺ�</th>
    <th>��ǰ����</th>
    <th>��������</th>
    <th>�Ǽ�����</th>
    <th>����</th>
  </tr>
  <tr>
    <td>201306250005</td>
    <td>3l3sJW1</td>
    <td>�ʼǱ�</td>
    <td>DELL 3421</td>
    <td>i3-2375M/4G/500G</td>
    <td>2013/06/25</td>
    <td>2013/08/08</td>
    <td><input type="button" value="�鿴" onclick="alert('�Ե�һ�£����Ͼͺ�...')"/></td>
  </tr>
</table>
</div>
<div class="table_info" id="table_info05">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th>No.</th>
    <th>��������</th>
    <th>״̬</th>
    <th>������</th>
    <th>��׼���</th>
    <th>�������</th>
  </tr>
  <tr>
    <td>�ϼ�</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>0.00</td>
    <td>0.00</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
</div>
<!--����������Ϣ-->
<div class="publicinfo">
<h1>����������Ϣ</h1>
<ul>
	<li href="#content03">����ָ�� </li>
	<li href="#content02">�����ƶȺ����ϻ���</li>
	<li class="over" href="#content01">���������</li>
</ul>
<div class="content active" id="content01" style="display:block;">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td width="50%" align="left" valign="top"><label>���£�</label><a class="mailAddress">hr_service@amarsoft.com</a>   <br />
      <span>������Դ��_�ճ�����һ�����������⣬��ת���� <br />
      ��ǩ�����������޸ĵ�����</span></td>
    <td width="48%" align="left" valign="top"><label>��٣�</label><a class="mailAddress">hr_vacation@amarsoft.com</a><br />
      <span>������Դ��_��ٹ���������١��Ӱ�������� </span><br /></td>
  </tr>
  <tr>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top"><label>��Ƹ��</label><a class="mailAddress">hr_resume@amarsoft.com</a> 
    <br />
    <span>������Դ��_��Ƹ���񣬴�����Ƹ����Ա�Ƽ�������</span>
</td>
    <td align="left" valign="top"> <label>���ڣ�</label><a class="mailAddress">timebook@amarsoft.com</a><br />
<span>���ڹ��������������</span></td>
  </tr>
  <tr>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top"><label>н�꣺</label><a class="mailAddress">salary@amarsoft.com</a> <br />
    <span>н�����н�ʡ��������������</span></td>
    <td align="left" valign="top"><label>��Ӫ��</label><a class="mailAddress">yyzx@amarsoft.com</a><br />
<span>��Ӫ���ģ�һ����Ӫ���񣬸�����Ŀ��һ����Ա�������ˣ�����á���������Ŀ���������</span></td>
  </tr>
  <tr>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top"><label>֧�֣�</label><a class="mailAddress">support@amarsoft.com</a> <br />
<span>����֧�����ģ����ڲ��Ϳͻ��ṩ����֧��</span> </td>
    <td align="left" valign="top"><label>PMO��</label><a class="mailAddress">pmo@amarsoft.com</a><br />
<span>PMO��Ŀ����칫�ң���Ŀ������Ա�����������</span></td>
  </tr>
  <tr>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top"><label>�ʼ���</label><a class="mailAddress">mailadmin@amarsoft.com</a> <br />
<span>�ʼ�����Ա�������ʼ��ʺź��ʼ�ϵͳ���������</span></td>
    <td align="left" valign="top"> <label>���ܣ�</label><a class="mailAddress">sysadmin@amarsoft.com</a><br />
<span>�������Ա�����������豸�����������</span></td>
  </tr>
</table>
</div>
<div class="content" id="content02">
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="position:relative;">
  <tr>
    <td align="left" valign="top">�������á����ݰ�˶���������޹�˾����ר���¡���֪ͨ<br />
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">�������á��Ϻ���˶��Ϣ�����ɷ����޹�˾����ר���¡���֪ͨ</td>
  </tr>
  <tr>
    <td align="left" valign="top">�ڲ��Ƽ����ֽ�-2013Q4 </td>
  </tr>
  <tr>
    <td align="left" valign="top">2013������˾�����֪</td>
  </tr>
  <tr>
    <td align="left" valign="top">�Ϻ���˾�򿨿��ڹ涨</td>
  </tr>
  <tr>
    <td align="left" valign="top">���ݰ�˶���������޹�˾�������涨_2013-V1.0</td>
  </tr>
  <tr>
    <td align="left" valign="top">�ڲ��Ƽ����ֽ�-13Q2</td>
  </tr>
  <tr>
    <td align="left" valign="top">�Ϻ���Բ���ݹ���涨</td>
  </tr>
  <tr>
    <td align="left" valign="top">��Ŀ����������ƶ�</td>
  </tr>
  <tr>
    <td align="left" valign="top">������ְԱ����������Ϻ��о�ס֤����֪ͨ</td>
  </tr>
  <tr>
    <td align="left" valign="top">��ְԱ��ְ����Ϣ�ռ�֪ͨ</td>
  </tr>
  <tr>
    <td align="left" valign="top">�ڲ��Ƽ����ֽ�-13Q1</td>
  </tr>
  <tr>
    <td align="left" valign="top">�����Ŀ�����ͨ��</td>
  </tr>
  <tr>
    <td align="left" valign="top">2013�濼�ڵǼǱ��֪ͨ</td>
  </tr>
  <tr>
    <td align="left" valign="top">�����ܽῼ��ϵͳ�����ֲ�</td>
  </tr>
  <tr>
    <td align="left" valign="top">����2012���°��깤���ܽἰ������֪ͨ</td>
  </tr>
  <tr>
    <td align="left" valign="top">2013Ԫ���ż�֪ͨ</td>
  </tr>
  <tr>
    <td align="left" valign="top">2012�����ֹ�˾���֪ͨ</td>
  </tr>
  <tr>
    <td align="left" valign="top">֪ʶ����2012��10��</td>
  </tr>
  <tr>
    <td align="left" valign="top">�����ƶȲ���˵��</td>
  </tr>
  <tr>
    <td align="left" valign="top">֪ʶ����2012��9��</td>
  </tr>
  <tr>
    <td align="left" valign="top">��2012�ϰ��깤���ܽἰ����������</td>
  </tr>
  <tr>
    <td align="left" valign="top">֪ʶ����2012��8��</td>
  </tr>
  <tr>
    <td align="left" valign="top">֪ʶ����2012��6��</td>
  </tr>
  <tr>
    <td align="left" valign="top">֪ʶ����2012��4��</td>
  </tr>
  <tr>
    <td align="left" valign="top">֪ʶ����2012��2��</td>
  </tr>
  <tr>
    <td align="left" valign="top">���滷������嵥</td>
  </tr>
  <tr>
    <td align="left" valign="top">Amarsoft�ڲ�����[������]-ת������������.xls</td>
  </tr>
  <tr>
    <td align="left" valign="top">�����ڻ㱨-��ppt�㱨ģ�塿_201110</td>
  </tr>
  <tr>
    <td align="left" valign="top">��ʦ����-���ʼ��㱨��ͨģ�塿_201110</td>
  </tr>
  <tr>
    <td align="left" valign="top">�Ϻ���˶�ڲ������ƶ�-�����ƶȣ�2011-V2.0��</td>
  </tr>
  <tr>
    <td align="left" valign="top">Buzillaʹ���ֲ�</td>
  </tr>
  <tr>
    <td align="left" valign="top">Amarsoft������豸�����ƶ�ժҪ</td>
  </tr>
  <tr>
    <td align="left" valign="top">��˶Э��Ƶ꽻ָͨ��</td>
  </tr>
  <tr>
    <td align="left" valign="top">�Ϻ���˶Ա������ְҵ�淶--������ɰ���ע��</td>
  </tr>
  <tr>
    <td align="left" valign="top">�Ϻ���˶�ڲ������ƶ�-��Ŀ���������ͱ����ƶȣ�2009-V1.0��</td>
  </tr>
  <tr>
    <td align="left" valign="top">�Ϻ���˶�ڲ������ƶ�-���ñ����ƶȣ�2009-V1.0��</td>
  </tr>
  <tr>
    <td align="left" valign="top">EIP���ڵ�¼ϵͳ¼��ϸ���ʹ��˵���飨2009�棩</td>
  </tr>
</table>
</div>
<div class="content" id="content03">
<select onchange="getJourneyHelp()" name="journeyCity">
	<option value="001000">00000��ȷ���ص�</option>
	<option value="010000" selected>Hu He Hao Te���ͺ�����</option>
	<option value="014000">Bao Tou��ͷ��</option>
	<option value="016000">Wu Hai�ں���</option>
	<option value="030000">Tai Yuan̫ԭ��</option>
	<option value="037000">Da Tong��ͬ��</option>
	<option value="044000">Yun Cheng�˳�</option>
	<option value="046000">Chang Zhi������</option>
	<option value="048000">Jin Cheng������</option>
	<option value="050000">Shi Jia Zhuangʯ��ׯ��</option>
	<option value="053000">Heng Shui��ˮ��</option>
	<option value="054000">Xint Tai��̨��</option>
	<option value="061000">Cang Zhou������</option>
	<option value="063000">Tang Shan��ɽ��</option>
	<option value="066000">Qin Huang Dao�ػʵ���</option>
	<option value="067000">Cheng De�е���</option>
	<option value="071000">Bao Ding������</option>
	<option value="072750">Zhuo Zhou������</option>
	<option value="075000">Zhang Jia Kou�żҿ���</option>
	<option value="100000">Bei Jing������</option>
	<option value="102800">Lang Fang�ȷ���</option>
	<option value="110000">Shen Yang������</option>
	<option value="111000">Liao Yang������</option>
	<option value="112000">Tie Ling������</option>
	<option value="113000">Fu Shun��˳��</option>
	<option value="114000">An Shan��ɽ��</option>
	<option value="115000">Ying KouӪ����</option>
	<option value="116010">Da Lian������</option>
	<option value="117000">Ben Xi��Ϫ��</option>
	<option value="118000">Dan Dong������</option>
	<option value="121000">Jin Zhou������</option>
	<option value="121500">Hu Lu Dao��«��</option>
	<option value="123000">Fu Xin������</option>
	<option value="124000">Pan Jin�̽���</option>
	<option value="130000">Chang Chun������</option>
	<option value="130500">Jiu Tai��̨��</option>
	<option value="132000">Ji Lin������</option>
	<option value="150000">Ha Er Bin������</option>
	<option value="157000">Mu Dan Jiangĵ����</option>
	<option value="161000">Qi Qi Ha Er���������</option>
	<option value="163000">Da Qing������</option>
	<option selected="" value="200000">Shang Hai�Ϻ���</option>
	<option value="210000">Nan Jing�Ͼ���</option>
	<option value="212000">Zhen Jiang����</option>
	<option value="212310">dan yang����</option>
	<option value="213000">Chang Zhou������</option>
	<option value="213100">Wu Jin���</option>
	<option value="214000">Wu Xi������</option>
	<option value="214200">Yi Xing������</option>
	<option value="214400">Jiang yin������</option>
	<option value="214500">Jing Jiang������</option>
	<option value="215000">Su Zhou������</option>
	<option value="215300">Kun Shan��ɽ��</option>
	<option value="215400">Tai Cang̫����</option>
	<option value="215500">Chang Shu������</option>
	<option value="215600">Zhang Jia Gang�żҸ���</option>
	<option value="221000">Xu Zhou������</option>
	<option value="222000">Lian Yun Gang���Ƹ���</option>
	<option value="223000">Huai'an������</option>
	<option value="225000">Yang Zhou������</option>
	<option value="225300">Tai Zhou̩����</option>
	<option value="226000">Nan Tong��ͨ��</option>
	<option value="230000">He Fei�Ϸ���</option>
	<option value="241000">Wu Hu�ߺ���</option>
	<option value="242700">Huang Shan��ɽ��</option>
	<option value="250010">Ji Nan������</option>
	<option value="253010">De Zhou������</option>
	<option value="255000">Zi Bo�Ͳ���</option>
	<option value="257000">Dong Ying��Ӫ��</option>
	<option value="261000">Wei FangΫ����</option>
	<option value="264000">Yan Tai��̨��</option>
	<option value="264200">Wei Hai������</option>
	<option value="266000">Qing Dao�ൺ��</option>
	<option value="271000">Tai'an̩����</option>
	<option value="271100">Lai Wu������</option>
	<option value="272000">Yan Zhou����</option>
	<option value="272100">Ji Ning������</option>
	<option value="273100">Qu Fu����</option>
	<option value="276000">Lin Yi������</option>
	<option value="276800">Ri Zhao������</option>
	<option value="277100">Zao Zhuang��ׯ��</option>
	<option value="300200">Tin Jin�����</option>
	<option value="310000">Hang Zhou������</option>
	<option value="311200">Xiao Shan��ɽ��</option>
	<option value="312000">Shao Xing������</option>
	<option value="313000">Hu Zhou ������</option>
	<option value="314000">Jia Xing������</option>
	<option value="315000">Ning Bo������</option>
	<option value="315207">Zhen Hai��</option>
	<option value="317000">Tai Zhoų����</option>
	<option value="317500">Wen Lin������</option>
	<option value="321000">Wen Ling����</option>
	<option value="322000">Yi Wu������</option>
	<option value="325000">Wen Ling������</option>
	<option value="330000">Nan Chang�ϲ���</option>
	<option value="332000">Jiu Jiang�Ž���</option>
	<option value="333000">Jing De Zhen��������</option>
	<option value="334000">Shang Rao������</option>
	<option value="341000">Gan Zhou������</option>
	<option value="350000">Fu Zhou������</option>
	<option value="361000">Xia Men������</option>
	<option value="362000">Quan ZhouȪ����</option>
	<option value="362200">Jin Jiang����</option>
	<option value="400000">Chong Qing����</option>
	<option value="410000">Chang Sha ��ɳ��</option>
	<option value="410300">Liu Yang���</option>
	<option value="411100">Xiang Tan��̶��</option>
	<option value="412000">Zhu Zhou ������</option>
	<option value="414000">Yue Yang������</option>
	<option value="421000">Heng Yang������</option>
	<option value="422000">Shao Yang������</option>
	<option value="43000 ">Han Kou������</option>
	<option value="430000">Wu Han�人��</option>
	<option value="430011">Wu Chang���</option>
	<option value="432100">Xiao GanТ����</option>
	<option value="434100">Jing Sha��ɳ</option>
	<option value="435000">Huang Shi��ʯ</option>
	<option value="437300">Xiang Fan �差��</option>
	<option value="443000">Yi Chang�˲���</option>
	<option value="450000">Zheng Zhou֣����</option>
	<option value="453000">Xin Xiang������</option>
	<option value="454100">Jiao Zuo������</option>
	<option value="455000">An Yang����</option>
	<option value="458000">He Bi�ױ���</option>
	<option value="461000">Xu Chang�����</option>
	<option value="463000">Zhu Ma Dianפ���</option>
	<option value="467000">Ping DingShanƽ��ɽ��</option>
	<option value="471000">Luo Yang������</option>
	<option value="47200 ">San Men Xia����Ͽ</option>
	<option value="473000">Yan Yang������</option>
	<option value="475000">Kai Feng������</option>
	<option value="510000">Guang Zhou������</option>
	<option value="511700">Dong Guan ��ݸ��</option>
	<option value="518000">Shen Zhen������</option>
	<option value="519000">Zhu Hai�麣��</option>
	<option value="524040">Zhan Jiangտ����</option>
	<option value="528000">Fo Shan��ɽ��</option>
	<option value="528200">Nan Hai �Ϻ���</option>
	<option value="529300">Kai Ping��ƽ��</option>
	<option value="530000">Nan Ning������</option>
	<option value="541000">Gui Lin������</option>
	<option value="543200">Cen Xi�Ϫ��</option>
	<option value="546000">Liu Zhou������</option>
	<option value="550000">Gui Yang������</option>
	<option value="563000">Zun Yi������</option>
	<option value="570000">Hai Kou������</option>
	<option value="572100">San Ya������</option>
	<option value="610000">Cheng Du�ɶ���</option>
	<option value="614300">Le Shan��ɽ��</option>
	<option value="615000">Xi Chang������</option>
	<option value="617000">Pan Zhi Hua��֦��</option>
	<option value="618000">De Yang������</option>
	<option value="621000">Min Yang������</option>
	<option value="628000">Guang Yuan��Ԫ��</option>
	<option value="629000">Sui Ning������</option>
	<option value="637100">Nan Chong�ϳ���</option>
	<option value="643000">Zi Gong�Թ���</option>
	<option value="644000">Yi Bin�˱���</option>
	<option value="646000">Lu Zhou������</option>
	<option value="652200">Kun Ming������</option>
	<option value="653100">Yu Xi��Ϫ����</option>
	<option value="655000">Qu Jing��������</option>
	<option value="674100">li Jiang������</option>
	<option value="674400">Shangri-la�������</option>
	<option value="710000">Xi'an������</option>
	<option value="712000">Xian Yang������</option>
	<option value="721000">Bao Ji������</option>
	<option value="730000">Lan Zhou ������</option>
	<option value="735100">Jia Yu Guan������</option>
	<option value="736200">Dun Huang�ػ���</option>
	<option value="750000">Yin Chuan������</option>
	<option value="753200">Shi Zui Shan ʯ��ɽ��</option>
	<option value="810000">Xi Ning������</option>
	<option value="830000">Wu Lu Mu Qi��³ľ����</option>
	<option value="834000">Ke La Ma Yi����������</option>
	<option value="841000">Korla�����</option>
	<option value="T00001">Tai Beį����</option>
 </select>

	<div id="journeyHelp">
		�𳵽�ͨ��1���ӱ������������𳵣�Ϧ��������<br/>
		2�����Ϻ����������ɻ������ͺ��ػ�������������ͣ����»����վ�£��ٴ򳵵��Ƶ꣬���ͺ������о��ڸþƵ����·б���档<br/>
		�ɻ���ͨ��<br/>
		������ͨ��<br/>
		Э��Ƶ꣺������֮�ǡ����ɹź��ͺ������»����61�š�<br/>
		7�������Ƶ꣺��Ա���ţ�92563709 ���룺amarsoft65106600 ��վ��www.7daysinn.cn<br/>
		��վ��¼�ɹ���������Ԥ��ҳ�����Ԥ���������Ϲ����Ļ�Ա��Ϊ׼��Ԥ���ɹ�����ס��Աֻ����Ԥ�����ձ���˾��Ա���ż��ɣ�Ԥ������������20��00���˷�ʱ����ס��Ա�����˷���������á�<br/>
		��ҾƵ꣺��˾���ţ�8000018807�����룺123456��ͨ��ȫ�������绰��4008203333/8008203333���½www.homeinns.com����Ԥ�������ϵ�½ʱ"��Ա��"������д��˾���---�Ϻ���˶��
		�������м۵ľ��ۣ��˷�ʱ�������13:00<br/>
		�����Ƶ꣺<br/>
		��ʳ�ο���<br/>
		������Ϣ�����ͺ������е�ַ�����ɹź��ͺ������»����50�š�
	</div>
</div>
</div>
<div class="clear"></div>
</div>
<div class="main_right">
<!--�ʼ�-->
<div class="mail_info">
<h1>�����ʼ�</h1>
<ul>
<li class="over"><a href="javascript:void(0)">��������Ҫ����ֹ��ǰ���°���ٱ�</a>
<img src="images/mail_icon.png" width="15" height="11" title="�ظ�"/>
<div class="tip-bubble tip-bubble-top"><span>���ã���������2��5�ա�2��6�ա�2��7�ջ����Ҫ�����¸��ٱ����������ģ��������ʴ���ϵ����</span></div>

</li>
<li><a href="javascript:void(0)">����������һְ�����Խ������....</a><img src="images/mail_icon.png" width="15" height="11" title="�ظ�"/></li>
<li><a href="javascript:void(0)">iPad����ϵͳ��ͼ</a><img src="images/mail_icon.png" width="15" height="11" title="�ظ�"/></li>
<li><a href="javascript:void(0)">�����Ƽ�԰����Ŀ��һ������㱨...</a><img src="images/mail_icon.png" width="15" height="11" title="�ظ�"/></li>
<li><a href="javascript:void(0)">���ܹ����ƻ�����������</a><img src="images/mail_icon.png" width="15" height="11" title="�ظ�"/></li>
<li><a href="javascript:void(0)">�㷢Ipad ԭʼ������</a><img src="images/mail_icon.png" width="15" height="11" title="�ظ�"/></li>
</ul>
</div>
<!--��̳--->
<div class="bbs_info">
	<h1>��̳��̬</h1>
	<ul>
		<li><a href="javascript:void(0)">�����Ҫ�ż���</a>��������[��������]</li>
		<li><a href="javascript:void(0)">AWE2.6�������񣬾���������</a>[��Ʒ�з�]</li>
	
	</ul>
</div>

</div>
<div class="clear"></div>
<div id="footer">Copyright &copy;2013 Amarsoft all rights reserved. �Ϻ���˶��Ϣ�����ɷ����޹�˾</div>
</div>
</body>
</html>