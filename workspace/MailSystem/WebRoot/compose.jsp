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
				<span class="nui-btn-text">&nbsp;�� ��&nbsp;</span>
			</div>
		</div>
		<div class="nui-toolbar-item">
			<div class="js-component-button nui-btn " tabindex="2" role="button"
				id="_mail_button_61_334">
				<span class="nui-btn-text">��ݸ�</span>
			</div>
		</div>
		<div class="nui-toolbar-item">
			<div class="js-component-button nui-btn " tabindex="2" role="button"
				id="_mail_button_62_335">
				<span class="nui-btn-text">Ԥ ��</span>
			</div>
		</div>
		<div class="nui-toolbar-item">
			<div class="js-component-button nui-btn " tabindex="2" role="button"
				id="_mail_button_63_336">
				<span class="nui-btn-text">ȡ ��</span>
			</div>
		</div>
		<div class="nui-toolbar-ext">
			<div style="display: none" class="nui-toolbar-item">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link"
					href="javascript:void(0)" id="_mail_link_43_337" tabindex="2">����ģ��</a>
			</div>
			<div style="display: none" class="nui-toolbar-item">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link"
					href="javascript:void(0)" id="_mail_link_44_338" tabindex="2">�ؿ�</a>
			</div>
			<div style="display: none" class="nui-toolbar-item">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link"
					href="javascript:void(0)" id="_mail_link_45_339" tabindex="2">����Ƭ</a>
			</div>
			<div class="nui-toolbar-item">
				<div title="�´���д��"
					class="js-component-button nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
					tabindex="2" role="button" id="_mail_button_64_340">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico nui-ico-newWin  "
						id="_mail_icon_66_341">L</b>
					</span><span class="nui-btn-text"></span>
				</div>
			</div>
			<div class="nui-toolbar-item">
				<div title="д������"
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
			<a title="����ͨѶ¼" class="fC" href="javascript:void(0)"
				id="aComposeSwitch"><span class="dr"><b
					class="nui-ico nui-ico-rArr"></b>
			</span>
			</a>
			<header class="ku">
			<div class="fA ck">
				<label class="cH">
					������
				</label>
				<div>
					<a hidefocus="hidefocus" class="js-component-link nui-txt-link bm"
						href="javascript:void(0)" id="_mail_link_51_369"
						title="�����˵�ַ������������÷�����" tabindex="2"><span class="bn">wangjiuyingzui&nbsp;</span><span
						class="re">&lt;wangjiuyingzui@163.com&gt;</span> <b
						class="nui-ico nui-ico-dArr">d</b>
					</a>
					<div class="bh class nui-bg-light">
						<a hidefocus="hidefocus"
							class="js-component-link bW  nui-txt-link"
							href="javascript:void(0)" id="_mail_link_52_370"
							title="ͬʱ������ʼ�����������ϵ��" tabindex="2">��ӳ���</a><a
							hidefocus="hidefocus" class="js-component-link bW  nui-txt-link"
							href="javascript:void(0)" id="_mail_link_53_371"
							title="ͬʱ������ʼ�����������ϵ�ˣ����ռ��˺ͳ����˲��ῴ��������" tabindex="2">�������</a><a
							hidefocus="hidefocus" class="js-component-link bW nui-txt-link"
							href="javascript:void(0)" id="_mail_link_54_372"
							title="��Զ����һ��һ�ķ��ͣ� ÿ���˽������յ�������/�����ʼ�" tabindex="2">ʹ��Ⱥ������</a>
					</div>
				</div>
			</div>
			<div class="fA cj" id="divComposeto">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link bV"
					href="javascript:void(0)" id="_mail_link_55_375" title="�������ռ���">�ռ���</a>
				<div class="bM">
					<div class="R">
						<div class="js-component-emailhide nui-fGetout"
							id="_mail_emailhide_0_400">
							<input type="text" role="presentation" tabindex="-1">
						</div>
						<div unselectable="on" title="��������ʱ��ַ���ԷֺŸ���"
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
								<input type="text" aria-label="�ռ��˵�ַ������������ʼ���ַ������ʱ��ַ���ԷֺŸ���"
									tabindex="1" class="nui-editableAddr-ipt">
								<span class="nui-editableAddr-txt">W</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none;" class="fA cj" id="divComposecc">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link bV"
					href="javascript:void(0)" id="_mail_link_56_378" title="�����ӳ�����">������</a>
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
								<input type="text" aria-label="���͵�ַ������������ʼ���ַ������ʱ��ַ���ԷֺŸ���"
									tabindex="1" class="nui-editableAddr-ipt">
								<span class="nui-editableAddr-txt">W</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none;" class="fA cj" id="divComposebcc">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link bV"
					href="javascript:void(0)" id="_mail_link_57_381" title="������������">������</a>
				<div class="bM">
					<div class="R">
						<div class="js-component-emailhide nui-fGetout"
							id="_mail_emailhide_2_407">
							<input type="text" role="presentation" tabindex="-1">
						</div>
						<div unselectable="on" title="�õ�ַ���������ռ����ǲ��ɼ���"
							class="js-component-emailcontainer nui-multiLineIpt nui-ipt"
							id="_mail_emailcontainer_2_379">
							<div
								class="js-component-emailinput nui-editableAddr nui-editableAddr-edit nui-addr"
								id="_mail_emailinput_2_380">
								<input type="text" aria-label="���͵�ַ������������ʼ���ַ������ʱ��ַ���ԷֺŸ���"
									tabindex="1" class="nui-editableAddr-ipt">
								<span class="nui-editableAddr-txt">W</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none;" class="fA cj" id="divComposeseparate">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link bV"
					href="javascript:void(0)" id="_mail_link_58_384" title="������Ⱥ������">Ⱥ������</a>
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
								<input type="text" aria-label="Ⱥ�����Ե�ַ������������ʼ���ַ������ʱ��ַ���ԷֺŸ���"
									tabindex="1" class="nui-editableAddr-ipt">
								<span class="nui-editableAddr-txt">W</span>
							</div>
						</div>
					</div>
				</div>
				<div class="bw">
					Ⱥ�����ʼ�������һ��һ�������ͣ�ÿ���ռ���ֻ�����Լ��ĵ�ַ��
				</div>
			</div>
			<div class="fA cI" id="divComposeSubject">
				<label class="cH" for="objComposeSubject">
					��&#12288;��
				</label>
				<div class="bM">
					<div class="R">
						<div class="js-component-input nui-ipt" id="_mail_input_6_385"
							aria-label="�ʼ�����������������ʼ�����">
							<input type="text" maxlength="256" tabindex="1"
								x-webkit-speech="" autocomplete="off" class="nui-ipt-input"
								id="objComposeSubject">
						</div>
					</div>
				</div>
			</div>
			<div class="fA cl" id="divComposeAttachOperate">
				<a class="nui-txt-link" aria-label="�����Ӹ���" tabindex="2"
					href="javascript:void(0)" id="aComposeAttachAdd">��Ӹ���(���<strong
					class="nui-txt-impt">2G</strong>)</a><a hidefocus="hidefocus"
					class="js-component-link rW" href="javascript:void(0)"
					id="_mail_link_60_388" style="">������3G</a><span class="qx">|</span><a
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
					</a>����ļ��Ϸŵ�������򣬾Ϳ���Ϊ������ӡ�
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
								<a class="APP-editor-btn" val="bold" title="�Ӵ�"
									evid="basicbold1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-bold">�Ӵ�</b>
								</span>
								</a><a class="APP-editor-btn" val="italic" title="б��"
									evid="basicitalic1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-italic">б��</b>
								</span>
								</a><a class="APP-editor-btn" val="underline" title="�»���"
									evid="basicunderline1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-underline">�»���</b>
								</span>
								</a><a class="APP-editor-btn" val="fontsize" title="ѡ�������С"
									evid="basicfontsize1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-fontsize">ѡ�������С</b>
								</span>
								</a><a class="APP-editor-btn" val="forecolor" title="ѡ��������ɫ"
									evid="basicforecolor1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-forecolor">ѡ��������ɫ</b>
								</span>
								</a><a class="APP-editor-btn" val="backcolor" title="ѡ�����屳��"
									evid="basicbackcolor1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-backcolor">ѡ�����屳��</b>
								</span>
								</a><a class="APP-editor-btn APP-editor-btn-spln"
									href="javascript:void(0)"></a><a class="APP-editor-btn"
									val="justify" title="ѡ����뷽ʽ" evid="basicjustify1"
									href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-justify">ѡ����뷽ʽ</b>
								</span>
								</a><a class="APP-editor-btn" val="list" title="�����б�"
									evid="basiclist1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-list">�����б�</b>
								</span>
								</a><a class="APP-editor-btn" val="indent" title="��������"
									evid="basicindent1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-indent">��������</b>
								</span>
								</a><a class="APP-editor-btn APP-editor-btn-spln"
									href="javascript:void(0)"></a><a class="APP-editor-btn"
									val="image" title="���ͼƬ" evid="basicimage1"
									href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-image">���ͼƬ</b>
								</span>
								</a><a class="APP-editor-btn" val="capture" title="��ͼ"
									evid="basiccapture1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-capture">��ͼ</b>
								</span>
								</a><a class="APP-editor-btn" val="portrait" title="��ӱ���"
									evid="basicportrait1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-portrait">��ӱ���</b>
								</span>
								</a><a class="APP-editor-btn" val="stationery" title="�����ֽ"
									evid="basicstationery1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-stationery">�����ֽ</b>
								</span>
								</a><a class="APP-editor-btn" val="insertTime" title="�������"
									evid="basicinsertTime1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-insertTime">�������</b>
								</span>
								</a><a class="APP-editor-btn" val="microphone" title="��������"
									evid="basicmicrophone1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-microphone">��������</b>
								</span>
								</a><a class="APP-editor-btn" val="sign" title="ǩ��"
									evid="basicsign1" href="javascript:void(0)"><span
									class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-sign">ǩ��</b>
								</span>
								</a><a class="APP-editor-btn APP-editor-btn-switchFunction"
									val="full" title="�л���ȫ������" evid="basicfull1"
									href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-full">�л���ȫ������</b>
								</span>
								</a>
							</div>
							<div class="APP-editor-tbar-full">
								<div class="APP-editor-btnGrp" style="width: 27px;">
									<a class="APP-editor-btn" val="undo" title="����"
										evid="fullundo1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-undo">����</b>
									</span>
									</a><a class="APP-editor-btn APP-editor-btn-dis" val="redo"
										title="����" evid="fullredo1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-redo">����</b>
									</span>
									</a>
								</div>
								<a
									class="APP-editor-btn APP-editor-btn-spln APP-editor-btn-spln-l"
									href="javascript:void(0)"></a>
								<div class="APP-editor-btnGrp" style="width: 216px;">
									<a class="APP-editor-btn APP-editor-btn-select" val="fontname"
										title="ѡ������" evid="fullfontname1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc">����</span>
									</a><a class="APP-editor-btn APP-editor-btn-select" val="fontsize"
										title="ѡ�������С" evid="fullfontsize1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc">�ֺ�</span>
									</a><a class="APP-editor-btn" val="justify" title="ѡ����뷽ʽ"
										evid="fulljustify1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-justify">ѡ����뷽ʽ</b>
									</span>
									</a><a class="APP-editor-btn" val="list" title="�����б�"
										evid="fulllist1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-list">�����б�</b>
									</span>
									</a><a class="APP-editor-btn" val="indent" title="��������"
										evid="fullindent1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-indent">��������</b>
									</span>
									</a><a class="APP-editor-btn" val="lineheight" title="�����и�"
										evid="fulllineheight1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-lineheight">�����и�</b>
									</span>
									</a><a class="APP-editor-btn" val="bold" title="�Ӵ�"
										evid="fullbold1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-bold">�Ӵ�</b>
									</span>
									</a><a class="APP-editor-btn" val="italic" title="б��"
										evid="fullitalic1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-italic">б��</b>
									</span>
									</a><a class="APP-editor-btn" val="underline" title="�»���"
										evid="fullunderline1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-underline">�»���</b>
									</span>
									</a><a class="APP-editor-btn" val="forecolor" title="ѡ��������ɫ"
										evid="fullforecolor1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-forecolor">ѡ��������ɫ</b>
									</span>
									</a><a class="APP-editor-btn" val="backcolor" title="ѡ�����屳��"
										evid="fullbackcolor1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-backcolor">ѡ�����屳��</b>
									</span>
									</a><a class="APP-editor-btn" val="insertHorizontalRule"
										title="�������" evid="fullinsertHorizontalRule1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-insertHorizontalRule">�������</b>
									</span>
									</a><a class="APP-editor-btn" val="insertTable" title="��ӱ��"
										evid="fullinsertTable1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-insertTable">��ӱ��</b>
									</span>
									</a><a class="APP-editor-btn" val="removeFormat" title="�����ʽ"
										evid="fullremoveFormat1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-removeFormat">�����ʽ</b>
									</span>
									</a>
								</div>
								<a
									class="APP-editor-btn APP-editor-btn-spln APP-editor-btn-spln-l"
									href="javascript:void(0)"></a>
								<div class="APP-editor-btnGrp" style="width: 108px;">
									<a class="APP-editor-btn" val="image" title="���ͼƬ"
										evid="fullimage1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-image">���ͼƬ</b>
									</span>
									</a><a class="APP-editor-btn" val="capture" title="��ͼ"
										evid="fullcapture1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-capture">��ͼ</b>
									</span>
									</a><a class="APP-editor-btn" val="portrait" title="��ӱ���"
										evid="fullportrait1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-portrait">��ӱ���</b>
									</span>
									</a><a class="APP-editor-btn" val="link" title="����/ɾ������"
										evid="fulllink1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-link">����/ɾ������</b>
									</span>
									</a><a class="APP-editor-btn" val="stationery" title="�����ֽ"
										evid="fullstationery1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-stationery">�����ֽ</b>
									</span>
									</a><a class="APP-editor-btn" val="insertTime" title="�������"
										evid="fullinsertTime1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-insertTime">�������</b>
									</span>
									</a><a class="APP-editor-btn" val="sign" title="ǩ��"
										evid="fullsign1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-sign">ǩ��</b>
									</span>
									</a>
								</div>
								<a
									class="APP-editor-btn APP-editor-btn-spln APP-editor-btn-spln-l"
									href="javascript:void(0)"></a>
								<div class="APP-editor-btnGrp" style="width: 24px;">
									<a class="APP-editor-btn" val="microphone" title="��������"
										evid="fullmicrophone1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-microphone">��������</b>
									</span>
									</a><a class="APP-editor-btn APP-editor-btn-switchSource"
										val="source" title="�л���Դ�빦��" evid="fullsource1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-source">�л���Դ�빦��</b>
									</span>
									</a>
								</div>
								<div class="APP-editor-btnGrp" style="width: 86px;"></div>
								<div class="APP-editor-extOpt">
									<a class="APP-editor-extOpt-item nui-txt-link"
										href="javascript:void(0)">ƴд���</a><a
										class="APP-editor-extOpt-item nui-txt-link"
										href="javascript:void(0)" evid="1371488926967.4402">��ʵ�</a>
								</div>
								<a class="APP-editor-btn APP-editor-btn-switchFunction"
									val="basic" title="�л����򵥹���" evid="fullbasic1"
									href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-basic">�л����򵥹���</b>
								</span>
								</a>
							</div>
							<div class="APP-editor-tbar-source">
								<div class="APP-editor-btnGrp" style="width: 27px;">
									<a class="APP-editor-btn APP-editor-btn-dis" val="undo"
										title="Դ��ģʽ�²���ʹ�øù���" evd="fullundo1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-undo">����</b>
									</span>
									</a><a class="APP-editor-btn APP-editor-btn-dis" val="redo"
										title="Դ��ģʽ�²���ʹ�øù���" evd="fullredo1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-redo">����</b>
									</span>
									</a>
								</div>
								<a
									class="APP-editor-btn APP-editor-btn-spln APP-editor-btn-spln-l"
									href="javascript:void(0)"></a>
								<div class="APP-editor-btnGrp" style="width: 216px;">
									<a class="APP-editor-btn APP-editor-btn-select" val="fontname"
										title="Դ��ģʽ�²���ʹ�øù���" evd="fullfontname1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc">����</span>
									</a><a class="APP-editor-btn APP-editor-btn-select" val="fontsize"
										title="Դ��ģʽ�²���ʹ�øù���" evd="fullfontsize1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc">�ֺ�</span>
									</a><a class="APP-editor-btn" val="justify" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fulljustify1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-justify">ѡ����뷽ʽ</b>
									</span>
									</a><a class="APP-editor-btn" val="list" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fulllist1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-list">�����б�</b>
									</span>
									</a><a class="APP-editor-btn" val="indent" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullindent1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-indent">��������</b>
									</span>
									</a><a class="APP-editor-btn" val="lineheight" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fulllineheight1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-lineheight">�����и�</b>
									</span>
									</a><a class="APP-editor-btn" val="bold" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullbold1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-bold">�Ӵ�</b>
									</span>
									</a><a class="APP-editor-btn" val="italic" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullitalic1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-italic">б��</b>
									</span>
									</a><a class="APP-editor-btn" val="underline" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullunderline1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-underline">�»���</b>
									</span>
									</a><a class="APP-editor-btn" val="forecolor" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullforecolor1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-forecolor">ѡ��������ɫ</b>
									</span>
									</a><a class="APP-editor-btn" val="backcolor" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullbackcolor1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-backcolor">ѡ�����屳��</b>
									</span>
									</a><a class="APP-editor-btn" val="insertHorizontalRule"
										title="Դ��ģʽ�²���ʹ�øù���" evd="fullinsertHorizontalRule1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-insertHorizontalRule">�������</b>
									</span>
									</a><a class="APP-editor-btn" val="insertTable"
										title="Դ��ģʽ�²���ʹ�øù���" evd="fullinsertTable1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-insertTable">��ӱ��</b>
									</span>
									</a><a class="APP-editor-btn" val="removeFormat"
										title="Դ��ģʽ�²���ʹ�øù���" evd="fullremoveFormat1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-removeFormat">�����ʽ</b>
									</span>
									</a>
								</div>
								<a
									class="APP-editor-btn APP-editor-btn-spln APP-editor-btn-spln-l"
									href="javascript:void(0)"></a>
								<div class="APP-editor-btnGrp" style="width: 108px;">
									<a class="APP-editor-btn" val="image" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullimage1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-image">���ͼƬ</b>
									</span>
									</a><a class="APP-editor-btn" val="capture" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullcapture1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-capture">��ͼ</b>
									</span>
									</a><a class="APP-editor-btn" val="portrait" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullportrait1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-portrait">��ӱ���</b>
									</span>
									</a><a class="APP-editor-btn" val="link" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fulllink1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-link">����/ɾ������</b>
									</span>
									</a><a class="APP-editor-btn" val="stationery" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullstationery1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-stationery">�����ֽ</b>
									</span>
									</a><a class="APP-editor-btn" val="insertTime" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullinsertTime1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-insertTime">�������</b>
									</span>
									</a><a class="APP-editor-btn" val="sign" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullsign1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-sign">ǩ��</b>
									</span>
									</a>
								</div>
								<a
									class="APP-editor-btn APP-editor-btn-spln APP-editor-btn-spln-l"
									href="javascript:void(0)"></a>
								<div class="APP-editor-btnGrp" style="width: 24px;">
									<a class="APP-editor-btn" val="microphone" title="Դ��ģʽ�²���ʹ�øù���"
										evd="fullmicrophone1" href="javascript:void(0)"><span
										class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-microphone">��������</b>
									</span>
									</a><a
										class="APP-editor-btn APP-editor-btn-switchSource APP-editor-btn-selected"
										val="source" title="���ؿ��ӻ���ͼ" evid="sourcefull1"
										href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
											class="ico ico-editor ico-editor-source">�л���Դ�빦��</b>
									</span>
									</a>
								</div>
								<div class="APP-editor-btnGrp" style="width: 86px;"></div>
								<div class="APP-editor-extOpt">
									<a class="APP-editor-extOpt-item nui-txt-link"
										href="javascript:void(0)">ƴд���</a><a
										class="APP-editor-extOpt-item nui-txt-link"
										href="javascript:void(0)" evd="1371488926967.4402">��ʵ�</a>
								</div>
								<a class="APP-editor-btn APP-editor-btn-switchFunction"
									val="basic" title="Դ��ģʽ�²���ʹ�øù���" evd="fullbasic1"
									href="javascript:void(0)"><span class="APP-editor-btn-rc"><b
										class="ico ico-editor ico-editor-basic">�л����򵥹���</b>
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
			<b title="�����˳��༭����Tab������������Shift+Tab���ر༭��" tabindex="1"></b>
			<div class="cJ">
				<a hidefocus="hidefocus" class="js-component-link nui-txt-link"
					href="javascript:void(0)" id="_mail_link_47_354">����ѡ�� <b
					class="nui-ico">j</b>
				</a>
			</div>
			<div style="display: none" class="gm" id="divComposeOption">
				<div class="bx">
					<div class="ds">
						<span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_1_344"
							title="�����ʼ�Ͷ�����ȼ�"><span class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_70_355"></b>
						</span><span class="nui-chk-text">����</span>
						</span><span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_2_345"
							title="���û�ִ���ܣ��������˽��ռ����Ƿ��Ķ��������͵��ʼ�"><span
							class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_71_356"></b>
						</span><span class="nui-chk-text">�Ѷ���ִ</span>
						</span><span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_3_346"
							title="���ʼ������л��ɴ��ı��������޷�������飬ͼƬ�Լ�����ʧ������ɫ��"><span
							class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_72_357"></b>
						</span><span class="nui-chk-text">���ı�</span>
						</span><span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_4_347"><span
							class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_73_358"></b>
						</span><span class="nui-chk-text">��ʱ����</span>
						</span><span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_5_348"><span
							class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_74_359"></b>
						</span><span class="nui-chk-text">�ʼ�����</span>
						</span><span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_6_349"
							style="display: none"><span class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_75_360"></b>
						</span><span class="nui-chk-text">����֪ͨ�ռ���</span>
						</span><span class="js-component-checkbox nui-chk nui-chk-hasText  "
							tabindex="0" role="checkbox" id="_mail_checkbox_7_350"><span
							class="nui-chk-symbol"><b
								class="js-component-icon nui-ico nui-ico-checkbox  "
								id="_mail_icon_68_351"></b>
						</span><span class="nui-chk-text">���浽�е��Ʊʼ�</span>
						</span><a hidefocus="hidefocus" target="_blank"
							style="margin: -4px 0 0 -3px"
							class="js-component-link nui-fIBlock"
							href="http://note.youdao.com/" id="_mail_link_46_352"
							title="ʲô���е��Ʊʼ�?"><b
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
					</a><strong>�ʼ�����</strong> ��������Ҫ������ܲ鿴�ʼ�
					<div class="bi">
						<label class="G">
							���ò鿴���룺
						</label>
						<div class="js-component-input nui-smallIpt nui-ipt "
							id="_mail_input_5_363">
							<input type="text" maxlength="6" autocomplete="off"
								class="nui-ipt-input">
						</div>
						<span class="nui-txtTips">&nbsp;(������6λ���֡���ĸ�����ִ�Сд)</span>
						<p class="bj">
							<span class="js-component-checkbox nui-chk nui-chk-hasText  "
								tabindex="0" role="checkbox" id="_mail_checkbox_8_362"><span
								class="nui-chk-symbol"><b
									class="js-component-icon nui-ico nui-ico-checkbox  "
									id="_mail_icon_77_365"></b>
							</span><span class="nui-chk-text">���ѷ����ʼ��б�������</span>
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
						<strong>����֪ͨ�ռ���</strong><span class="nui-txtTips">(<span
							id="spanComposeSmsTips"></span>��<a hidefocus="hidefocus"
							target="_blank" class="js-component-link nui-txt-link"
							href="http://help.163.com/10/0720/12/6C1N7E0I00753VB8.html?sid=ADqcDCcdzlVSuJBHvEddQmOeOriHFPCG&amp;uid=wangjiuyingzui@163.com&amp;host=twebmail.mail.163.com&amp;ver=js5&amp;style=1&amp;skin=163blue&amp;color=003399"
							id="_mail_link_50_367">����ʾ��</a>)<span id="spanComposeSmsErr"></span>
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
					aria-label="�����ǩ" role="tablist" id="_mail_tab_1_389">
					<li tabindex="0" aria-selected="true" role="tab"
						class="js-component-tabitem nui-tabs-item nui-tabs-item-selected"
						id="_mail_tabitem_7_414">
						<span id="addresstext" unselectable="on"
							class="nui-tabs-item-text nui-fNoSelect">ͨѶ¼</span>
					</li>
					<li tabindex="0" aria-selected="false" role="tab"
						class="js-component-tabitem nui-tabs-item"
						id="_mail_tabitem_8_415" style="width: 95px;">
						<span id="stationerytext" unselectable="on"
							class="nui-tabs-item-text nui-fNoSelect">�� ֽ</span>
					</li>
				</ul>
				<div class="fB" id="divComposeAddress" style="">
					<div class="dM">
						<div class="js-component-input nui-ipt nui-ipt-hasIconBtn"
							id="_mail_input_7_390">
							<label class="nui-ipt-placeholder" style="">
								������ϵ��
							</label>
							<input type="text" autocomplete="off" class="nui-ipt-input">
							<span hidefocus="hidefocus" tabindex="0" class="nui-ipt-iconBtn"><b
								class="js-component-icon nui-ico nui-ico-search  "
								id="_mail_icon_80_391" title="��������"></b>
							</span>
						</div>
						<a class="cg" href="javascript:void(0)" title="���������ϵ��"
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
											<a class="ch" href="javascript:void(0)" title="����������д��"><span
												class="nui-tree-item-icon"><b
													class="nui-ico nui-ico-user nui-ico-user-other"></b>
											</span>����������д��</a>
										</li>
										<li class="nui-tree-item nui-tree-item-noChild">
											<a class="ch" href="javascript:void(0)"
												title="&quot;��&quot;&lt;wangjiuyingzui@163.com&gt;"><span
												class="nui-tree-item-icon"><b
													class="nui-ico nui-ico-user nui-ico-user-me"></b>
											</span>���Լ�дһ����</a>
										</li>
									</ul>
								</div>
								<div class="nui-tree-item nui-tree-item-isFold">
									<span class="nui-tree-item-label"><span
										class="nui-tree-item-symbol"><b title="չ��"
											class="js-component-icon nui-tree-item-symbol-fold nui-ico nui-ico-rArr  "
											id="_mail_icon_87_427"></b><b title="�۵�"
											class="js-component-icon nui-tree-item-symbol-unfold nui-ico nui-ico-dArr  "
											id="_mail_icon_88_428"></b>
									</span><span title="������ϵ��" class="nui-tree-item-text">������ϵ��(1)</span><a
										class="nui-tree-item-ext nui-txt-link"
										href="javascript:void(0)" style="display: none;">��Ӹ���</a>
									</span>
									<ul class="nui-tree">
										<li data-id="0">
											<a class="ch" href="javascript:void(0)">450383731</a>
										</li>
									</ul>
								</div>
								<div class="nui-tree-item nui-tree-item-isFold">
									<span class="nui-tree-item-label"><span
										class="nui-tree-item-symbol"><b title="չ��"
											class="js-component-icon nui-tree-item-symbol-fold nui-ico nui-ico-rArr  "
											id="_mail_icon_40_221"></b><b title="�۵�"
											class="js-component-icon nui-tree-item-symbol-unfold nui-ico nui-ico-dArr  "
											id="_mail_icon_41_222"></b>
									</span><span title="δ����" class="nui-tree-item-text">δ����(1)</span><a
										class="nui-tree-item-ext nui-txt-link"
										href="javascript:void(0)" style="display: none;">��Ӹ���</a>
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
										class="nui-tree-item-symbol"><b title="չ��"
											class="js-component-icon nui-tree-item-symbol-fold nui-ico nui-ico-rArr  "
											id="_mail_icon_42_223"></b><b title="�۵�"
											class="js-component-icon nui-tree-item-symbol-unfold nui-ico nui-ico-dArr  "
											id="_mail_icon_43_224"></b>
									</span><span title="������ϵ��" class="nui-tree-item-text">����(1)</span><a
										class="nui-tree-item-ext nui-txt-link"
										href="javascript:void(0)" style="display: none;">��Ӹ���</a>
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
							<span class="nui-btn-text">ȫ��</span><span
								class="nui-dropdownBtn-arr"><b
								class="nui-ico nui-ico-dArr"></b>
							</span>
						</div>
						<div class="js-component-button nui-btn nui-btn-hasIcon  "
							tabindex="0" role="button" id="_mail_button_67_393">
							<span class="nui-btn-icon"><b
								class="js-component-icon nui-ico nui-ico-add  "
								id="_mail_icon_81_394"></b>
							</span><span class="nui-btn-text">�Դ���ֽ</span>
						</div>
					</div>
					<div style="height: 301px;" class="bl nui-scroll"
						id="divComposeStationeryContent">
						<div class="K">
							<a class="u" title="��ʹ����ֽ" href="javascript:void(0)"><img
									class="x" src="http://mimg.127.net/p/images/letter/nonuse.gif">
							</a>
							<div class="s f">
								<b class="nui-ico i">z</b>
							</div>
						</div>
						<div class="K">
							<a class="u" title="����" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/b_free6s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="����" href="javascript:void(0)"><img
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
							<a class="u" title="����ͯ��" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/wxd_4s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="ˮ����԰" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/xh_6s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="У԰ɫ��" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/wxd_7s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="У԰����" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/xyl_8s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="ҹɫ" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/xyl_9s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="������" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/xyl_1s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="û�о���" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/hk_5s.jpg">
							</a>
						</div>
						<div class="K">
							<a class="u" title="������ɫϵ" href="javascript:void(0)"><img
									class="x"
									src="http://mimg.127.net/p/images/letter/200709/view/zt_2s.jpg">
							</a>
						</div>
					</div>
					<div class="bc" id="divComposeStationeryPage">
						<a href="javascript:void(0)">��ҳ</a>
						<div class="js-component-select nui-simpleSelect nui-select "
							tabindex="0" id="_mail_select_12_496">
							<span class="nui-select-text">1/16</span><span
								class="nui-select-arr"><b class="nui-ico nui-ico-dArr"></b>
							</span>
						</div>
						<a href="javascript:void(0)">��ҳ</a>
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
						<span class="nui-btn-text">&nbsp;�� ��&nbsp;</span>
					</div>
				</div>
				<div class="nui-toolbar-item">
					<div class="js-component-button nui-btn " tabindex="0"
						role="button" id="_mail_button_69_397">
						<span class="nui-btn-text">&nbsp;ȡ ��&nbsp;</span>
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
					<span class="nui-menu-item-text">�ӡ��Ƹ��������</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_5_460">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">�ӡ����̡����</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_6_461">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">�ӡ��������������</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_7_462">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">�ӡ��е��Ʊʼǡ����</span>
				</div>
			</div>
			<div class="nui-menu-split nui-split"></div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_8_463">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">��ק���</span>
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
				<span class="nui-menu-item-text">����Ĭ�Ϸ��������ǳ�</span>
			</div>
		</div>
	</div>
</div>