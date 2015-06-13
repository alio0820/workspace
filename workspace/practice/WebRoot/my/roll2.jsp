<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>  
    <title>滚动效果展示</title>
  </head>
  
  <body>
		<table style="cellspacing: &amp; rsquo;" cellpadding="0"
			align="center" bgcolor="#ffffff" border="0">
			<tbody>
				<tr>
					<td class="searchbox" valign="top" align="left">
						<div
							style="font-size: 12px; overflow: hidden; width: 100%; color: #5c5c5c; line-height: 25px; padding-top: 8px; height: 260px; text-align: left"
							align="center">
							<div id="demo"
								style="border-right: medium none; border-top: medium none; font-size: 12px; overflow: hidden; border-left: medium none; width: 230px; color: #5c5c5c; line-height: 25px; border-bottom: medium none; height: 260px; text-align: left"
								align="center">
								<div id="demo1">
									<!-- 定义内容-->
									<ul>
										<li>
											<a target="_self" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;热烈庆祝东方资源网网站正式上线！
											</a>
										</li>
										<li>
											<a target="_self" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通过利用互联网先进技术，致力于中国投资资源的整合和合理配置服务，成为具有行业领先地位的，以开展招商引资、技术转让、厂房租售、企业专案及网络广告服务等业务的信息技术服务提供商。打造&quot;中国第一投资资源信息技术服务平台&quot;!</a>
										</li>
										<li>
											<a target="_self" href="#"><b>使命</b>
											</a>
										</li>
										<li>
											<a target="_self" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.为投资者创造稳定和合理的回报。</a>
										</li>
										<li>
											<a target="_self" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.与政府及社会各界投资服务机构建立新型的合作伙伴关系。</a>
										</li>
										<li>
											<a target="_self" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.为推动投资资源的合理配置和社会服务资源的优化作贡献。</a>
										</li>
									</ul>
								</div>
								<div id="demo2">
									&nbsp;
								</div>
							</div>
							<script language="javascript" type="text/javascript">
<!--
	var demo = document.getElementById("demo");
	var demo1 = document.getElementById("demo1");
	var demo2 = document.getElementById("demo2");
	var speed = 35;
	demo2.innerHTML = demo1.innerHTML; //克隆demo2为demo1
	function Marquee() {
		if (demo2.offsetTop - demo.scrollTop <= 0) //当滚动至demo1与demo2交界时 
			demo.scrollTop -= demo1.offsetHeight; //demo跳到最顶端 
		else {
			demo.scrollTop++;
		}
	}
	var MyMar = setInterval(Marquee, speed); //设置定时器 
	demo.onmouseover = function() {
		clearInterval(MyMar);
	}; //鼠标经过时清除定时器达到滚动停止的目的 
	demo.onmouseout = function() {
		MyMar = setInterval(Marquee, speed);
	}; //鼠标移开时重设定时器
//-->
</script>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>
