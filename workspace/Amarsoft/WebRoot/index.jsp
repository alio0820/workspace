<%@ page language="java" import="java.util.*,com.common.*,com.order.action.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBliC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>Amarsoft综合服务平台</title>
		<link rel="icon" href="images/fruit.ico" type="image/x-icon"/>
		<meta content="MSHTML 6.00.6000.16825" name=GENERATOR>
		<meta HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
		<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<meta name="robots" content="all">
		<meta name="author" content="author cdzhai">
		<liNK media=all href="css/stunicholls.css" type=text/css rel=stylesheet>
        <liNK media=all href="css/pro_left_right.css" type=text/css rel=stylesheet>
		<link href="css/main.css" rel="stylesheet" type="text/css">
		<link href="css/font.css" rel="stylesheet" type="text/css">
		<link href="css/layout.css" rel="stylesheet" type="text/css">
		<link href="css/jkstyle.css" rel="stylesheet" type="text/css">
		<link href="css/style.css" rel="stylesheet" type="text/css">		
		<link href="css/css.css" rel="stylesheet" type="text/css" />
		<link href="css/order.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.7.1.js"></script>       
	    <script src="js/jquery.jcarousel.pack.js"></script>
	    <script src="js/jquery.slide.js"></script>
	    <script src="js/jquery-func.js"></script>
	    <script src="js/lhgdialog/lhgdialog.min.js"></script>
    	<script src="dwr/engine.js"></script>
		<script src="dwr/util.js"></script>
		<script src="dwr/interface/OrderAction.js"></script>
	    <script src="js/order.js"></script>
	    <%
	    	UserBean user = (UserBean)session.getAttribute("userBean");
	    	String userId = user==null?"":user.getUserId();
	    	String roleId = user==null?"":user.getRoleId();
	    %>
	</head>
	<body>
		<div id=pro_linedrop_copy></div>	
		<div id="top2" style="width:100%"><!-- 第三层-顶层图片show -->
			<div style="z-index:99;margin-left:20px;witdh:630px;height:90px"><img src="images/logo2.png"/></div>
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
				            <li class="last"><a href="#">Contact</a></li>
			            </ul>
		            </div>
	            </div>
	             End Header -->
				<div id="header"></div>
	            <!-- Slider -->
	            <div id="slider" style="z-index:100">
		            <div id="slider-holder">
			            <ul>
			            	<li><a href="javascript:void(0)"><img src="images/agricultural_5_.png" alt="" /></a></li>
			            	<li><a href="javascript:void(0)"><img src="images/agricultural_2_.png" alt="" /></a></li>
			                <li><a href="index.jsp"><img src="images/agricultural_1_.png" alt="" /></a></li>
			                <li><a href="javascript:void(0)"><img src="images/agricultural_3_.png" alt="" /></a></li>
			                <li><a href="javascript:void(0)"><img src="images/agricultural_4_.png" alt="" /></a></li>
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
		<div id=pro_linedrop><!-- 第四层-菜单栏 -->
		<ul class=select>
			<li><a href="index.jsp"><b>主页</b></a></li>
		  	<li class=line>
		  		<a href="index.jsp"><b>套餐预订</b></a>
		  		<ul class=sub>	 
		    		<li><a href="index.jsp">在线订购</a></li>
					<li><a href="javascript:void(0)">套餐总值</a></li>
					<li><a href="javascript:void(0)">餐饮礼仪</a></li>
				</ul>
		   	</li> 
		   	<%/*<li class=line>
		   		<a href="gj-sf.action"><b>餐饮礼仪</b></a>
		  		<ul class=sub>	 
		    		<li><a href="gj-sf.action">施肥决策支持系统</a></li>
		    		<li><a href="jsp/gj-gg.jsp">灌溉决策支持系统</a></li>
		    		<li><a href="gj-bch.action">病虫害防治与预警</a></li>
		    		<li><a href="gj-ldl.action">劳动力资源与信息化</a></li>
		  		</ul>
		   </li>*/%>
		  	<li>
		  		<a href="javascript:void(0)"><b>吃的那点事儿</b></a>
			</li> 
			<li>
		  		<a href="javascript:void(0)"><b>你我共享</b></a>
		 	</li>
		   	<li>
		  		<a href="javascript:void(0)"><b>Amarsoft贴吧</b></a>
		 	</li>
		  	
		</ul>   
		</div>
		<br><br>
    	<div id="doc">
    	<div class="jk_box" style='border-radius:5px 5px 0 0px'>
			<div class="jk_main"><!-- 第五层-Main页面-->
				<div class="jk_fuc fl"><!--左侧页面-->
					<div class="fuc_top"></div>
					<div class="fuc_m">
						<dl>
							<dt><a href="index.jsp"><img src="images/ico_0.gif" border="0"></a></dt>
							<dd><h3><a href="index.jsp">超值套餐</a></h3>
								<p><a href="index.jsp">优质的生活源于精致的选择（更新中...）</a></p>
							</dd>
						</dl>
						<dl>
							<dt><a href="javascript:void(0)"><img	src="images/ico_6.gif" border="0"></a></dt>
							<dd><h3><a href="javascript:void(0)">餐饮礼仪</a></h3>
								<p><a href="javascript:void(0)">苏格兰威士忌，懂得喝不会醉</a></p>
							</dd>
						</dl>
						<dl>
							<dt><a href="javascript:void(0)"><img	src="images/ico_2.jpg" border="0"></a></dt>
							<dd>
								<h3><a href="javascript:void(0)">吃的那点事儿</a></h3>
								<p><a href="javascript:void(0)">人生成功的一部分秘诀是，吃下爱吃的东西，然后让食物在肚子里斗争到底。——马克·吐温</a></p>
							</dd>
						</dl>
						<dl>
							<dt><a href="javascript:void(0)"><img	src="images/ico_3.jpg" border="0"></a></dt>
							<dd>
								<h3><a href="javascript:void(0)">Amarsoft贴吧</a></h3>
								<p><a href="javascript:void(0)">还记得街灯照出一脸淡黄 没忘记内心点点忧伤 你的心事 有我倾听</a></p>
							</dd>
						</dl>
						<dl>
							<dt><a href="javascript:void(0)"><img src="images/ico_1.jpg" border="0"></a></dt>
							<dd>
								<h3><a href="javascript:void(0)">你我共享</a></h3>
								<p><a href="javascript:void(0)">汇聚大家的智慧，影响每一个人</a></p>
							</dd>
						</dl>
						<dl>
							<dt><a href="javascript:void(0)"><img src="images/ico_4.jpg" border="0"></a></dt>
							<dd>
								<h3><a href="javascript:void(0)">网站数据报告</a></h3>
								<p><a href="javascript:void(0)">对网站数据进行定期分析并发送报告邮件</a></p>
							</dd>
						</dl>
					</div>
					<div class="fuc_btm"></div>
				</div>
				<div class="textbox fr"><!-- 右侧页面-->
					<div class="textbox_top"></div>
					<div class="textbox_m" style="min-height:710px;width:648px;_height:710px;position:relative;">
						<div style='position:relative;height:100%'>
							<h3>关注餐饮品质，关注生活品质</h3>
							<div class="left s-pk-col">
								<div data-pkid="15" class="s-pk-mod" id="wt_inst_2" style="transition:none 0s ease 0s;">
									<h5 class="pk-title">
										<span><%=userId%>-您的订单</span><span id='userId' style='display:none'><%=userId%></span>
										<span class="pk-title-tab pk-title-tab-0">
											<div class="c-repeater" id="cs_c_1">
												<a data-pos="0" class="tab-0 tab-a" onclick="return false;" href="javascript:;">今日|</a>												
												<a data-pos="1" class="tab-1 tab-a" onclick="return false;" href="javascript:;">明日|</a>
												<a data-pos="2" class="tab-2 tab-a" onclick="return false;" href="javascript:;">本周|</a>
											</div>
										</span>
										<a title="隐藏" class="s-mod-close-view pk-close" onclick="return false;" href="#"></a>
										<div class="s-title-bg"></div>
									</h5>
									<div class="pk-content">
										<div class="s-pk-xingzuo">
											<div class="xingzuo-content">
											<% 
												OrderAction oa = new OrderAction();
												OrderBean ob = oa.getOrderDetail(userId);
												int price = ob==null?-1:ob.getOrderPrice();
												int addRice = ob==null?-1:ob.getAddRice();
												int confirm = ob==null?-1:ob.getConfirm();
											%>
												<p class="xingzuo-row radio">
													<label>&nbsp;&nbsp;8元套餐：</label>
													<span class="xingzuo-col">
														<input type="radio" name='foodType' <%if(price==8){%>checked="true"<%}%> value='8'/>
													</span>
													<label style="margin-left: 33px;display:none">大小荤两素</label>
													<span class="xingzuo-col"><span class="xingzuo-star"><span class="xingzuo-starlt star-3"></span></span></span>
												</p>
												<p class="xingzuo-row radio">
													<label>10元套餐：</label>
													<span class="xingzuo-col">
														<input type="radio" name='foodType' <%if(price==10){%>checked="true"<%}%> value='10'/>
													</span>
													<label style="margin-left: 33px;display:none">两大荤两素</label>
													<span class="xingzuo-col"><span class="xingzuo-star"><span class="xingzuo-starlt star-4"></span></span></span>
												</p>
												<p class="xingzuo-row radio">
													<label>12元套餐：</label>
													<span class="xingzuo-col">
														<input type="radio" name='foodType' <%if(price==12){%>checked="true"<%}%> value='12'/>
													</span>
													<label style="margin-left: 33px;display:none">三大荤两素</label><span class="xingzuo-col"></span>
												</p>
												<p class="xingzuo-row check">
													<label>&nbsp;是否加饭：</label>
													<span class="xingzuo-col">
														<input type="checkbox" name='isAddRice' <%if(addRice==1){%> checked="true" <%}%>/>
													</span>
													<label style="margin-left: 33px;"></label><span class="xingzuo-col"></span>
												</p>
												<div class="xingzuo-block">
													<label>&nbsp;温馨提示：<br/></label>
													<span>
														<span class="xingzuo-summary">提交订单后，请到小组长处进行付款确认...</span>
														<a href="javascript:void(0)">详情&gt;&gt;</a>
													</span>
												</div>
											</div>
										</div>
										<div class="pk-source">
											<span id='orderSuccess' class='orderStatus' style='color:#5FB44C;display:none'>订购成功&nbsp;&nbsp;</span>
											<span id='orderAlready' class='orderStatus' style='color:#5FB44C;<%if(confirm==-1){%>display:none<%}%>'>您已经订购&nbsp;&nbsp;</span>
											<span id='orderCancel' class='orderStatus' style='color:#5FB44C;display:none'>订购已取消&nbsp;&nbsp;</span>
											<span id='orderFailure' class='orderStatus' style='color:red;display:none'>订购失败&nbsp;&nbsp;</span>
											<span>查看更多：</span>
											<a href="javascript:void(0)">全部订单</a>
										</div>
										<div class="pk-submit">
											<span id='buttonSubmit' class="nui-btn-text" <%if(confirm!=-1){%>style='display:none'<%}%>>提交</span>
											<span id='buttonCancel' class="nui-btn-text" <%if(confirm==-1){%>style='display:none'<%}%>>取消订购</span>
										</div>
									</div>
								</div>
							</div>
							<%if(roleId.equals("2")){%>
							<div class="left s-pk-col">
								<div data-pkid="15" class="s-pk-mod" id="wt_inst_2" style="transition: none 0s ease 0s;">
									<h5 class="pk-title">
										<span><%=userId%>-小组订单</span><span id='userId' style='display:none'><%=userId%></span>
										<span class="pk-title-tab pk-title-tab-0">
											<div class="c-repeater" id="cs_c_1">
												<a data-pos="0" class="tab-0 tab-a" onclick="return false;" href="javascript:;">今日|</a>												
												<a data-pos="1" class="tab-1 tab-a" onclick="return false;" href="javascript:;">明日|</a>
												<a data-pos="2" class="tab-2 tab-a" onclick="return false;" href="javascript:;">本周|</a>
											</div>
										</span>
										<a hidefocus="" title="隐藏" class="s-mod-close-view pk-close" onclick="return false;" href="#"></a>
										<div class="s-title-bg"></div>
									</h5>
									<div class="pk-content">
										<div class="s-pk-xingzuo">
											<div class="xingzuo-content group">
											<% 
												ArrayList<OrderBean> list = oa.getMember(userId);
												int size = list.size();
												for(int i=0;i<size;i++){
													OrderBean member = list.get(i);
													if(i%2==0) out.println("<p class='xingzuo-row confirm'>");
											%>
													<span class='member' <%if(member.getAddRice()==1){%> title='加饭'<%}%>>
														<label style='margin-left:10px;'>&nbsp;<%=member.getUserName()%>&nbsp;</label>
														<span class="xingzuo-col">
															<label style='margin-left:0'><%=member.getOrderPrice()%>元套餐</label>
															<input type="checkbox" style='margin-top:2px;'
															<%if(member.getConfirm()==1){%>checked="true"<%}%>
															 name='<%=member.getUserId()%>' value='8'/>
															<label class='confirm_label' style='color:
															<%if(member.getConfirm()==1){%>#5FB44C;<%}else{%>#999999;<%}%>'>
															<%=member.getConfirm()==1?"已":"未" %>确认</label>
														</span>
													</span>
												<%if(i%2==1||i+1==size) out.println("</p>");} %>
												<div class="xingzuo-block">
													<label>&nbsp;温馨提示：<br/></label>
													<span>
														<span class="xingzuo-summary">确认订单后，请到伙夫长处进行付款确认...</span>
														<a href="javascript:void(0)">详情&gt;&gt;</a>
													</span>
												</div>
											</div>
										</div>
										<div class="pk-source"><span>操作指引：勾选多选框进行确认</span></div>										
									</div>
								</div>
							</div>
							<%}%>
							<%if(roleId.equals("2")){%>
							<div class="left s-pk-col">
								<div data-pkid="15" class="s-pk-mod" id="wt_inst_2" style="transition: none 0s ease 0s;">
									<h5 class="pk-title">
										<span>订单总计</span><span id='userId' style='display:none'><%=userId%></span>
										<span class="pk-title-tab pk-title-tab-0">
											<div class="c-repeater" id="cs_c_1">
												<a data-pos="0" class="tab-0 tab-a" onclick="return false;" href="javascript:;">今日|</a>												
												<a data-pos="1" class="tab-1 tab-a" onclick="return false;" href="javascript:;">明日|</a>
												<a data-pos="2" class="tab-2 tab-a" onclick="return false;" href="javascript:;">本周|</a>
											</div>
										</span>
										<a hidefocus="" title="隐藏" class="s-mod-close-view pk-close" onclick="return false;" href="#"></a>
										<div class="s-title-bg"></div>
									</h5>
									<div class="pk-content">
										<div class="s-pk-xingzuo">
											<div class="xingzuo-content group">
												<table class="total" cellspacing="0" cellpadding="0">
													<tr>
														<td style=''>分组</td>
														<td style=''>伙夫</td>
														<td style=''>Meal</td>
														<td style=''>8元</td>
														<td style=''>10元</td>
														<td style=''>12元</td>
														<td style=''>额外添饭</td>
														<td style=''>人数</td>
														<td style=''>总计</td>
													</tr>
												<% 
													ArrayList<OrderTotalBean> list = oa.getOrderTotalDetail(0);
													int size = list.size();
													for(int i=0;i<size;i++){
														OrderTotalBean groupOrder = list.get(i);										
												%>
													<tr>
														<td style=''><%=groupOrder.getGroupId()%></td>
														<td style=''><%=groupOrder.getGroupLeaderName()%></td>
														<td style=''><%=groupOrder.getOrderTime()%></td>
														<td style=''><%=groupOrder.getPrice_8()%></td>
														<td style=''><%=groupOrder.getPrice_10()%></td>
														<td style=''><%=groupOrder.getPrice_12()%></td>
														<td style=''><%=groupOrder.getAddRiceNum()%></td>
														<td style=''><%=groupOrder.getNum()%></td>
														<td style=''><%=groupOrder.getTotal()%></td>
													</tr>
													<%}%>
												</table>
												<div class="xingzuo-block">
													<label>&nbsp;温馨提示：<br/></label>
													<span>
														<span class="xingzuo-summary">确认订单后，请到伙夫长处进行付款确认...</span>
														<a href="javascript:void(0)">详情&gt;&gt;</a>
													</span>
												</div>
											</div>
										</div>
										<div class="pk-source"><span>操作指引：勾选多选框进行确认</span></div>										
									</div>
								</div>
							</div>
							<%}%>			
						</div>
					</div>
					<div class="textbox_btm"></div>
				</div>
			</div>			
			<div class="cl"></div>
			<div class="jkfoot"><!-- Main页面-下侧页面 -->
				<div class="fl"><img src="images/jishu.jpg"></div>
				<div class="jk_held fl">
					<dl>
						<dt><a href="http://www.qycn.com/jk/jk_help.php" target="_blank">技术解释</a></dt>
						<dd><a href="http://www.qycn.com/jk/jk_help.php?hid=1&amp;htype=help" target="_blank">什么是站点监控？</a></dd>
						<dd><a href="http://www.qycn.com/jk/jk_help.php?hid=2&amp;htype=help" target="_blank">什么是HTTP监控？</a></dd>
						<dd><a href="http://www.qycn.com/jk/jk_help.php?hid=8&amp;htype=help" target="_blank">平均响应时间是如何计算的？</a></dd>
						<dd><a href="http://www.qycn.com/jk/jk_help.php?hid=9&amp;htype=help" target="_blank">什么是服务器性能监控？</a></dd>
					</dl>
				</div>
				<div class="jk_held fl">
					<dl>
						<dt><a href="http://www.qycn.com/jk/jk_help.php?hid=201&amp;htype=faq" target="_blank">疑问解答</a></dt>
						<dd><a href="http://www.qycn.com/jk/jk_help.php?hid=201&amp;htype=faq" target="_blank"> 群英监控系统是否要收费？</a></dd>
						<dd><a href="http://www.qycn.com/jk/jk_help.php?hid=203&amp;htype=faq" target="_blank">短信报警免费使用吗?</a></dd>
						<dd><a href="http://www.qycn.com/jk/jk_help.php?hid=204&amp;htype=faq" target="_blank">监控频率越快越好吗？</a></dd>
						<dd><a href="http://www.qycn.com/jk/jk_help.php?hid=209&amp;htype=faq" target="_blank">不需要添加代码就可以监控？</a></dd>
					</dl>
				</div>
				<div class="jk_held fl">
					<dl>
						<dt>
							<a href="http://www.qycn.com/news/" target="_blank">最新资讯</a>
						</dt>
						<dd>
							<a href="http://www.qycn.com/news/6918.html" title="各种宽带接入技术分析" target="_blank">各种宽带接入技术分析</a>
						</dd>
						<dd>
							<a href="http://www.qycn.com/news/6917.html"
								title="宽带光纤接入网的发展与技术选择" target="_blank">宽带光纤接入网的发展与技术选择</a>
						</dd>
						<dd>
							<a href="http://www.qycn.com/news/6826.html"
								title="谈光纤到户技术所面临的考验" target="_blank">谈光纤到户技术所面临的考验</a>
						</dd>
						<dd>
							<a href="http://www.qycn.com/news/6825.html" title="光纤技术发展的特点" target="_blank">光纤技术发展的特点</a>
						</dd>
					</dl>
				</div>
			</div>
			<div class="cl"></div>
		</div>
		</div>
		<div id="foot">
			<a href="javascript:void(0)" class="fc_6">中国柑橘城</a>|
			<a href="javascript:void(0)" class="fc_6">中柑所在线</a>|
			<a href="javascript:void(0)" class="fc_6">联系我们</a>|
			<a href="javascript:void(0)" class="fc_6">关于我们</a> |
			<a href="javascript:void(0)" class="fc_6">支付方式</a>|
			<a href="javascript:void(0)" class="fc_6">人才招聘</a>|
			<a href="javascript:void(0)" class="fc_6">帮助中心</a> |
			<a href="javascript:void(0)" class="fc_6" target="_blank">资讯中心</a>|
			<a href="javascript:void(0)" class="fc_6">信访系统</a>
			&nbsp;&nbsp;Copyright &copy; 2013 Amarsoft all rights reserved<br>
			增值安硕业务经营许可证粤:
			<a href="javascript:void(0)">
				B1-20130719 粤ICP备09034880号-2 文网文[2012]78号 ISO9001国际标准质量体系认证 国家三级信息安会服务认证
			</a>
			<div id="foot_imgs">
				<a href="javascript:void(0)" target="_blank" rel="nofollow">
					<img src="images/xin30x30.gif" alt="安硕信息企业信用评级证书" border="0" height="25" width="25">
				</a>
				<a href="javascript:void(0)" target="_blank" rel="nofollow"> 
					<img alt="安网地址" src="images/waicon.gif" border="0" height="25" width="22">
				</a>
				<a href="javascript:void(0)" target="_blank" rel="nofollow">
					<img alt="网警地址" src="images/wangjing.gif" border="0" height="25" width="22">
				</a>
				<a href="javascript:void(0)">
					<img src="images/img7.gif" alt="安硕资质证书">
				</a>
			</div>
		</div>
	</body>
</html>
