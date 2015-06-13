<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- DTD文档类型定义，有的时候文档类型也会导致某些功能实现不了 -->
<html>
	<head>
		<title>施肥决策支持系统</title>
		<META content="MSHTML 6.00.6000.16825" name=GENERATOR>
		<meta name="keywords" content="">
		<meta name="description" content="">
		<meta name="robots" content="all">
		<meta name="author" content="author string">
		<LINK media=all href="css/stunicholls.css" type=text/css rel=stylesheet>
        <LINK media=all href="css/pro_left_right.css" type=text/css rel=stylesheet>
		<link href="files_files/main.css" rel="stylesheet" type="text/css">
		<link href="files_files/font.css" rel="stylesheet" type="text/css">
		<link href="files_files/layout.css" rel="stylesheet" type="text/css">
		<link href="files_files/jkstyle.css" rel="stylesheet" type="text/css">
		<link href="css/style.css" rel="stylesheet" type="text/css">
		
		<link href="css/css.css" rel="stylesheet" type="text/css" />
        
        <script language="javascript" type="text/javascript" src="js/flot/excanvas.min.js"></script>
        <script language="javascript" type="text/javascript" src="js/flot/jquery.js"></script>
        <script language="javascript" type="text/javascript" src="js/flot/jquery.flot.js"></script>
		<!-- jquery-1.4.1.min.js中某些函数的定义在以上三个js文件中出现过 -->
        
	    <script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
	    <script src="js/jquery.slide.js" type="text/javascript"></script>
	    <script src="js/jquery-func.js" type="text/javascript"></script>
		
	</head>

	<body>
			<DIV id=pro_linedrop_copy></DIV>				

	
			<div id="top2" style="width:100%"><!-- 第三层 -->
	            <div class="shell">	
	            	
		            <!-- Header 
		            <div id="header">
			            <h1 id="logo"><a href="#">Urgan Gear</a></h1>
			            <div id="navigation">
				            <ul>
				                <li><a href="#">Home</a></li>
					            <li><a href="#">Support</a></li>
					            <li><a href="#">My Account</a></li>
					            <li><a href="#">The Store</a></li>
					            <li class="last"><a 

href="#">Contact</a></li>
				            </ul>
			            </div>
		            </div>
		             End Header -->
					<div id="header"></div>
		            <!-- Slider -->
		            <div id="slider">
			            <div id="slider-holder">
				            <ul>				                
				                <li><a href="/CitrusSystem/gj-sf.action"><img src="images/agricultural_3.png" alt="" /></a></li>
				                <li><a href="/CitrusSystem/xg-bx.action"><img src="images/agricultural_4.png" alt="" /></a></li>
				                <li><a href="/CitrusSystem/gp-jgsc.action"><img src="images/agricultural_5.png" alt="" /></a></li>
				                <li><a href="/CitrusSystem/pz-yz.action"><img src="images/agricultural_1.png" alt="" /></a></li>
				                <li><a href="/CitrusSystem/gy-gt.action"><img src="images/agricultural_2.png" alt="" /></a></li>			                
				            </ul>
			            </div>
			            <div id="slider-nav">
				            <a href="/" class="prev">Previous</a>
				            <a href="/" class="next">Next</a>
			            </div>
		            </div>
		            <!-- End Slider -->
	            </div>	
            </div>
            
            
           
<DIV id=pro_linedrop><!-- 第四层 -->
<UL class=select>
  <LI>
  	<A href="/CitrusSystem/index.jsp"><B>主页</B></A> 
  </LI>
  <LI class=line><A href="/CitrusSystem/pz-yz.action"><B>品种资源信息化

</B>
  	</A>
  	

  <UL class=sub>	 
    <LI>
    	<A href="/CitrusSystem/pz-yz.action">育种</A> 
    </LI>
    <LI>
    	<A  href="/CitrusSystem/pz-zm.action">种苗</A> 
    </LI>
    <LI>
    	<A href="/CitrusSystem/pz-scyc.action">市场预测</A> 
    </LI>
  </UL>
  
   </LI>
   
   <LI class=line>
       <A href="/CitrusSystem/gy-gt.action"><B>果园建设辅助设计</B></A>
  <UL class=sub>	 
    <LI>
    	<A href="/CitrusSystem/gy-gt.action">改土设计</A> 
    </LI>
    <LI>
    	<A  href="/CitrusSystem/gy-dl.action">道路设计</A> 
    </LI>
    <LI>
    	<A href="/CitrusSystem/gy-gq.action">沟渠设计</A> 
    </LI>
    <LI>
    	<A href="/CitrusSystem/gy-dz.action">定植设计</A> 
    </LI>
  </UL>
  
   </LI>
   
   <LI class=line><A href="/CitrusSystem/gj-sf.action"><B>柑橘生产过程信

息化</B>
  	</A>
  	

  <UL class=sub>	 
    <LI>
    	<A href="/CitrusSystem/gj-sf.action">施肥决策支持系统</A> 
    </LI>
    <LI>
    	<A  href="/CitrusSystem/jsp/gj-gg.jsp">灌溉决策支持系统</A> 
    </LI>
    <LI>
    	<A href="/CitrusSystem/gj-bch.action">病虫害防治与预警</A> 
    </LI>
    <LI>
    	<A href="/CitrusSystem/gj-ldl.action">劳动力资源与信息化</A> 
    </LI>
  </UL>
  
   </LI>
  	
  <li class=line><A href="/CitrusSystem/xg-bx.action"><B>鲜果市场</B>
  	</A>
  <UL class=sub>	
    <LI>
    	<A href="/CitrusSystem/xg-bx.action">保鲜技术</A> 
    </LI>
    <LI>
    	<A  href="/CitrusSystem/xg-wl.action">物流与市场信息</A> 
    </LI>
  </UL>
</LI>
   
  <LI class=line>
  	<A href="/CitrusSystem/gp-jgsc.action"><B>果品加工信息化</B>
  	</A>

  <UL class=sub>
    <LI>
    	<A href="/CitrusSystem/gp-jgsc.action">加工生产过程控制</A> 
    </LI>
    <LI>
    	<A href="/CitrusSystem/gp-zlkz.action">质量控制与检测</A> 
    </LI>
    <LI><A  href="/CitrusSystem/gp-cpxs.action">产品销售策略</A> 
    </LI>
   </UL>
 </LI>
</UL>   
    </DIV>     
    <br><br>
    <div id="doc">                             
				<div class="jk_main"><!-- 第五层 -->

					<div class="jk_fuc fl">
						<div class="fuc_top"></div>
						<div class="fuc_m">

							<dl>
								<dt>
									<a href="/CitrusSystem/pz-yz.action"><img
											src="files_files/ico_0.gif" border="0">
									</a>
								</dt>
								<dd>
									<h3>
										<a href="/CitrusSystem/pz-yz.action">品种资源信息化</a>
									</h3>
									<p>
										<a href="/CitrusSystem/pz-yz.action">优化品种，多渠道，多方位获取优质资源</a>
									</p>
								</dd>
							</dl>


							<dl>
								<dt>
									<a href="/CitrusSystem/gy-gt.action"><img
											src="files_files/ico_6.gif" border="0">
									</a>
								</dt>
								<dd>
									<h3>
										<a href="/CitrusSystem/gy-gt.action">果园建设辅助设计</a>
									</h3>
									<p>
										<a href="/CitrusSystem/gy-gt.action">科学规划果园建设，专家为你提供最高效的操作方案</a>
									</p>
								</dd>
							</dl>



							<dl>
								<dt>
									<a href="/CitrusSystem/gj-sf.action"><img
											src="files_files/ico_1.jpg" border="0">
									</a>
								</dt>
								<dd>
									<h3>
										<a href="/CitrusSystem/gj-sf.action">柑橘生产过程信息化</a>
									</h3>
									<p>
										<a href="/CitrusSystem/gj-sf.action">助您轻松掌控柑橘生产的实时信息，第一时间做出决策</a>
									</p>
								</dd>
							</dl>


							<dl>
								<dt>
									<a href="/CitrusSystem/xg-bx.action"><img
											src="files_files/ico_2.jpg" border="0">
									</a>
								</dt>
								<dd>
									<h3>
										<a href="/CitrusSystem/xg-bx.action">鲜果市场</a>
									</h3>
									<p>
										<a href="/CitrusSystem/xg-bx.action">保鲜技术全面应用，市场信息即时获取，保鲜与物流两不误</a>
									</p>
								</dd>
							</dl>

							<dl>
								<dt>
									<a href="/CitrusSystem/gp-jgsc.action"><img
											src="files_files/ico_3.jpg" border="0">
									</a>
								</dt>
								<dd>
									<h3>
										<a href="/CitrusSystem/gp-jgsc.action">果品加工信息化</a>
									</h3>
									<p>
										<a href="/CitrusSystem/gp-jgsc.action">便捷控制加工过程，有效保证质量与安全，全程策划果品销售</a>
									</p>
								</dd>
							</dl>

							<dl>
								<dt>
									<a href="/CitrusSystem/gj-data.action"><img
											src="files_files/ico_4.jpg" border="0">
									</a>
								</dt>
								<dd>
									<h3>
										<a href="/CitrusSystem/gj-data.action">柑橘数据报告</a>
									</h3>
									<p>
										<a href="/CitrusSystem/gj-data.action">对监控数据进行定期分析并发送报告邮件，让一切变化尽在掌控中</a>
									</p>
								</dd>
							</dl>

						</div>
						<div class="fuc_btm"></div>
					</div>

					<div class="textbox fr">
						<div class="textbox_top"></div>
						<div class="textbox_m" style="min-height: 710px; _height: 710px;">

							<blockquote>
								<h3>
									加工生产过程控制
								</h3>

								<table border="0" cellpadding="2" cellspacing="2" width="100%" style="font:18px">
									<tbody>
										<tr>
											<td>
											    <center>
<div style="width:600px;float:center">
<div style="float:left;width:200px"></div>
<div style="display:inline;float:right" id ="time"></div>
<div class="class1" style="display:inline">灌溉决策支持系统-实时监控数据如下：

</div><br>
<span>请选择</span>
<select id="location_zcd" onChange="getInfoByName()">
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

<div id="placeholder_zcd" style="float:center;width:600px;height:300px"></div>
</div> 
</center>
<script type="text/javascript">
$(function () {
    for (var i = 0; i < 30; i++)
        //d1.push([i, Math.sin(i)]);
        d1.push([i,i]);
              
    $.plot($("#placeholder_zcd"), 
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
<form action="citrusInfo"  method="post"><!-- 没有加Struts标签的时候,且过滤条件为/.action,此时必须加.action，且不支持namespace -->
<input type="submit" value="提交"/>
</form>
<input type="hidden" id = "shuju" value="0"/>
</center>
											</td>
										</tr>								
								</table>
							</blockquote>
						</div>
						<div class="textbox_btm"></div>
					</div>

					<div class="cl"></div>
				</div>
				<div class="jkfoot">
					<div class="fl">
						<img src="files_files/jishu.jpg">
					</div>

					<div class="jk_held fl">
						<dl>
							<dt>
								<a href="http://www.qycn.com/jk/jk_help.php" target="_blank">技术解释</a>
							</dt>
							<dd>
								<a
									href="http://www.qycn.com/jk/jk_help.php?hid=1&amp;htype=help"
									target="_blank">什么是站点监控？</a>
							</dd>
							<dd>
								<a
									href="http://www.qycn.com/jk/jk_help.php?hid=2&amp;htype=help"
									target="_blank">什么是HTTP监控？</a>
							</dd>
							<dd>
								<a
									href="http://www.qycn.com/jk/jk_help.php?hid=8&amp;htype=help"
									target="_blank">平均响应时间是如何计算的？</a>
							</dd>
							<dd>
								<a
									href="http://www.qycn.com/jk/jk_help.php?hid=9&amp;htype=help"
									target="_blank">什么是服务器性能监控？</a>
							</dd>
						</dl>
					</div>



					<div class="jk_held fl">
						<dl>
							<dt>
								<a
									href="http://www.qycn.com/jk/jk_help.php?hid=201&amp;htype=faq"
									target="_blank">疑问解答</a>
							</dt>
							<dd>
								<a
									href="http://www.qycn.com/jk/jk_help.php?hid=201&amp;htype=faq"
									target="_blank"> 群英监控系统是否要收费？</a>
							</dd>
							<dd>
								<a
									href="http://www.qycn.com/jk/jk_help.php?hid=203&amp;htype=faq"
									target="_blank">短信报警免费使用吗?</a>
							</dd>
							<dd>
								<a
									href="http://www.qycn.com/jk/jk_help.php?hid=204&amp;htype=faq"
									target="_blank">监控频率越快越好吗？</a>
							</dd>
							<dd>
								<a
									href="http://www.qycn.com/jk/jk_help.php?hid=209&amp;htype=faq"
									target="_blank">不需要添加代码就可以监控？</a>
							</dd>
						</dl>


						<div class="jk_held fl">
							<dl>
								<dt>
									<a href="http://www.qycn.com/news/" target="_blank">最新资讯</a>
								</dt>
								<dd>
									<a href="http://www.qycn.com/news/6918.html" title="各种宽带接入技术分析"
										target="_blank">各种宽带接入技术分析</a>
								</dd>
								<dd>
									<a href="http://www.qycn.com/news/6917.html"
										title="宽带光纤接入网的发展与技术选择" target="_blank">宽带光纤接入网的发展与技术选</a>
								</dd>
								<dd>
									<a href="http://www.qycn.com/news/6826.html"
										title="谈光纤到户技术所面临的考验" target="_blank">谈光纤到户技术所面临的考验</a>
								</dd>
								<dd>
									<a href="http://www.qycn.com/news/6825.html" title="光纤技术发展的特点"
										target="_blank">光纤技术发展的特点</a>
								</dd>
							</dl>
						</div>

					</div>
				</div>
				<div class="cl"></div>
			</div>
			<div id="foot">
				<a href="http://www.zggjc.cn" class="fc_6">中国柑橘城</a> |
				<a href="http://www.cric.cn" class="fc_6">中柑所在线</a>
				|
				<a href="http://www.qycn.com/about/index_10.html" class="fc_6">联系我们</a>
				|
				<a href="http://www.qycn.com/about/" class="fc_6">关于我们</a> |
				<a href="http://www.qycn.com/about/index_11.html" class="fc_6">支付方式</a>
				|
				<a href="http://www.qycn.com/about/index_9.html" class="fc_6">人才招聘</a>
				|
				<a href="http://www.qycn.com/help/" class="fc_6">帮助中心</a> |
				<a href="http://www.qycn.com/news/" class="fc_6" target="_blank">资讯中心</a>
				|
				<a href="http://www.qycn.com/wsxf/" class="fc_6">信访系统</a>
				&nbsp;&nbsp;2012 1007实验室 &copy;版权所有
				<br>
				增值电信业务经营许可证粤:
				<a href="http://www.qycn.com/about/index_5.html">B2-20030314
					粤ICP备09054660号-2 文网文[2009]248号 ISO9001国际标准质量体系认证 国家三级信息安会服务认证</a>


				<div id="foot_imgs">
					<a href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1752087209"
						target="_blank" rel="nofollow"><img
							src="files_files/xin30x30.gif" alt="群英企业信用评级证书" border="0"
							height="25" width="25">
					</a>
					<a
						href="http://210.76.65.188/webrecord/innernet/Welcome.jsp?bano=4409013013077"
						target="_blank" rel="nofollow"> <img alt="安网地址"
							src="files_files/waicon.gif" border="0" height="25" width="22">
					</a>
					<a href="http://210.76.65.188/newwebsite/main.jsp?id=4408"
						target="_blank" rel="nofollow"> <img alt="网警地址"
							src="files_files/wangjing.gif" border="0" height="25" width="22">
					</a>
					<a href="http://www.qycn.com/about/index_5.html"> <img
							src="files_files/img7.gif" alt="群英资质证书"> </a>
				</div>
			</div>
  </body>
  <!-- www.sxymorg.cn
       www.zggjc.cn
       www.cric.cn -->
 </html>
