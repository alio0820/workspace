<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- DTD文档类型定义，有的时候文档类型也会导致某些功能实现不了 -->
<html>
	<head>
		<title>劳动力资源信息化</title>
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
									人力资源管理信息化建设的策略
								</h3>

								<table border="0" cellpadding="2" cellspacing="2" width="100%" style="font:18px">
									<tbody>
										<tr>
											<td width="51%">
											    <p>	
												&nbsp;&nbsp;&nbsp;&nbsp;人力资源管理信息化建设的根本目标是推动传统人事管理向现代人力资源管理的战略转型，提高人力资源管理的效率，并跟上信息化的步伐，最终为长远发展奠定基础。为此，重点要落实好人力资源管理信息化建设“四步走”策略：	
												<br>&nbsp;&nbsp;&nbsp;&nbsp;建立基础数据平台，实现人力资源数据的信息化管理，建立基于内部网的人力资源管理门户，打造人力资源平台，为人们提供个性化的信息与查询服务。稳健踏出第一步可以带来公开、透明、及时、个性化的服务，获得领导以及职工的理解和信任。
												<br>&nbsp;&nbsp;&nbsp;&nbsp;实现人力资源管理业务的信息化，建立一个基本业务处理功能的人力资源管理系统。目标是提高人力资源管理的工作效率，为人力资源管理者争取更多的时间考虑人力资源管理水平提升的问题。这一阶段用户主要是人力资源管理者。
												<br>&nbsp;&nbsp;&nbsp;&nbsp;实现人力资源管理业务的现代化、规范化、流程化，建立以绩效管理为主要手段、以个人职业发展与能力管理为核心线索的人力资源管理体系，并利用因特网建立自助服务系统。这一阶段用户为领导层所有职工以及人力资源管理者，目的是实现全面的人力资源管理。
												<br>&nbsp;&nbsp;&nbsp;&nbsp;实现人力资源管理信息系统与其它信息系统的无缝整合，为管理提供以人为中心的准确全面及时有效的决策信息支持使人力资源部门成为管理的战略伙伴，最终实现人力资源管理的战略转型。
												<br>&nbsp;&nbsp;&nbsp;&nbsp;此外，人力资源管理信息化建设最终要落脚到设施和技术层面。构建全面完善的企业网和数据系统，将为人力资源管理信息化进程提供基础保障。这主要表现在以下方面：
												<br>&nbsp;&nbsp;&nbsp;&nbsp;企业网载体。企业网是利用先进的建筑综合布线技术构架起来的安全、可靠、便捷的计算机信息传输线路；利用成熟、领先的计算机网络技术规划计算机综合管理系统的网络应用环境；利用全面的企业网络管理软件、
												网络教学软件为企业提供教学、管理和决策三个不同层次所需要的数据、信息和知识的一个覆盖企业管理机构的基于Internet/Intranet技术的大型网络系统。人力资源管理系统所需要的人力资源信息除了人事部门掌握
												的关于职工的基本信息外，其它很大一部分都需要其他部门提供，同时人力资源管理部门又必须统计相关数据上报或传递给有关部门。此外，还有一些新信息掌握在职工自己手里。因此，基于企业网这一人力资源管理信息
												系统基础设施，人力资源管理部门可以与其它部门以及教职工进行必需而又相关的共享，人力资源管理信息系统的信息才能得到及时更新，其作用才能得以充分发挥。
												<br>&nbsp;&nbsp;&nbsp;&nbsp;数据库载体。人力资源管理部门要借助现代信息技术，做好内部各类人力资源信息的采集、存储、维护、更新等管理工作，搞好基础信息数据库建设。通过这些数据库管理系统，人力资源管理部门能建立一个信息丰富、系统的人力资源信息数据库，为人力资源管理信息化建设提供夯实的信息基石。
												<br>&nbsp;&nbsp;&nbsp;&nbsp;总之，人力资源管理信息化建设是一项随着人力资源管理发展而需要不断完善和改进的系统工程。因此，我们需要有充分的思想准备，并坚持不断创新，与时俱进，只有这样才能真正构建适于社会经济发展的人力资源管理信息化系统，最大限度地发挥出人力资源的潜能。
										        </p>
										    </td>
										    <td valign="top" width="347px">
												<img src="images/pz-yz01.jpg" border="0" width="347px">
												<br><br>
												<img src="images/pz-yz02.jpg" border="0" width="347px">
												<br><br>
												<img src="images/pz-yz03.jpg" border="0" width="347px">
												
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
</html>