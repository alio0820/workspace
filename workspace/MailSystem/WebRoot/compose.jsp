<%@ page language="java" import="java.util.*,com.mail.*,com.web.office.bean.*" pageEncoding="gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">

<%
%>
<div id="_dvModuleContainer_compose_ComposeModule_0">
	<header
		class="frame-main-cont-head frame-main-cont-head-hasBorder nui-bg-light nui-bdr-light"
		id="divComposeToolbar">
	<div class="js-component-toolbar nui-toolbar " id="_mail_toolbar_3_332">
		<div class="nui-toolbar-item">
			<div class="js-component-button nui-mainBtn nui-btn " tabindex="2"
				role="button" id="_mail_button_60_333">
				<span class="nui-btn-text">&nbsp;发 送&nbsp;</span>
			</div>
		</div>
		<div class="nui-toolbar-item">
			<div class="js-component-button nui-btn " tabindex="2" role="button"
				id="_mail_button_61_334">
				<span class="nui-btn-text">存草稿</span>
			</div>
		</div>
		<div class="nui-toolbar-item">
			<div class="js-component-button nui-btn " tabindex="2" role="button"
				id="_mail_button_62_335">
				<span class="nui-btn-text">预 览</span>
			</div>
		</div>
		<div class="nui-toolbar-item">
			<div class="js-component-button nui-btn " tabindex="2" role="button"
				id="_mail_button_63_336">
				<span class="nui-btn-text">取 消</span>
			</div>
		</div>
		<div class="nui-toolbar-ext">
			<div style="display: none" class="nui-toolbar-item">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link"
					href="javascript:void(0)" id="_mail_link_43_337" tabindex="2">商务模板</a>
			</div>
			<div style="display: none" class="nui-toolbar-item">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link"
					href="javascript:void(0)" id="_mail_link_44_338" tabindex="2">贺卡</a>
			</div>
			<div style="display: none" class="nui-toolbar-item">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link"
					href="javascript:void(0)" id="_mail_link_45_339" tabindex="2">明信片</a>
			</div>
			<div class="nui-toolbar-item">
				<div title="新窗口写信"
					class="js-component-button nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
					tabindex="2" role="button" id="_mail_button_64_340">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico nui-ico-newWin  "
						id="_mail_icon_66_341">L</b>
					</span><span class="nui-btn-text"></span>
				</div>
			</div>
			<div class="nui-toolbar-item">
				<div title="写信设置"
					class="js-component-button nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
					tabindex="2" role="button" id="_mail_button_65_342">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico nui-ico-setting  "
						id="_mail_icon_67_343"></b>
					</span><span class="nui-btn-text"></span>
				</div>
			</div>
		</div>
	</div>
	<div style="display: none" class="EFT-wrapper" id="divComposeScene"></div>
	</header>
	<div class="frame-main-cont-body nui-scroll" id="divComposeScroll">
		<div class="qt nui-bg-light" id="divComposeMain">
			<section class="oZ">
			<a title="隐藏通讯录" class="fC" href="javascript:void(0)"
				id="aComposeSwitch"><span class="dr"><b
					class="nui-ico nui-ico-rArr"></b>
			</span>
			</a>
			<header class="ku">
			<div class="fA ck">
				<label class="cH">
					发件人
				</label>
				<div>
					<a hidefocus="hidefocus" class="js-component-link nui-txt-link bm"
						href="javascript:void(0)" id="_mail_link_51_369"
						title="发件人地址，点击可以设置发件人" tabindex="2"><span class="bn">wangjiuyingzui&nbsp;</span><span
						class="re">&lt;wangjiuyingzui@163.com&gt;</span> <b
						class="nui-ico nui-ico-dArr">d</b>
					</a>
					<div class="bh class nui-bg-light">
						<a hidefocus="hidefocus"
							class="js-component-link bW  nui-txt-link"
							href="javascript:void(0)" id="_mail_link_52_370"
							title="同时将这封邮件发给其他联系人" tabindex="2">添加抄送</a><a
							hidefocus="hidefocus" class="js-component-link bW  nui-txt-link"
							href="javascript:void(0)" id="_mail_link_53_371"
							title="同时将这封邮件发给其他联系人，但收件人和抄送人不会看到密送人" tabindex="2">添加密送</a><a
							hidefocus="hidefocus" class="js-component-link bW nui-txt-link"
							href="javascript:void(0)" id="_mail_link_54_372"
							title="会对多个人一对一的发送， 每个人将单独收到发给他/她的邮件" tabindex="2">使用群发单显</a>
					</div>
				</div>
			</div>
			<div class="fA cj" id="divComposeto">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link bV"
					href="javascript:void(0)" id="_mail_link_55_375" title="点击添加收件人">收件人</a>
				<div class="bM">
					<div class="R">
						<div class="js-component-emailhide nui-fGetout"
							id="_mail_emailhide_0_400">
							<input type="text" role="presentation" tabindex="-1">
						</div>
						<div unselectable="on" title="发给多人时地址请以分号隔开"
							class="js-component-emailcontainer nui-multiLineIpt nui-ipt"
							id="_mail_emailcontainer_0_373">
							<div unselectable="on" title="450383731@qq.com"
								class="nui-editableAddr nui-addr nui-addr-hasAdd">
								<em unselectable="on" class="nui-addr-email">450383731@qq.com</em><a
									hidefocus="hidefocus" class="nui-addr-add"
									href="javascript:void(0)">+</a>
							</div>
							<div
								class="js-component-emailinput nui-editableAddr nui-editableAddr-edit nui-addr"
								id="_mail_emailinput_0_374">
								<input type="text" aria-label="收件人地址输入框，请输入邮件地址，多人时地址请以分号隔开"
									tabindex="1" class="nui-editableAddr-ipt">
								<span class="nui-editableAddr-txt">W</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none;" class="fA cj" id="divComposecc">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link bV"
					href="javascript:void(0)" id="_mail_link_56_378" title="点击添加抄送人">抄送人</a>
				<div class="bM">
					<div class="R">
						<div class="js-component-emailhide nui-fGetout"
							id="_mail_emailhide_1_404">
							<input type="text" role="presentation" tabindex="-1">
						</div>
						<div unselectable="on"
							class="js-component-emailcontainer nui-multiLineIpt nui-ipt"
							id="_mail_emailcontainer_1_376">
							<div
								class="js-component-emailinput nui-editableAddr nui-editableAddr-edit nui-addr"
								id="_mail_emailinput_1_377">
								<input type="text" aria-label="抄送地址输入框，请输入邮件地址，多人时地址请以分号隔开"
									tabindex="1" class="nui-editableAddr-ipt">
								<span class="nui-editableAddr-txt">W</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none;" class="fA cj" id="divComposebcc">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link bV"
					href="javascript:void(0)" id="_mail_link_57_381" title="点击添加密送人">密送人</a>
				<div class="bM">
					<div class="R">
						<div class="js-component-emailhide nui-fGetout"
							id="_mail_emailhide_2_407">
							<input type="text" role="presentation" tabindex="-1">
						</div>
						<div unselectable="on" title="该地址对于其他收件人是不可见的"
							class="js-component-emailcontainer nui-multiLineIpt nui-ipt"
							id="_mail_emailcontainer_2_379">
							<div
								class="js-component-emailinput nui-editableAddr nui-editableAddr-edit nui-addr"
								id="_mail_emailinput_2_380">
								<input type="text" aria-label="密送地址输入框，请输入邮件地址，多人时地址请以分号隔开"
									tabindex="1" class="nui-editableAddr-ipt">
								<span class="nui-editableAddr-txt">W</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none;" class="fA cj" id="divComposeseparate">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link bV"
					href="javascript:void(0)" id="_mail_link_58_384" title="点击添加群发单显">群发单显</a>
				<div class="bM">
					<div class="R">
						<div class="js-component-emailhide nui-fGetout"
							id="_mail_emailhide_3_410">
							<input type="text" role="presentation" tabindex="-1">
						</div>
						<div unselectable="on"
							class="js-component-emailcontainer nui-multiLineIpt nui-ipt"
							id="_mail_emailcontainer_3_382">
							<div
								class="js-component-emailinput nui-editableAddr nui-editableAddr-edit nui-addr"
								id="_mail_emailinput_3_383">
								<input type="text" aria-label="群发单显地址输入框，请输入邮件地址，多人时地址请以分号隔开"
									tabindex="1" class="nui-editableAddr-ipt">
								<span class="nui-editableAddr-txt">W</span>
							</div>
						</div>
					</div>
				</div>
				<div class="bw">
					群发的邮件，采用一对一单独发送，每个收件人只看到自己的地址。
				</div>
			</div>
			<div class="fA cI" id="divComposeSubject">
				<label class="cH" for="objComposeSubject">
					主&#12288;题
				</label>
				<div class="bM">
					<div class="R">
						<div class="js-component-input nui-ipt" id="_mail_input_6_385"
							aria-label="邮件主题输入框，请输入邮件主题">
							<input type="text" maxlength="256" tabindex="1"
								x-webkit-speech="" autocomplete="off" class="nui-ipt-input"
								id="objComposeSubject">
						</div>
					</div>
				</div>
			</div>
			<div class="fA cl" id="divComposeAttachOperate">
				<a class="nui-txt-link" aria-label="点击添加附件" tabindex="2"
					href="javascript:void(0)" id="aComposeAttachAdd">添加附件(最大<strong
					class="nui-txt-impt">2G</strong>)</a><a hidefocus="hidefocus"
					class="js-component-link rW" href="javascript:void(0)"
					id="_mail_link_60_388" style="">升级到3G</a><span class="qx">|</span><a
					hidefocus="hidefocus" class="js-component-link nui-txt-link W"
					href="javascript:void(0)" id="_mail_link_59_386" tabindex="-1"><b
					class="js-component-icon nui-ico nui-ico-dArr  "
					id="_mail_icon_79_387"></b>
				</a><span class="nui-txt-tips" id="divComposeAttachProgress"></span>
				<iframe style="display: none" src="about:blank"
					name="ifrComposeAttachUpload" id="ifrComposeAttachUpload"></iframe>
				<div style="width: 110px;" class="L" id="divComposeAttachBrowse">
					<input type="file" class="t" size="1" multiple="">
				</div>
				<div style="display: none" class="nui-assistBlock nui-block dN"
					id="divComposeAttachDrag">
					<a hidefocus="hidefocus" class="nui-block-close nui-close"
						href="javascript:void(0)" id="aComposeAttachDragClose"><b
						class="nui-ico nui-ico-close">x</b>
					</a>请把文件拖放到这个区域，就可作为附件添加。
				</div>
			</div>
			<div style="display: none" class="X" id="divComposeAttachArea">
				<div id="divComposeAttachContent" style="width: 927px;"></div>
				<div class="clearLine"></div>
			</div>
			<div
				class="nui-tipsLayer nui-tipsLayer-arrDown nui-layer nui-layer-arrDown vt"
				style="display: none" id="divComposeInlinedTips"></div>
			</header>
			<div class="dd" id="divComposeEditor">
				<div id="_mail_editor_0_416" style="position: relative;">
					<div class="APP-editor APP-editor-basic" height="298"
						style="height: 268px;">
						<div class="APP-editor-tbar" style="z-index: 2;">
							<div class="APP-editor-tbar-basic">
								<a class="APP-editor-btn" val="bold" title="加粗"
									evid="basicbold1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-bold">加粗</b>
								</span>
								</a><a class="APP-editor-btn" val="italic" title="斜体"
									evid="basicitalic1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-italic">斜体</b>
								</span>
								</a><a class="APP-editor-btn" val="underline" title="下划线"
									evid="basicunderline1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-underline">下划线</b>
								</span>
								</a><a class="APP-editor-btn" val="fontsize" title="选择字体大小"
									evid="basicfontsize1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-fontsize">选择字体大小</b>
								</span>
								</a><a class="APP-editor-btn" val="forecolor" title="选择字体颜色"
									evid="basicforecolor1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-forecolor">选择字体颜色</b>
								</span>
								</a><a class="APP-editor-btn" val="backcolor" title="选择字体背景"
									evid="basicbackcolor1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-backcolor">选择字体背景</b>
								</span>
								</a><a class="APP-editor-btn APP-editor-btn-spln"
									href="javascript:void(0)"></a><a class="APP-editor-btn"
									val="justify" title="选择对齐方式" evid="basicjustify1"
									href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-justify">选择对齐方式</b>
								</span>
								</a><a class="APP-editor-btn" val="list" title="设置列表"
									evid="basiclist1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-list">设置列表</b>
								</span>
								</a><a class="APP-editor-btn" val="indent" title="设置缩进"
									evid="basicindent1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-indent">设置缩进</b>
								</span>
								</a><a class="APP-editor-btn APP-editor-btn-spln"
									href="javascript:void(0)"></a><a class="APP-editor-btn"
									val="image" title="添加图片" evid="basicimage1"
									href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-image">添加图片</b>
								</span>
								</a><a class="APP-editor-btn" val="capture" title="截图"
									evid="basiccapture1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-capture">截图</b>
								</span>
								</a><a class="APP-editor-btn" val="portrait" title="添加表情"
									evid="basicportrait1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-portrait">添加表情</b>
								</span>
								</a><a class="APP-editor-btn" val="stationery" title="添加信纸"
									evid="basicstationery1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-stationery">添加信纸</b>
								</span>
								</a><a class="APP-editor-btn" val="insertTime" title="添加日期"
									evid="basicinsertTime1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-insertTime">添加日期</b>
								</span>
								</a><a class="APP-editor-btn" val="microphone" title="语音输入"
									evid="basicmicrophone1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-microphone">语音输入</b>
								</span>
								</a><a class="APP-editor-btn" val="sign" title="签名"
									evid="basicsign1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-sign">签名</b>
								</span>
								</a><a class="APP-editor-btn APP-editor-btn-switchFunction"
									val="full" title="切换到全部功能" evid="basicfull1"
									href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-full">切换到全部功能</b>
								</span>
								</a>
							</div>
							<div class="APP-editor-tbar-full">
								<div class="APP-editor-btnGrp" style="width: 27px;">
									<a class="APP-editor-btn" val="undo" title="撤销"
										evid="fullundo1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-undo">撤销</b>
									</span>
									</a><a class="APP-editor-btn APP-editor-btn-dis" val="redo"
										title="重做" evid="fullredo1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-redo">重做</b>
									</span>
									</a>
								</div>
								<a
									class="APP-editor-btn APP-editor-btn-spln APP-editor-btn-spln-l"
									href="javascript:void(0)"></a>
								<div class="APP-editor-btnGrp" style="width: 216px;">
									<a class="APP-editor-btn APP-editor-btn-select" val="fontname"
										title="选择字体" evid="fullfontname1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc">字体</span>
									</a><a class="APP-editor-btn APP-editor-btn-select" val="fontsize"
										title="选择字体大小" evid="fullfontsize1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc">字号</span>
									</a><a class="APP-editor-btn" val="justify" title="选择对齐方式"
										evid="fulljustify1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-justify">选择对齐方式</b>
									</span>
									</a><a class="APP-editor-btn" val="list" title="设置列表"
										evid="fulllist1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-list">设置列表</b>
									</span>
									</a><a class="APP-editor-btn" val="indent" title="设置缩进"
										evid="fullindent1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-indent">设置缩进</b>
									</span>
									</a><a class="APP-editor-btn" val="lineheight" title="设置行高"
										evid="fulllineheight1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-lineheight">设置行高</b>
									</span>
									</a><a class="APP-editor-btn" val="bold" title="加粗"
										evid="fullbold1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-bold">加粗</b>
									</span>
									</a><a class="APP-editor-btn" val="italic" title="斜体"
										evid="fullitalic1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-italic">斜体</b>
									</span>
									</a><a class="APP-editor-btn" val="underline" title="下划线"
										evid="fullunderline1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-underline">下划线</b>
									</span>
									</a><a class="APP-editor-btn" val="forecolor" title="选择字体颜色"
										evid="fullforecolor1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-forecolor">选择字体颜色</b>
									</span>
									</a><a class="APP-editor-btn" val="backcolor" title="选择字体背景"
										evid="fullbackcolor1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-backcolor">选择字体背景</b>
									</span>
									</a><a class="APP-editor-btn" val="insertHorizontalRule"
										title="插入横线" evid="fullinsertHorizontalRule1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-insertHorizontalRule">插入横线</b>
									</span>
									</a><a class="APP-editor-btn" val="insertTable" title="添加表格"
										evid="fullinsertTable1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-insertTable">添加表格</b>
									</span>
									</a><a class="APP-editor-btn" val="removeFormat" title="清除格式"
										evid="fullremoveFormat1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-removeFormat">清除格式</b>
									</span>
									</a>
								</div>
								<a
									class="APP-editor-btn APP-editor-btn-spln APP-editor-btn-spln-l"
									href="javascript:void(0)"></a>
								<div class="APP-editor-btnGrp" style="width: 108px;">
									<a class="APP-editor-btn" val="image" title="添加图片"
										evid="fullimage1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-image">添加图片</b>
									</span>
									</a><a class="APP-editor-btn" val="capture" title="截图"
										evid="fullcapture1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-capture">截图</b>
									</span>
									</a><a class="APP-editor-btn" val="portrait" title="添加表情"
										evid="fullportrait1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-portrait">添加表情</b>
									</span>
									</a><a class="APP-editor-btn" val="link" title="插入/删除链接"
										evid="fulllink1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-link">插入/删除链接</b>
									</span>
									</a><a class="APP-editor-btn" val="stationery" title="添加信纸"
										evid="fullstationery1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-stationery">添加信纸</b>
									</span>
									</a><a class="APP-editor-btn" val="insertTime" title="添加日期"
										evid="fullinsertTime1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-insertTime">添加日期</b>
									</span>
									</a><a class="APP-editor-btn" val="sign" title="签名"
										evid="fullsign1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-sign">签名</b>
									</span>
									</a>
								</div>
								<a
									class="APP-editor-btn APP-editor-btn-spln APP-editor-btn-spln-l"
									href="javascript:void(0)"></a>
								<div class="APP-editor-btnGrp" style="width: 24px;">
									<a class="APP-editor-btn" val="microphone" title="语音输入"
										evid="fullmicrophone1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-microphone">语音输入</b>
									</span>
									</a><a class="APP-editor-btn APP-editor-btn-switchSource"
										val="source" title="切换到源码功能" evid="fullsource1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-source">切换到源码功能</b>
									</span>
									</a>
								</div>
								<div class="APP-editor-btnGrp" style="width: 86px;"></div>
								<div class="APP-editor-extOpt">
									<a class="APP-editor-extOpt-item nui-txt-link"
										href="javascript:void(0)">拼写检查</a><a
										class="APP-editor-extOpt-item nui-txt-link"
										href="javascript:void(0)" evid="1371488926967.4402">查词典</a>
								</div>
								<a class="APP-editor-btn APP-editor-btn-switchFunction"
									val="basic" title="切换到简单功能" evid="fullbasic1"
									href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-basic">切换到简单功能</b>
								</span>
								</a>
							</div>
							<div class="APP-editor-tbar-source">
								<div class="APP-editor-btnGrp" style="width: 27px;">
									<a class="APP-editor-btn APP-editor-btn-dis" val="undo"
										title="源码模式下不能使用该功能" evd="fullundo1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-undo">撤销</b>
									</span>
									</a><a class="APP-editor-btn APP-editor-btn-dis" val="redo"
										title="源码模式下不能使用该功能" evd="fullredo1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-redo">重做</b>
									</span>
									</a>
								</div>
								<a
									class="APP-editor-btn APP-editor-btn-spln APP-editor-btn-spln-l"
									href="javascript:void(0)"></a>
								<div class="APP-editor-btnGrp" style="width: 216px;">
									<a class="APP-editor-btn APP-editor-btn-select" val="fontname"
										title="源码模式下不能使用该功能" evd="fullfontname1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc">字体</span>
									</a><a class="APP-editor-btn APP-editor-btn-select" val="fontsize"
										title="源码模式下不能使用该功能" evd="fullfontsize1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc">字号</span>
									</a><a class="APP-editor-btn" val="justify" title="源码模式下不能使用该功能"
										evd="fulljustify1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-justify">选择对齐方式</b>
									</span>
									</a><a class="APP-editor-btn" val="list" title="源码模式下不能使用该功能"
										evd="fulllist1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-list">设置列表</b>
									</span>
									</a><a class="APP-editor-btn" val="indent" title="源码模式下不能使用该功能"
										evd="fullindent1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-indent">设置缩进</b>
									</span>
									</a><a class="APP-editor-btn" val="lineheight" title="源码模式下不能使用该功能"
										evd="fulllineheight1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-lineheight">设置行高</b>
									</span>
									</a><a class="APP-editor-btn" val="bold" title="源码模式下不能使用该功能"
										evd="fullbold1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-bold">加粗</b>
									</span>
									</a><a class="APP-editor-btn" val="italic" title="源码模式下不能使用该功能"
										evd="fullitalic1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-italic">斜体</b>
									</span>
									</a><a class="APP-editor-btn" val="underline" title="源码模式下不能使用该功能"
										evd="fullunderline1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-underline">下划线</b>
									</span>
									</a><a class="APP-editor-btn" val="forecolor" title="源码模式下不能使用该功能"
										evd="fullforecolor1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-forecolor">选择字体颜色</b>
									</span>
									</a><a class="APP-editor-btn" val="backcolor" title="源码模式下不能使用该功能"
										evd="fullbackcolor1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-backcolor">选择字体背景</b>
									</span>
									</a><a class="APP-editor-btn" val="insertHorizontalRule"
										title="源码模式下不能使用该功能" evd="fullinsertHorizontalRule1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-insertHorizontalRule">插入横线</b>
									</span>
									</a><a class="APP-editor-btn" val="insertTable"
										title="源码模式下不能使用该功能" evd="fullinsertTable1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-insertTable">添加表格</b>
									</span>
									</a><a class="APP-editor-btn" val="removeFormat"
										title="源码模式下不能使用该功能" evd="fullremoveFormat1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-removeFormat">清除格式</b>
									</span>
									</a>
								</div>
								<a
									class="APP-editor-btn APP-editor-btn-spln APP-editor-btn-spln-l"
									href="javascript:void(0)"></a>
								<div class="APP-editor-btnGrp" style="width: 108px;">
									<a class="APP-editor-btn" val="image" title="源码模式下不能使用该功能"
										evd="fullimage1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-image">添加图片</b>
									</span>
									</a><a class="APP-editor-btn" val="capture" title="源码模式下不能使用该功能"
										evd="fullcapture1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-capture">截图</b>
									</span>
									</a><a class="APP-editor-btn" val="portrait" title="源码模式下不能使用该功能"
										evd="fullportrait1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-portrait">添加表情</b>
									</span>
									</a><a class="APP-editor-btn" val="link" title="源码模式下不能使用该功能"
										evd="fulllink1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-link">插入/删除链接</b>
									</span>
									</a><a class="APP-editor-btn" val="stationery" title="源码模式下不能使用该功能"
										evd="fullstationery1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-stationery">添加信纸</b>
									</span>
									</a><a class="APP-editor-btn" val="insertTime" title="源码模式下不能使用该功能"
										evd="fullinsertTime1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-insertTime">添加日期</b>
									</span>
									</a><a class="APP-editor-btn" val="sign" title="源码模式下不能使用该功能"
										evd="fullsign1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-sign">签名</b>
									</span>
									</a>
								</div>
								<a
									class="APP-editor-btn APP-editor-btn-spln APP-editor-btn-spln-l"
									href="javascript:void(0)"></a>
								<div class="APP-editor-btnGrp" style="width: 24px;">
									<a class="APP-editor-btn" val="microphone" title="源码模式下不能使用该功能"
										evd="fullmicrophone1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-microphone">语音输入</b>
									</span>
									</a><a
										class="APP-editor-btn APP-editor-btn-switchSource APP-editor-btn-selected"
										val="source" title="返回可视化视图" evid="sourcefull1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-source">切换到源码功能</b>
									</span>
									</a>
								</div>
								<div class="APP-editor-btnGrp" style="width: 86px;"></div>
								<div class="APP-editor-extOpt">
									<a class="APP-editor-extOpt-item nui-txt-link"
										href="javascript:void(0)">拼写检查</a><a
										class="APP-editor-extOpt-item nui-txt-link"
										href="javascript:void(0)" evd="1371488926967.4402">查词典</a>
								</div>
								<a class="APP-editor-btn APP-editor-btn-switchFunction"
									val="basic" title="源码模式下不能使用该功能" evd="fullbasic1"
									href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-basic">切换到简单功能</b>
								</span>
								</a>
							</div>
						</div>
						<div class="APP-editor-edtr" style="position: relative;">
							<div class="APP-editor-edtr-mask" style="display: none;"></div>
							<iframe frameborder="0" style="position: absolute;" tabindex="1"
								class="APP-editor-iframe"></iframe>
							<textarea class="APP-editor-textarea" tabindex="1"
								style="height: 268px;"></textarea>
						</div>
					</div>
				</div>
			</div>
			<b title="您已退出编辑器，Tab键继续导航，Shift+Tab返回编辑器" tabindex="1"></b>
			<div class="cJ">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link"
					href="javascript:void(0)" id="_mail_link_47_354">更多选项 <b
					class="nui-ico">j</b>
				</a>
			</div>
			<div style="display: none" class="gm" id="divComposeOption">
				<div class="bx">
					<div class="ds">
						<span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_1_344"
							title="设置邮件投递优先级"><span class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_70_355"></b>
						</span><span class="nui-chk-text">紧急</span>
						</span><span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_2_345"
							title="启用回执功能，您可以了解收件人是否阅读了您发送的邮件"><span
							class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_71_356"></b>
						</span><span class="nui-chk-text">已读回执</span>
						</span><span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_3_346"
							title="把邮件内容切换成纯文本，它将无法插入表情，图片以及将丢失正文颜色等"><span
							class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_72_357"></b>
						</span><span class="nui-chk-text">纯文本</span>
						</span><span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_4_347"><span
							class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_73_358"></b>
						</span><span class="nui-chk-text">定时发送</span>
						</span><span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_5_348"><span
							class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_74_359"></b>
						</span><span class="nui-chk-text">邮件加密</span>
						</span><span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_6_349"
							style="display: none"><span class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_75_360"></b>
						</span><span class="nui-chk-text">短信通知收件人</span>
						</span><span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_7_350"><span
							class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_68_351"></b>
						</span><span class="nui-chk-text">保存到有道云笔记</span>
						</span><a hidefocus="hidefocus" target="_blank"
							style="margin: -4px 0 0 -3px"
							class="js-component-link nui-fIBlock"
							href="http://note.youdao.com/" id="_mail_link_46_352"
							title="什么是有道云笔记?"><b
							class="js-component-icon nui-ico nui-ico-help  "
							id="_mail_icon_69_353"></b>
						</a>
					</div>
				</div>
				<div style="display: none" class="nui-assistBlock nui-block dt"
					id="divComposeSchedule">
					<div id="divComposeScheduleInner"></div>
				</div>
				<div style="display: none" class="nui-assistBlock nui-block dt"
					id="divComposeEncrypt">
					<a hidefocus="hidefocus"
						class="js-component-link nui-block-close nui-close"
						href="javascript:void(0)" id="_mail_link_48_361"><b
						class="js-component-icon nui-ico nui-ico-close  "
						id="_mail_icon_76_364">x</b>
					</a><strong>邮件加密</strong> 收信人需要密码才能查看邮件
					<div class="bi">
						<label class="G">
							设置查看密码：
						</label>
						<div class="js-component-input nui-smallIpt nui-ipt "
							id="_mail_input_5_363">
							<input type="text" maxlength="6" autocomplete="off"
								class="nui-ipt-input">
						</div>
						<span class="nui-txtTips">&nbsp;(请输入6位数字、字母，区分大小写)</span>
						<p class="bj">
							<span class="js-component-checkbox nui-chk nui-chk-hasText  "
								tabindex="0" role="checkbox" id="_mail_checkbox_8_362"><span
								class="nui-chk-symbol"><b
									class="js-component-icon nui-ico nui-ico-checkbox  "
									id="_mail_icon_77_365"></b>
							</span><span class="nui-chk-text">在已发送邮件中保存密码</span>
							</span>
						</p>
					</div>
					<a style="text-decoration: none; display: none"
						hidefocus="hidefocus" href="javascript:void(0)"
						id="aComposeEncryptFocus">&#12288;</a>
				</div>
				<div style="display: none" class="nui-block dt bC"
					id="divComposeSms">
					<a hidefocus="hidefocus"
						class="js-component-link nui-block-close nui-close"
						href="javascript:void(0)" id="_mail_link_49_366"><b
						class="js-component-icon nui-ico nui-ico-close  "
						id="_mail_icon_78_368">x</b>
					</a>
					<div class="bd">
						<strong>短信通知收件人</strong><span class="nui-txtTips">(<span
							id="spanComposeSmsTips"></span>，<a hidefocus="hidefocus"
							target="_blank" class="js-component-link nui-txt-link"
							href="http://help.163.com/10/0720/12/6C1N7E0I00753VB8.html?sid=ADqcDCcdzlVSuJBHvEddQmOeOriHFPCG&amp;uid=wangjiuyingzui@163.com&amp;host=twebmail.mail.163.com&amp;ver=js5&amp;style=1&amp;skin=163blue&amp;color=003399"
							id="_mail_link_50_367">短信示例</a>)<span id="spanComposeSmsErr"></span>
						</span>
					</div>
					<div class="nui-normalTable nui-table" id="divComposeSmsTable"></div>
					<a style="text-decoration: none; display: none"
						hidefocus="hidefocus" href="javascript:void(0)"
						id="aComposeSmsFocus">&#12288;</a>
				</div>
			</div>
			</section>
			<aside class="kb" id="tdComposeRight">
			<div class="ek">
				<ul class="js-component-tab nui-tabs nui-tabs-common  "
					aria-label="邮箱标签" role="tablist" id="_mail_tab_1_389">
					<li tabindex="0" aria-selected="true" role="tab"
						class="js-component-tabitem nui-tabs-item nui-tabs-item-selected"
						id="_mail_tabitem_7_414">
						<span id="addresstext" unselectable="on"
							class="nui-tabs-item-text nui-fNoSelect">通讯录</span>
					</li>
					<li tabindex="0" aria-selected="false" role="tab"
						class="js-component-tabitem nui-tabs-item"
						id="_mail_tabitem_8_415" style="width: 95px;">
						<span id="stationerytext" unselectable="on"
							class="nui-tabs-item-text nui-fNoSelect">信 纸</span>
					</li>
				</ul>
				<div class="fB" id="divComposeAddress" style="">
					<div class="dM">
						<div class="js-component-input nui-ipt nui-ipt-hasIconBtn"
							id="_mail_input_7_390">
							<label class="nui-ipt-placeholder" style="">
								查找联系人
							</label>
							<input type="text" autocomplete="off" class="nui-ipt-input">
							<span hidefocus="hidefocus" tabindex="0" class="nui-ipt-iconBtn"><b
								class="js-component-icon nui-ico nui-ico-search  "
								id="_mail_icon_80_391" title="立即查找"></b>
							</span>
						</div>
						<a class="cg" href="javascript:void(0)" title="快速添加联系人"
							id="aComposeAddressAdd"><b class="nui-ico nui-ico-add2"></b>
						</a>
					</div>
					<div style="height: 333px;" class="dc nui-scroll"
						id="divComposeAddressContent">
						<div class="nui-simpleTree nui-tree" id="divComposeAddressTree">
							<div>
								<div class="nui-tree-item nui-tree-item-spec">
									<ul class="nui-tree">
										<li class="nui-tree-item nui-tree-item-noChild">
											<a class="ch" href="javascript:void(0)" title="给东方卫视写信"><span
												class="nui-tree-item-icon"><b
													class="nui-ico nui-ico-user nui-ico-user-other"></b>
											</span>给东方卫视写信</a>
										</li>
										<li class="nui-tree-item nui-tree-item-noChild">
											<a class="ch" href="javascript:void(0)"
												title="&quot;我&quot;&lt;wangjiuyingzui@163.com&gt;"><span
												class="nui-tree-item-icon"><b
													class="nui-ico nui-ico-user nui-ico-user-me"></b>
											</span>给自己写一封信</a>
										</li>
									</ul>
								</div>
								<div class="nui-tree-item nui-tree-item-isFold">
									<span class="nui-tree-item-label"><span
										class="nui-tree-item-symbol"><b title="展开"
											class="js-component-icon nui-tree-item-symbol-fold nui-ico nui-ico-rArr  "
											id="_mail_icon_87_427"></b><b title="折叠"
											class="js-component-icon nui-tree-item-symbol-unfold nui-ico nui-ico-dArr  "
											id="_mail_icon_88_428"></b>
									</span><span title="常用联系人" class="nui-tree-item-text">常用联系人(1)</span><a
										class="nui-tree-item-ext nui-txt-link"
										href="javascript:void(0)" style="display: none;">添加该组</a>
									</span>
									<ul class="nui-tree">
										<li data-id="0">
											<a class="ch" href="javascript:void(0)">450383731</a>
										</li>
									</ul>
								</div>
								<div class="nui-tree-item nui-tree-item-isFold">
									<span class="nui-tree-item-label"><span
										class="nui-tree-item-symbol"><b title="展开"
											class="js-component-icon nui-tree-item-symbol-fold nui-ico nui-ico-rArr  "
											id="_mail_icon_40_221"></b><b title="折叠"
											class="js-component-icon nui-tree-item-symbol-unfold nui-ico nui-ico-dArr  "
											id="_mail_icon_41_222"></b>
									</span><span title="未分组" class="nui-tree-item-text">未分组(1)</span><a
										class="nui-tree-item-ext nui-txt-link"
										href="javascript:void(0)" style="display: none;">添加该组</a>
									</span>
									<ul class="nui-tree">
										<li data-id="0">
											<a class="ch" href="javascript:void(0)">450383731@qq.com</a>
										</li>
									</ul>
								</div>
								<div class="nui-split nui-split-dotted"></div>
								<div class="nui-tree-item nui-tree-item-isFold">
									<span class="nui-tree-item-label"><span
										class="nui-tree-item-symbol"><b title="展开"
											class="js-component-icon nui-tree-item-symbol-fold nui-ico nui-ico-rArr  "
											id="_mail_icon_42_223"></b><b title="折叠"
											class="js-component-icon nui-tree-item-symbol-unfold nui-ico nui-ico-dArr  "
											id="_mail_icon_43_224"></b>
									</span><span title="所有联系人" class="nui-tree-item-text">所有(1)</span><a
										class="nui-tree-item-ext nui-txt-link"
										href="javascript:void(0)" style="display: none;">添加该组</a>
									</span>
									<ul class="nui-tree">
										<li data-id="0">
											<a class="ch" href="javascript:void(0)">450383731@qq.com</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="nui-simpleTree nui-tree" id="divComposeAddressResult"></div>
					</div>
				</div>
				<div style="display: none;" class="ci" id="divComposeStationery">
					<div class="bB">
						<div class="js-component-button nui-dropdownBtn nui-btn "
							tabindex="0" role="button" id="_mail_button_66_392">
							<span class="nui-btn-text">全部</span><span
								class="nui-dropdownBtn-arr"><b
								class="nui-ico nui-ico-dArr"></b>
							</span>
						</div>
						<div class="js-component-button nui-btn nui-btn-hasIcon  "
							tabindex="0" role="button" id="_mail_button_67_393">
							<span class="nui-btn-icon"><b
								class="js-component-icon nui-ico nui-ico-add  "
								id="_mail_icon_81_394"></b>
							</span><span class="nui-btn-text">自创信纸</span>
						</div>
					</div>
					<div style="height: 301px;" class="bl nui-scroll"
						id="divComposeStationeryContent">
						<div class="K">
							<a class="u" title="不使用信纸" href="javascript:void(0)"><img
									class="x" src="http://mimg.127.net/p/images/letter/nonuse.gif">
							</a>
							<div class="s f">
								<b class="nui-ico i">z</b>
							</div>
						</div>
						<div class="K">
							<a class="u" title="花语" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/b_free6s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="冬日" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/b_free7s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="Missing" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/b_love7s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="冬天童话" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/wxd_4s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="水彩田园" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/xh_6s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="校园色彩" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/wxd_7s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="校园回忆" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/xyl_8s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="夜色" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/xyl_9s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="玻璃樽" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/xyl_1s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="没有距离" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/hk_5s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="初恋粉色系" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/zt_2s.jpg">
							</a>
						</div>
					</div>
					<div class="bc" id="divComposeStationeryPage">
						<a href="javascript:void(0)">上页</a>
						<div class="js-component-select nui-simpleSelect nui-select "
							tabindex="0" id="_mail_select_12_496">
							<span class="nui-select-text">1/16</span><span
								class="nui-select-arr"><b class="nui-ico nui-ico-dArr"></b>
							</span>
						</div>
						<a href="javascript:void(0)">下页</a>
					</div>
				</div>
			</div>
			</aside>
			<footer class="lN">
			<div class="js-component-toolbar nui-toolbar "
				id="_mail_toolbar_4_395">
				<div class="nui-toolbar-item">
					<div class="js-component-button nui-mainBtn nui-btn " tabindex="0"
						role="button" id="_mail_button_68_396">
						<span class="nui-btn-text">&nbsp;发 送&nbsp;</span>
					</div>
				</div>
				<div class="nui-toolbar-item">
					<div class="js-component-button nui-btn " tabindex="0"
						role="button" id="_mail_button_69_397">
						<span class="nui-btn-text">&nbsp;取 消&nbsp;</span>
					</div>
				</div>
			</div>
			</footer>
		</div>
		<div style="display: none" class="qt pr" id="divComposeSucc">
			<div class="pV oC" id="divComposeSuccMain">
				<div style="display: none" id="divComposeSuccTips"></div>
				<div class="up">
					<div id="divComposeSuccTop"></div>
					<div class="un" id="divComposeContact"></div>
				</div>
				<div class="ur">
					<b class="oD kJ"></b><span id="spanComposeSuccInfo"></span>
					<div tabindex="1" class="mH" id="divComposeSuccCancel"></div>
					<div class="sJ" id="divComposeSmsTips"></div>
				</div>
				<div class="pa" id="divComposeSuccAd"></div>
				<div class="kH">
					<div class="um uh">
						<div style="display: none" id="divComposeSuccStamp"></div>
						<div id="divComposeSuccLetter"></div>
					</div>
				</div>
			</div>
		</div>
		<div style="display: none" class="qt" id="divComposePage">
			<div class="jr">
				<iframe scrolling="no" frameborder="0"
					allowtransparency="allowtransparency" src="about:blank" class="dO"
					name="ifrComposePage" id="ifrComposePage"></iframe>
				<form style="height: 0" method="post" target="ifrComposePage"></form>
			</div>
		</div>
		<div hidefocus="hidefocus" class="js-component-menu nui-menu "
			tabindex="0" id="_mail_menu_28_413"
			style="opacity: 0; left: 241px; top: 123px; visibility: hidden; transform: translate(0px, -5px); display: none;">
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_4_459">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">从“云附件”添加</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_5_460">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">从“网盘”添加</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_6_461">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">从“往来附件”添加</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_7_462">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">从“有道云笔记”添加</span>
				</div>
			</div>
			<div class="nui-menu-split nui-split"></div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_8_463">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">拖拽添加</span>
				</div>
			</div>
		</div>
	</div>
	<div hidefocus="hidefocus" class="js-component-menu nui-menu "
		tabindex="0" id="_mail_menu_27_399"
		style="opacity: 0; left: 62px; top: 75px; visibility: hidden; transform: translate(0px, -5px); display: none;">
		<div class="js-component-menuitem nui-menu-item" tabindex="-1"
			id="_mail_menuitem_2_429">
			<div class="nui-menu-item-link">
				<span class="nui-menu-item-icon"><b
					class="js-component-icon nui-ico nui-ico-radio nui-ico-radio-checked"
					id="_mail_icon_89_430"></b>
				</span><span class="nui-menu-item-text">"wangjiuyingzui"&lt;wangjiuyingzui@163.com&gt;</span>
			</div>
		</div>
		<div class="nui-menu-split nui-split"></div>
		<div class="js-component-menuitem nui-menu-item" tabindex="-1"
			id="_mail_menuitem_3_431">
			<div class="nui-menu-item-link">
				<span class="nui-menu-item-text">设置默认发件人与昵称</span>
			</div>
		</div>
	</div>
</div>