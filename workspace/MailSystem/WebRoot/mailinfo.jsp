<%@ page language="java" import="java.util.*,com.mail.*,com.web.office.bean.*" pageEncoding="gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<%
	String currentpage_id = request.getParameter("id");
	String listNo = request.getParameter("listNo");
	int _i = currentpage_id.indexOf("_");
	int currentpage = Integer.parseInt(currentpage_id.substring(0, _i));
	int id = Integer.parseInt(currentpage_id.substring(_i + 1));
	MailInfoBean mailInfo = IMAPGetMail.getMailInfo(currentpage, id,
			session);
	String subject = mailInfo.getSubject();
	String preSubject = mailInfo.getPreSubject();
	String nextSubject = mailInfo.getNextSubject();
//	String size = mailInfo.getSize();
	String sentDate = mailInfo.getSentDate();
	//	String showDate = sentDate.substring(0,4)+"-"+sentDate.substring(5,7)+"-"+sentDate.substring(8,10);
	String[] receive = mailInfo.getReceive().split(",");
	String read = mailInfo.getRead();
//	String priority = mailInfo.getPriority();
	String[] from = mailInfo.getFrom().split("\"");
	//	System.out.println(from.length+"---------------");
	String send = from[1].trim();
	String address = from[2].trim().replace("<", "").replace(">", "");
//	String content = mailInfo.getContent();
//	String attachment = mailInfo.getAttachment();
//	int content_i = content.indexOf("<");
	//	System.out.println("+++++++++++++++");
%>
<header id="1365425820764_Header"
	class="frame-main-cont-head frame-main-cont-head-hasBorder nui-bg-light">
	<div id="_mail_toolbar_2_300"
		class="js-component-toolbar nui-toolbar ">
		<div class="nui-toolbar-item">
			<div id="_mail_button_return_<%=listNo%>"
				class="js-component-button nui-btn " tabindex="0"
				role="button">
				<span class="nui-btn-text"> <span
					style="font-family: simsun">&lt;&lt; </span> 返回 </span>
			</div>
		</div>
		<div class="nui-toolbar-item">
			<div id="_mail_button_56_302"
				class="js-component-button nui-imptBtn nui-btn " tabindex="0"
				role="button">
				<span class="nui-btn-text">回 复</span>
			</div>
			<div id="_mail_button_57_303"
				class="js-component-button nui-imptBtn nui-splitBtn nui-btn "
				role="button">
				<span class="nui-splitBtn-text" tabindex="0">回复全部</span>
				<span class="nui-splitBtn-split"></span>
				<span class="nui-splitBtn-arr" tabindex="0"> <b
					class="nui-ico nui-ico-dArr"></b> </span>
			</div>
			<div id="_mail_button_58_304"
				class="js-component-button nui-splitBtn nui-btn "
				role="button">
				<span class="nui-splitBtn-text" tabindex="0">转 发</span>
				<span class="nui-splitBtn-split"></span>
				<span class="nui-splitBtn-arr" tabindex="0"> <b
					class="nui-ico nui-ico-dArr"></b> </span>
			</div>
		</div>
		<div class="nui-toolbar-item">
			<div id="_mail_button_delete_<%=listNo%>"
				class="js-component-button nui-btn " tabindex="0"
				role="button">
				<span class="nui-btn-text">删 除</span>
				<input id ="currentpage_<%=listNo%>" type="hidden" value="<%=currentpage%>"/>
				<input id ="id_<%=listNo%>" type="hidden"" value="<%=id%>"/>
			</div>
			<div id="_mail_button_60_306"
				class="js-component-button nui-btn " tabindex="0"
				role="button">
				<span class="nui-btn-text">举 报</span>
			</div>
			<div id="_mail_button_61_307"
				class="js-component-button nui-dropdownBtn nui-btn "
				tabindex="0" role="button">
				<span class="nui-btn-text">标记为</span>
				<span class="nui-dropdownBtn-arr"> <b
					class="nui-ico nui-ico-dArr"></b> </span>
			</div>
			<div id="_mail_button_62_308"
				class="js-component-button nui-dropdownBtn nui-btn "
				tabindex="0" role="button">
				<span class="nui-btn-text">移动到</span>
				<span class="nui-dropdownBtn-arr"> <b
					class="nui-ico nui-ico-dArr"></b> </span>
			</div>
			<div id="_mail_button_63_309"
				class="js-component-button nui-dropdownBtn nui-btn "
				tabindex="0" role="button">
				<span class="nui-btn-text">更 多</span>
				<span class="nui-dropdownBtn-arr"> <b
					class="nui-ico nui-ico-dArr"></b> </span>
			</div>
		</div>
		<div class="nui-toolbar-ext">
			<div class="nui-toolbar-item">
				<div id="_mail_button_preEmail_<%=listNo%>"
					class="js-component-button nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon 
					<%=(preSubject.equals("") ? "nui-btn-disabled nui-roundBtn-disabled"
					: "")%>"
					tabindex="0" role="button" <%if (!preSubject.equals("")) {%>title="上一封：<%=preSubject%>"<%}%>>
					<span class="nui-btn-icon"> <b id="_mail_icon_40_311"
						class="js-component-icon nui-ico nui-ico-prev"></b> </span>
					<span class="nui-btn-text"></span>
				</div>
				<div id="_mail_button_nextEmail_<%=listNo%>"
					class="js-component-button nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon 
					<%=(nextSubject.equals("") ? "nui-btn-disabled nui-roundBtn-disabled"
					: "")%>"
					tabindex="0" role="button" <%if (!nextSubject.equals("")) {%>title="下一封：<%=nextSubject%>"<%}%>>
					<span class="nui-btn-icon"> <b id="_mail_icon_41_313"
						class="js-component-icon nui-ico nui-ico-next nui-ico-disabled"></b>
					</span>
					<span class="nui-btn-text"></span>
				</div>
				<div id="_mail_button_66_314"
					class="js-component-button nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon "
					title="快捷设置" tabindex="0" role="button">
					<span class="nui-btn-icon"> <b id="_mail_icon_42_315"
						class="js-component-icon nui-ico nui-ico-setting "></b> </span>
					<span class="nui-btn-text"></span>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="unRead" class="isRead" value="<%=read%>"/>
</header>
<div id="1365522058807_ScrollDiv"
	class="frame-main-cont-body nui-scroll frame-main-cont-body-second">
	<div class="qm">
		<div class="pk nui-bg-light" id="1365659820892_dvReadHeadInfo">
			<div class="ny">
				<h1 hidefocus="hidefocus" title="邮件标题" tabindex="0"
					class="nui-fIBlock lv" id="mailInfo_Subject">
					<%=subject%>
				</h1>
				<div class="nui-fIBlock jE" id="1365659820892_divTag"></div>
				<div role="toolbar" class="nui-fIBlock lj">
					<a hidefocus="hidefocus"
						class="js-component-link gD nui-fIBlock ho"
						href="javascript:void(0)" id="_mail_link_15_316"
						title="邮件标签"><b
						class="js-component-icon nui-ico nui-ico-dArr  "
						id="_mail_icon_43_317"></b> </a><a hidefocus="hidefocus"
						class="js-component-link gD gE" href="javascript:void(0)"
						id="_mail_link_16_318" title="设为红旗"><b
						class="js-component-icon nui-ico nui-ico-blankFlag  "
						id="_mail_icon_44_319">E</b> </a><a hidefocus="hidefocus"
						class="js-component-link gD dT" href="javascript:void(0)"
						id="_mail_link_17_320" title="加为日程"><b
						class="js-component-icon nui-ico nui-ico-editSchedule  "
						id="_mail_icon_45_321">c</b> </a><a hidefocus="hidefocus"
						class="js-component-link gD fc" href="javascript:void(0)"
						id="_mail_link_18_322" title="邮件备注"><b
						class="js-component-icon nui-ico nui-ico-editRemark  "
						id="_mail_icon_46_323">a</b> </a><a hidefocus="hidefocus"
						class="js-component-link gD fM" href="javascript:void(0)"
						id="_mail_link_19_324" title="打印"><b
						class="js-component-icon nui-ico nui-ico-print  "
						id="_mail_icon_47_325">b</b> </a><a hidefocus="hidefocus"
						class="js-component-link gD sK" href="javascript:void(0)"
						id="_mail_link_14_159" title="保存到有道云笔记"><b
						class="js-component-icon fn-bg nui-ico nui-ico-yunnote  "
						id="_mail_icon_30_160"></b> </a>
				</div>
			</div>
			<div class="kz">
				<ul style="display: none" id="ulCompact">
					<li class="fS rK">
						<div class="fU">
							<strong class="nui-txt-suc"><%=send%></strong>&nbsp;于
							<%=sentDate%>发给 我。&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					</li>
				</ul>
				<ul id="ulFull">
					<li class="fS dj">
						<div class="fT">
							发件人：
						</div>
						<div class="fU">
							<div class="js-component-addr nui-addr nui-addr-hasAdd  "
								id="_mail_addr_0_326">
								<span class="nui-addr-name"><%=send%></span><span
									class="nui-addr-email">&lt;<%=address%>&gt;</span><a
									hidefocus="hidefocus"
									class="nui-addr-add js-component-link "
									href="javascript:void(0)" id="_mail_link_20_327">+</a>
							</div>
						</div>
					</li>
					<li class="fS dZ" id="1365659820892_liReadOutto">
						<div class="fT">
							收件人：
						</div>
						<div class="fU" id="1365659820892_dvReadto">
							<%
								for (int i = 0; i < receive.length; i++) {
									String[] name_email = receive[i].split("#");
									//									System.out.print(receive[i]+" | "+name_email.length);
									String name = name_email[0].trim();
									String email = name_email[1].trim();
							%>
							<div class="js-component-addr nui-addr nui-addr-hasAdd  "
								id="_mail_addr_1_363">
								<span class="nui-addr-name"><%=name%></span>
								<span class="nui-addr-email">&lt;<%=email%>&gt;</span>
								<a hidefocus="hidefocus" class="nui-addr-add js-component-link " href="javascript:void(0)" id="_mail_link_26_364">+</a>
							</div>
							<%
								}
							%>
						</div>
					</li>
					<li style="display: none" class="fS dZ"
						id="1365659820892_liReadOutcc">
						<div class="fT">
							抄送人：
						</div>
						<div class="fU" id="1365659820892_dvReadcc">
							(无)
						</div>
					</li>
					<li class="fS dk" id="liTime">
						<div class="fT">
							时&nbsp;&nbsp;&nbsp;间：
						</div>
						<div class="fU">
							<%=sentDate%>
						</div>
					</li>
					
					<li style="display: none" class="fS cS"
						id="1365659820892_liMemo">
						<div class="fT">
							备&nbsp;&nbsp;&nbsp;注：
						</div>
						<div class="fU" id="1365659820892_dvMemoShow">
							<div class="bI" id="1365659820892_dvMemoContent"></div>
							<div class="bA">
								<a hidefocus="hidefocus"
									class="js-component-link bb nui-txt-link"
									href="javascript:void(0)" id="_mail_link_21_330">编辑</a><a
									hidefocus="hidefocus"
									class="js-component-link bb nui-txt-link"
									href="javascript:void(0)" id="_mail_link_22_331">删除</a>
							</div>
						</div>
						<div style="display: none" class="fU"
							id="1365659820892_dvMemoEdit">
							<div
								class="js-component-input bz nui-multiLineIpt nui-ipt "
								id="_mail_input_1_332">
								<textarea class="nui-ipt-input F"></textarea>
							</div>
							<div class="bA">
								<span class="bg" id="1365659820892_spanMemoErr"></span>
								<div class="js-component-button bf nui-mainBtn nui-btn "
									tabindex="0" role="button" id="_mail_button_67_328">
									<span class="nui-btn-text">确定</span>
								</div>
								<div class="js-component-button bf nui-btn " tabindex="0"
									role="button" id="_mail_button_68_329">
									<span class="nui-btn-text">取消</span>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="lh">
				<a hidefocus="hidefocus"
					class="js-component-link nui-txt-link"
					href="javascript:void(0)" id="_mail_link_23_333">精简信息
					<b class="nui-ico hp">k</b> </a>
				<a
					hidefocus="hidefocus" class="js-component-link nui-txt-link"
					href="javascript:void(0)" id="_mail_link_24_334" style="display: none">完整信息
					<b class="nui-ico hp">j</b></a>
			</div>
		</div>
		<div class="nui-split nui-split-cDark pl jL"></div>
		<div id="1365659820892_dvPopup"></div>
		<div class="ko">
			<div class="nui-fClear pm" id="1370833857127_dvContent">
				<iframe frameborder="0" style="min-height:220px;width:100%;"
					src='mailinfocontent.jsp?currentpage=<%=currentpage%>&id=<%=id%>'
					class="kA" name="read.ReadModule_2" id="ifrmContent">
				</iframe>
			</div>
		</div>
		<div class="pf nui-bg-light nui-bdr-light"
			id="_dvAttach_reply" style="">
			<div id="_dvReply" class="pe">
				<div class="nv" id="mailInfo_dvReplyInputs">
					<div class="js-component-input kq nui-multiLineIpt nui-ipt "
						id="_mail_input_2_365"
						aria-label="快捷回复给：<%=send%>（按Ctrl+Enter键发送）">
						<label class="nui-ipt-placeholder">
							快捷回复给：<%=send%>
						</label>
						<textarea title="快捷回复给：<%=send%>（按Ctrl+Enter键发送）"
							class="nui-ipt-input"></textarea>
					</div>
				</div>
				<div style="display: none" class="ns" id="_dvReplyBts">
					<div class="jH" id="1366122439993_fullReplyLink">
						<div class="fN">
							<a hidefocus="hidefocus" class="js-component-link nui-txt-link"
								href="javascript:void(0)" id="_mail_link_87_533">完整模式回复</a>
						</div>
					</div>
					<div class="js-component-button nui-mainBtn nui-btn " tabindex="0"
						role="button" id="_mail_button_211_876">
						<span class="nui-btn-text">&nbsp;&nbsp;发&nbsp;送&nbsp;&nbsp;</span>
					</div>
					<span id="1366122439993_spanReplyNbsp">&nbsp;&nbsp;<span></span>
					</span>
					<div class="js-component-button nui-btn " tabindex="0"
						role="button" id="_mail_button_212_877">
						<span class="nui-btn-text">&nbsp;&nbsp;取&nbsp;消&nbsp;&nbsp;</span>
					</div>
				</div>
			</div>
		</div>
		<div class="pz" id="1365663385374_dvReadZoom">
			<div style="display: none;" class="mW nw"
				id="1365663385374_backToTop">
				<div title="返回顶部"
					class="js-component-button lo nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
					tabindex="-1" role="button" id="_mail_button_15_168">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico nui-ico-backToTop  "
						id="_mail_icon_30_169"></b> </span><span class="nui-btn-text"></span>
				</div>
			</div>
			<div class="mW rH">
				<div title="使用最佳阅读模式"
					class="js-component-button rI nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
					tabindex="-1" role="button" id="_mail_button_16_170">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico-readMod-default nui-ico "
						id="_mail_icon_31_171"></b> </span><span class="nui-btn-text"></span>
				</div>
				<div title="使用默认阅读模式"
					class="js-component-button rI nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
					tabindex="-1" role="button" id="_mail_button_17_172"
					style="display: none">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico-readMod nui-ico "
						id="_mail_icon_32_173"></b> </span><span class="nui-btn-text"></span>
				</div>
			</div>
			<div class="mW jN" id="1365663385374_showZoomBt">
				<div title="展开缩放工具"
					class="js-component-button kr nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
					tabindex="-1" role="button" id="_mail_button_18_174">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico nui-ico-zoomIn  "
						id="_mail_icon_33_175"></b> </span><span class="nui-btn-text"></span>
				</div>
			</div>
			<div style="display: none;" class="mW ky"
				id="1365663385374_zoomBts">
				<div title="放大显示正文文字"
					class="js-component-button ip nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
					tabindex="-1" role="button" id="_mail_button_19_176">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico nui-ico-bigPlus  "
						id="_mail_icon_34_177"></b> </span><span class="nui-btn-text"></span>
				</div>
				<div title="还原显示正文文字"
					class="js-component-button jJ nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
					tabindex="-1" role="button" id="_mail_button_20_178">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico nui-ico-original  "
						id="_mail_icon_35_179"></b> </span><span class="nui-btn-text"></span>
				</div>
				<div title="缩小显示正文文字"
					class="js-component-button hs nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
					tabindex="-1" role="button" id="_mail_button_21_180">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico nui-ico-bigMinus  "
						id="_mail_icon_36_181"></b> </span><span class="nui-btn-text"></span>
				</div>
				<div title="隐藏缩放工具"
					class="js-component-button jK nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
					tabindex="-1" role="button" id="_mail_button_22_182">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico nui-ico-bigClose  "
						id="_mail_icon_37_183"></b> </span><span class="nui-btn-text"></span>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="frame-main-cont-body-mask"></div>