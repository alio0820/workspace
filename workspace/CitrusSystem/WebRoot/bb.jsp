<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.citrus.JavaVM.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<!-- saved from url=(0014)about:internet -->
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="柑橘产业信息化系统" /> 
<meta name="description" content=""/>

<title>柑橘产业信息化系统</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="../excanvas.min.js"></script><![endif]-->
    <script language="javascript" type="text/javascript" src="js/flot/excanvas.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/flot/jquery.js"></script>
    <script language="javascript" type="text/javascript" src="js/flot/jquery.flot.js"></script>
</head>

<body><br><br/><br/>
<script language="javascript">

    var isnDay = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六","星期日");
    
	function qiehuan(num){
		for(var id = 0;id<=6;id++)
		{
			if(id==num)
			{
				document.getElementById("qh_con"+id).style.display="block";
				document.getElementById("mynav"+id).className="nav_on";
			}
			else
			{ 			
				document.getElementById("qh_con"+id).style.display="none";
				document.getElementById("mynav"+id).className="";
			}
		}
	}
	
	function time()
	{
        var div = document.getElementById("time");
        var today=new Date();
        var month=today.getMonth()+1;
        var hours= today.getHours();
		var minutes = today.getMinutes();
		var seconds = today.getSeconds();
		if(hours<10) hours="0"+hours;
		if(minutes<10) minutes="0"+minutes;
		if(seconds<10) seconds="0"+seconds;
		div.innerHTML = today.getFullYear()+"年"+month+"月"+today.getDate()+"日"+"   "+isnDay[today.getDay()]+"   "+hours+":"+minutes+":"+seconds;
	}
	setInterval("time()",500);
	
	var d1 = [];
	var d2 = [];
	function createXDOM() {

		if (window.XMLHttpRequest) {

			xmlHttp = new XMLHttpRequest();

		} else if (window.ActiveXObject) {

			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} else {
		
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	function getInfoByName(){
		createXDOM();
		var myDate = new Date();
		var str = myDate.getTime();		
		var url = "citrusInfo!info.action?str1="+str;
        var location =document.getElementById("location");
//        var tree =document.getElementById("tree");
        var location1= location.options[location.selectedIndex].value;                
//        var tree1= tree.options[tree.selectedIndex].value;
        var param1 = "location="+location1;
//        var param2 = "tree="+tree1;
		xmlHttp.open("post",url,true);
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xmlHttp.onreadystatechange = display;
		xmlHttp.send(param1);
	}
	function juece(){
	    createXDOM();
		var myDate = new Date();
		var str = myDate.getTime();		
		var url = "citrusInfo!juece.action?str1="+str;
		xmlHttp.open("post",url,true);
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xmlHttp.onreadystatechange = juece_1;
		xmlHttp.send(null);
	}
	function juece_1(){
		if (xmlHttp.readyState == 4) {
			responseContext = trim(xmlHttp.responseText);//看来好像自动去掉了空格，不需要trim了哈！
			zhuanjia.innerHTML =responseContext;
			}
	}
	
	function jvm(){
	    createXDOM();
		var myDate = new Date();
		var str = myDate.getTime();		
		var url = "servlet!retu.action";
		xmlHttp.open("post",url,true);
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xmlHttp.onreadystatechange = jvm_1;
		xmlHttp.send(null);
	}
	function jvm_1(){
		if (xmlHttp.readyState == 4) {
			responseContext = trim(xmlHttp.responseText);
			result.innerHTML ="";
			var arrResult = responseContext.split(";");
			d1=[];d2=[];d3=[];d4=[];d5=[];
			for(var i = 1; i <arrResult.length; i=i+6)			  
              d1.push([arrResult[i],arrResult[i+1]]);
            for(var i = 1; i <arrResult.length; i=i+5)			  
              d2.push([arrResult[i],arrResult[i+2]]);
            for(var i = 1; i <arrResult.length; i=i+5)			  
              d3.push([arrResult[i],arrResult[i+3]]);
            for(var i = 1; i <arrResult.length; i=i+5)			  
              d4.push([arrResult[i],arrResult[i+4]]);
            for(var i = 1; i <arrResult.length; i=i+5)			  
              d5.push([arrResult[i],arrResult[i+5]]);                                                        
              //重新绘图
              $(function () {
//                  for (var i = 0; i < 30; i++)
//                      d1.push([i,i]);
              
              $.plot($("#placeholder1"),
              [
              {
                 data: d1,
                 //bars: { show: true ,fill: true},
                 lines: { show: true, fill: true },
                 points: { show: true }
              }
              ]);
              $.plot($("#placeholder1"),
              [
              {
                 data: d2,
                 lines: { show: true, fill: true },
                 points: { show: true } 
              }
              ]);
              $.plot($("#placeholder1"),
              [
              {
                 data: d3,
                 lines: { show: true, fill: true },
                 points: { show: true } 
              }
              ]);
              $.plot($("#placeholder1"),
              [
              {
                 data: d4,
                 lines: { show: true, fill: true },
                 points: { show: true } 
              }
              ]);
              $.plot($("#placeholder1"),
              [
              {
                 data: d5,
                 lines: { show: true, fill: true },
                 points: { show: true } 
              }
              ]);
            });                           
			//xmlHttp.abort();//取消当前请求  
		} 
		else {
			//result.innerHTML = "5";
			//xmlHttp.abort();//取消当前请求
		}
	}
	
    function display() 
	{
		if (xmlHttp.readyState == 4) {
			responseContext = trim(xmlHttp.responseText);//看来好像自动去掉了空格，不需要trim了哈！
			result.innerHTML ="";
			var arrResult = responseContext.split(";");
			d1=[];d2=[];
			for (var i = 0; i <arrResult.length; i=i+2)			  
              d2.push([arrResult[i+1],arrResult[i+2]]);              
                                          
              //重新绘图
              $(function () {
//                  for (var i = 0; i < 30; i++)
//                      d1.push([i,i]);
              
              $.plot($("#placeholder2"),
              [
              {
                 data: d2,
                 //bars: { show: true ,fill: true},
                 lines: { show: true, fill: true },
                 points: { show: true }
              }
              ]);
            });
                            
			//xmlHttp.abort();//取消当前请求  
		} 
		else {
			//result.innerHTML = "5";
			//xmlHttp.abort();//取消当前请求
		}
	}	
	function trim(str) {
		for ( var i = 0; i < str.length && str.charAt(i) == " "; i++)
			;
		for ( var j = str.length; j > 0 && str.charAt(j - 1) == " "; j--)
			;
		if (i > j)
			return "";
		return str.substring(i, j);
	}
	setInterval('jvm();',1000);
	setInterval('getInfoByName();',1000);//每隔 500ms 刷新数据
</script> 
<center>
<h1>西南大学农业农村信息化工程技术研究中心</h1>
<div id=menu_out>
<div id=menu_in>
<div id=menu>
<UL id=nav>
<LI><A class=nav_on id=mynav0 onmouseover=javascript:qiehuan(0) href="#"><SPAN>首 页</SPAN></A></LI>

<LI class="menu_line"></LI><li><a href="http://www.lanrentuku.com/" onmouseover="javascript:qiehuan(1)" id="mynav1" class="nav_off"><span>品种资源信息化</span></a></li>
<li class="menu_line"></li><li><a href="#" onmouseover="javascript:qiehuan(2)" id="mynav2" class="nav_off"><span>果园建设辅助设计</span></a></li>
<li class="menu_line"></li><li><a href="#" onmouseover="javascript:qiehuan(3)" id="mynav3" class="nav_off"><span>柑橘生产过程信息化</span></a></li>
<li class="menu_line"></li><li><a href="#" onmouseover="javascript:qiehuan(4)" id="mynav4" class="nav_off"><span>鲜果市场</span></a></li>
<li class="menu_line"></li><li><a href="#" onmouseover="javascript:qiehuan(5)" id="mynav5" class="nav_off"><span>果品加工信息化</span></a></li>
<li class="menu_line"></li><li><a href="#" onmouseover="javascript:qiehuan(6)" id="mynav6" class="nav_off"><span>关于我们</span></a></li>
</UL>
<div id=menu_con><div id=qh_con0 style="DISPLAY: block"><UL>
  <LI><A href="#">滚动新闻</A></LI><LI class=menu_line2></LI>
  <LI><A href="#"><SPAN>最新柑橘市场导向......</SPAN></A></LI><LI class=menu_line2></LI>
</UL></div> 
<div id=qh_con1 style="DISPLAY: none"><UL>
  <LI><a href="#"><span>育种</span></A></LI><LI class=menu_line2></LI>
  <LI><A href="#"><SPAN>种苗</SPAN></A></LI><LI class=menu_line2></LI>
  <LI><A href="#"><SPAN>市场预测</SPAN></A></LI>
</UL></div> 
<div id=qh_con2 style="DISPLAY: none"><UL>
  <LI><a href="#"><span>改土设计</span></A></LI><LI class=menu_line2></LI>
  <LI><A href="#"><SPAN>道路设计</SPAN></A></LI><LI class=menu_line2></LI>
  <LI><A href="#"><SPAN>沟渠设计</SPAN></A></LI>
  <LI><A href="#"><SPAN>种植设计</SPAN></A></LI>
</UL></div> 
<div id=qh_con3 style="DISPLAY: none"><UL>
  <LI><a href="#"><span>施肥决策支持系统</span></A></LI><LI class=menu_line2></LI>
  <LI><A href="#"><SPAN>灌溉决策支持系统</SPAN></A></LI><LI class=menu_line2></LI>
  <LI><A href="#"><SPAN>病虫害防治与预警</SPAN></A></LI>
  <LI><A href="#"><SPAN>劳动力资源信息化</SPAN></A></LI>
</UL></div> 
<div id=qh_con4 style="DISPLAY: none"><UL>
  <LI><a href="#"><span>保鲜技术</span></A></LI><LI class=menu_line2></LI>
  <LI><A href="#"><SPAN>物流与市场信息化</SPAN></A></LI><LI class=menu_line2></LI>
</UL></div>
<div id=qh_con5 style="DISPLAY: none"><UL>
  <LI><a href="#"><span>加工生产过程控制</span></A></LI><LI class=menu_line2></LI>
  <LI><A href="#"><SPAN>质量控制与安全</SPAN></A></LI><LI class=menu_line2></LI>
  <LI><A href="#"><SPAN>产品销售参数</SPAN></A></LI>
</UL></div>
<div id=qh_con6 style="DISPLAY: none"><UL>
  <LI><a href="#"><span>..............</span></A></LI><LI class=menu_line2></LI>
</UL></div>
</div></div></div></div>
<br>
<div style="width:960px;float:center">
<div style="float:left;width:200px"></div>
<div style="display:inline;float:right" id ="time"></div>
<div class="class1" style="display:inline">灌溉决策支持系统-实时监控数据如下：</div><br>
<span>请选择</span>
<select id="location" onChange="getInfoByName()">
    <option value="locate">地区</option>
    <option value="chongq_fuling_000001">柑橘1</option>
    <option value="chongq_fuling_000002">柑橘2</option>
    <option value="chongq_fuling_000003">柑橘3</option>
    <option value="chongq_fuling_000004">柑橘4</option>
    <option value="chongq_fuling_000005">柑橘5</option>
    <option value="chongq_fuling_000006">柑橘6</option>
    <option value="chongq_fuling_000007">柑橘7</option>
    <option value="chongq_fuling_000008">柑橘8</option>
</select>
&nbsp;&nbsp;
<select id="tree">
    <option value="treename">树名</option>
    <option value="0001">0001</option>
    <option value="0002">0002</option>
    <option value="0003">0003</option>
    <option value="0004">0004</option>
</select>

<div id="placeholder2" style="float:center;width:600px;height:300px"></div>
<div id="placeholder1" style="float:center;width:600px;height:300px"></div>
</div> 
</center>
<script type="text/javascript">
$(function () {
//    for (var i = 0; i < 30; i++)
//        d1.push([i,i]);
              
    $.plot($("#placeholder2"), 
    [
        {
            data: d1,
            lines: { show: true, fill: true },
            points: { show: true } 
        },
        {
            data: d2,
            //bars: { show: true ,fill: true},
             lines: { show: true, fill: true },
            points: { show: true }
        }
    ]);
    $.plot($("#placeholder1"), 
    [
        {
            data: d1,
            lines: { show: true, fill: true },
            points: { show: true } 
        },
        {
            data: d2,
            //bars: { show: true ,fill: true},
             lines: { show: true, fill: true },
            points: { show: true }
        }
    ]);
});
</script>
<center>
<input type="button" value="打印专家决策" onclick="juece()"/>
<div id="zhuanjia"></div><br>
<div>请选择专家决策：</div>
<input type="button" value="决策一"/>
<input type="button" value="决策二"/>
<input type="button" value="决策三"/>
<label id="result"></label>
<form action="citrusInfo.action"  method="post"><!-- 没有加Struts标签的时候必须加.action，且不支持namespace -->
<input type="submit" value="提交"/>
</form>
</center>
<input type="hidden" id = "shuju" value="0"/>
  </body>
  <!-- www.sxymorg.cn
       www.zggjc.cn
       www.cric.cn -->
</html>
