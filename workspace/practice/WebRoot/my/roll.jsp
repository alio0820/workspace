<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>

<head>
<title>网页滚动</title>
</head>
<body>
<DIV id=rolllink style="OVERFLOW: hidden; WIDTH: 497px; HEIGHT: 210px">

	<DIV id=rolllink1>

		<!-- 以下是需要滚动的内容 -->

		<table width="100%" border="0" cellspacing="0" cellpadding="0">

			<tr>

				<td width="82%">
					adfdfdfdfddadfdfdfdfddadfdfdfdfddadfdfdfdfddadfdfdfdfddadfdfdfdfdd
adfdfdfdfddadfdfdfdfddadfdfdfadfdfdfdfddadfdfdfdfddadfdfdfdfddadfdfdfdfdddfdd
				</td>

<script>
	var rollspeed = 1000;
	//设置滚动速度
	rolllink2.innerHTML = rolllink1.innerHTML;
	function Marquee() {

		if (rolllink2.offsetTop - rolllink.scrollTop <= 0)
			rolllink.scrollTop -= rolllink1.offsetHeight;
		else {
			rolllink.scrollTop++;
		}
	}
	var MyMar = setInterval(Marquee, rollspeed);
	rolllink.onmouseover = function() 
	{
		clearInterval(MyMar);
	};      //鼠标经过，停止滚动
	rolllink.onmouseout = function() {
		MyMar = setInterval(Marquee, rollspeed);
	};     //鼠标离开，开始滚动
</script>
</body>
</html>
