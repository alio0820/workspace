<%@ page language="java" import="java.util.*,com.mail.*,javax.mail.Folder;" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
  	<base href="<%=basePath%>">
    <title>Office�칫�����-BETA</title>
    <link rel="icon" href="images/fruit_mail.ico" type="image/x-icon"/>
    <link type="text/css" rel="stylesheet" href="css/mail.css"/>
    <link type="text/css" rel="stylesheet" href="css/list.css"/>
    <link type="text/css" rel="stylesheet" href="css/info.css"/>
    <link type="text/css" rel="stylesheet" href="css/compose.css"/>            
    <script src="js/jquery-1.7.1.js"></script> 
    <script src="js/lhgdialog/lhgdialog.min.js"></script>
    <script src="js/mail.js"></script>
<!--    <script src="include/RSH/dhtmlHistory.js"></script>-->
    <script src="dwr/engine.js"></script>
	<script src="dwr/util.js"></script>
	<script src="dwr/interface/MailAction.js"></script>
	<script src="dwr/interface/SendMailAction.js"></script>
	<%IMAPGetMail.initMail(session); %>
  </head>
  <body>
<!--    <header id="mailHead">-->
<!--    	<div class="top1"><img src="images/mail_01_01.gif"></img></div>-->
<!--    	<div class="top2"><img src="images/mail_02.gif"></img></div>-->
<!--    	<div class="top3"></div>-->
<!--    </header>-->
		<header id="dvFrameTop" class="frame-top">
			<div class="qp">
				<h1 onclick="JS5.go({module:'welcome.WelcomeModule'})" id="h1Logo"
					class="pP ou">
					<a class="ow" href="javascript:void(0);"><img border="0"
							id="imgLogo" alt="office�������"
							src="images/officelogo.gif">
					</a>
				</h1>
				<ul role="navigation" class="js-component-component qj"
					id="_mail_component_3_3">
					<li class="js-component-component mP" id="_mail_component_5_5">
						<a class="js-component-component nui-txt-link ir" href="#"
							id="_mail_component_1_1"><span id="spnUid">wangjiuyingzui@163.com</span><span
							id="_account_wangjiuyingzui@163.com" class="gI"></span><b
							class="js-component-icon fn-bg nui-ico nui-ico-dArr  "
							id="_mail_icon_0_0"></b>
						</a>
						<div
							onclick="Nav.entry('OptionInterface',{module:'LinkModule',linkName:'mobile_set_option'});"
							title="һ��˫�ţ�ʹ�á��ֻ�����@163.com��Ҳ�ܵ�¼���շ��ʼ���" class="rb nui-fIBlock">
							<b class="nui-ico nui-ico-phone nui-ico-phone-disabled"></b>
						</div>
						<div id="dvWebimEntry" style="display: none"
							class="he nui-fIBlock">
							<span><span class="APP-webIM" style="display: none;"
								id="spnIMInfo"><span class="oj">|</span><span
									class="webIM-tinfo" id="spnOnlineInfo_new"><a
										title="���ڵ�¼" class="Alogin" href="javascript:void(0)"></a>
								</span>
							</span>
							</span><span id="spnChatWith"></span>
						</div>
					</li>
					<li class="js-component-component oj" id="_mail_component_7_7">
						|
					</li>
					<li class="js-component-component oK" id="_mail_component_9_9">
						<a class="oH nui-txt-link" href="javascript:void(0);">����</a>
					</li>
					<li class="js-component-component oj" id="_mail_component_11_11">
						|
					</li>
					<li class="js-component-component oK" id="_mail_component_13_13">
						<a class="oH nui-txt-link" href="javascript:void(0);">����</a>
					</li>
					<li class="js-component-component oj" id="_mail_component_15_15">
						|
					</li>
					<li class="js-component-component oK" id="_mail_component_17_17">
						<a class="oH nui-txt-link" href="javascript:void(0);">����<b
							class="nui-ico nui-ico-dArr fn-bg">d</b>
						</a>
					</li>
					<li class="js-component-component oj" id="_mail_component_20_20">
						|
					</li>
					<li class="js-component-component oK" id="_mail_component_22_22">
						<a class="oH nui-txt-link" href="javascript:void(0);">�˳�</a>
					</li>
				</ul>
				<div role="search" class="js-component-component pu"
					id="_mail_component_search">
					<div class="js-component-input nui-ipt nui-ipt-hasIconBtn  "
						id="_mail_input_search">
						<label class="nui-ipt-placeholder">
							֧���ʼ�ȫ������
						</label>
						<input type="text" x-webkit-speech="" autocomplete="off"
							class="nui-ipt-input">
						<span hidefocus="hidefocus" tabindex="0" class="nui-ipt-iconBtn"><b
							class="js-component-icon nui-ico nui-ico-dArr  "
							id="_mail_icon_2_28"></b>
						</span>
					</div>
					<div
						class="js-component-button nui-inputMainBtn nui-inputBtn nui-mainBtn nui-btn "
						tabindex="0" role="button" id="_mail_button_0_29">
						<span class="nui-btn-text"><b
							class="js-component-icon nui-ico nui-ico-frameSearch  "
							id="_mail_icon_1_24"></b>
						</span>
					</div>
				</div>
				<div style="" class="APP-music ox" id="divMusic">
					<b title="�����������ֺ�" class="APP-music-logo"></b>
					<div style="display: none;" class="APP-music-box"
						id="divMusicPlayer"></div>
				</div>
			</div>
			<nav role="navigation" id="dvTab" class="qq">
				<h1 class="pB">
					�����ǩ
				</h1>
				<ul class="js-component-tab qd nui-tabs " aria-label="�����ǩ"
					role="tablist" id="_mail_tab_0_95">
					<li title="��ҳ" tabindex="0" aria-selected="false" role="tab"
						class="js-component-tabitem qa lW nui-tabs-item"
						id="_mail_tabitem_0_96" style="width: 91px;">
						<span id="_mail_tabitem_0_96text" unselectable="on"
							class="nui-tabs-item-text nui-fNoSelect">��ҳ</span>
					</li>
					<li title="ͨѶ¼" tabindex="0" aria-selected="false" role="tab"
						class="js-component-tabitem qa lW nui-tabs-item"
						id="_mail_tabitem_1_97" style="width: 91px;">
						<span id="_mail_tabitem_1_97text" unselectable="on"
							class="nui-tabs-item-text nui-fNoSelect">ͨѶ¼</span>
					</li>
					<li title="����Ӧ��" tabindex="0" aria-selected="false" role="tab"
						class="js-component-tabitem qa lW nui-tabs-item"
						id="_mail_tabitem_2_98" style="width: 91px;">
						<span id="_mail_tabitem_2_98text" unselectable="on"
							class="nui-tabs-item-text nui-fNoSelect">����Ӧ��</span>
					</li>
					<li title="�ռ���" tabindex="0" aria-selected="false" role="tab"
						class="js-component-tabitem qa lW nui-tabs-item "
						id="_mail_tabitem_6_196" style="width: 91px;">
						<span id="_mail_tabitem_6_196text" unselectable="on"
							class="nui-tabs-item-text nui-fNoSelect">�ռ���</span>
					</li>
					<li title="����鿴����" tabindex="0" aria-selected="false" role="tab"
						class="js-component-tabitem qa ok nui-tabs-item "
						id="_mail_tabitem_4_100">
						<span id="_mail_tabitem_4_100text" unselectable="on"
							class="nui-tabs-item-text nui-fNoSelect"></span><b
							class="js-component-icon fn-bg nui-ico nui-ico-dArr  "
							id="_mail_icon_15_101"></b>
					</li>
				</ul>
				<div class="pv"></div>
			</nav>
		</header>
		<section class="frame-main" aria-labeledby="h1MainTitle" role="tabpanel">
	    <h1 id="h1MainTitle" class="frame-main-title">�ռ���</h1>
<!--	    <div id="mailTree" style="position:absolute;top:0;bottom:0;width:201px;box-shadow: 0 0 1px #F8F8F8 inset;">-->
<!--	    	<img src="images/mail_03.gif"></img>-->
<!--	    </div>-->
		<div id="dvFrameMainNav" class="frame-main-nav">
			<nav aria-labeledby="dvNavTitle" role="navigation" class="qr">
				<h1 id="dvNavTitle" tabindex="0" class="pC">
					��ർ��
				</h1>
				<div id="dvNavTop" class="pQ">
					<ul class="js-component-component qf" id="_mail_component_88_88">
						<li hidefocus="hidefocus" role="button" tabindex="0"
							class="js-component-component og kj" id="_mail_component_90_90">
							<span class="kS"><b class="nui-ico fn-bg fG"></b>
							</span><span class="kT">�� ��</span>
						</li>
						<li hidefocus="hidefocus" role="button" tabindex="0"
							class="js-component-component og jy" id="_mail_component_92_92">
							<span class="kS"><b class="nui-ico fn-bg ep"></b>
							</span><span class="kT">д ��</span>
						</li>
					</ul>
				</div>
				<div id="navtree" class="pj nui-scroll">
					<ul aria-label="��ർ��" role="tree"
						class="js-component-tree nui-tree" id="_mail_tree_0_32">
						<li class="js-component-tree nui-tree-item" id="_mail_tree_1_33">
							<div aria-checked="true" role="treeitem" hidefocus="hidefocus"
								tabindex="0"
								class="js-component-component nui-tree-item-label"
								id="_mail_component_34_34">
								<span class="nui-tree-item-text" title="�ռ���">�ռ���</span>&nbsp;
								<strong id="_mail_tree_1_33count" class="nui-tree-item-count">
								<%
									Folder folder = (Folder)session.getAttribute("folder");
									if(folder.getUnreadMessageCount()!=0) 
										out.println("("+folder.getUnreadMessageCount()+")");
								%>
								</strong>
							</div>
						</li>
						<li class="js-component-tree nui-tree-item" id="_mail_tree_2_36">
							<div aria-checked="false" role="treeitem" hidefocus="hidefocus"
								tabindex="0" class="js-component-component nui-tree-item-label"
								id="_mail_component_38_38">
								<span class="nui-tree-item-text" title="�����ʼ�">�����ʼ�&nbsp;<b
									class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-1  "
									id="_mail_icon_4_37"></b>
								</span>&nbsp;
								<strong id="_mail_tree_2_36count" class="nui-tree-item-count"></strong>
							</div>
						</li>
						<li class="js-component-tree nui-tree-item" id="_mail_tree_3_40">
							<div aria-checked="false" role="treeitem" hidefocus="hidefocus"
								tabindex="0" class="js-component-component nui-tree-item-label"
								id="_mail_component_41_41">
								<span class="nui-tree-item-text" title="�ݸ���">�ݸ���</span>&nbsp;
								<strong id="_mail_tree_3_40count" class="nui-tree-item-count"></strong>
							</div>
						</li>
						<li class="js-component-tree nui-tree-item" id="_mail_tree_4_43">
							<div aria-checked="false" role="treeitem" hidefocus="hidefocus"
								tabindex="0" class="js-component-component nui-tree-item-label"
								id="_mail_component_44_44">
								<span class="nui-tree-item-text" title="�ѷ���">�ѷ���</span>&nbsp;
								<strong id="_mail_tree_4_43count" class="nui-tree-item-count"></strong>
							</div>
						</li>
						<li class="js-component-tree nui-tree-item" id="_mail_tree_5_46"
							style="display: none">
							<div aria-checked="false" role="treeitem" hidefocus="hidefocus"
								tabindex="0" class="js-component-component nui-tree-item-label"
								id="_mail_component_47_47">
								<span class="nui-tree-item-text" title="��ɾ��">��ɾ��</span>&nbsp;
								<strong id="_mail_tree_5_46count" class="nui-tree-item-count"></strong>
							</div>
						</li>
						<li class="js-component-tree nui-tree-item" id="_mail_tree_6_49"
							style="display: none">
							<div aria-checked="false" role="treeitem" hidefocus="hidefocus"
								tabindex="0" class="js-component-component nui-tree-item-label"
								id="_mail_component_50_50">
								<span class="nui-tree-item-text" title="�����ʼ�">�����ʼ�</span>&nbsp;
								<strong id="_mail_tree_6_49count" class="nui-tree-item-count"></strong>
							</div>
						</li>
						<li class="js-component-tree nui-tree-item" id="_mail_tree_7_52"
							style="display: none">
							<div aria-checked="false" role="treeitem" hidefocus="hidefocus"
								tabindex="0" class="js-component-component nui-tree-item-label"
								id="_mail_component_53_53">
								<span class="nui-tree-item-text" title="����ʼ�">����ʼ�</span>&nbsp;
								<strong id="_mail_tree_7_52count" class="nui-tree-item-count"></strong>
							</div>
						</li>
						<li class="js-component-tree nui-tree-item" id="_mail_tree_8_55"
							style="display: none">
							<div aria-checked="false" role="treeitem" hidefocus="hidefocus"
								tabindex="0" class="js-component-component nui-tree-item-label"
								id="_mail_component_56_56">
								<span class="nui-tree-item-text" title="�����ʼ�">�����ʼ�</span>&nbsp;
								<strong id="_mail_tree_8_55count" class="nui-tree-item-count"></strong>
							</div>
						</li>
						<li class="js-component-tree nui-tree-item" id="_mail_tree_9_58"
							style="display: none">
							<div aria-checked="false" role="treeitem" hidefocus="hidefocus"
								tabindex="0" class="js-component-component nui-tree-item-label"
								id="_mail_component_60_60">
								<span class="nui-tree-item-text" title="�ͻ���ɾ��">�ͻ���ɾ��</span>&nbsp;
								<strong id="_mail_tree_9_58count" class="nui-tree-item-count"></strong><span
									class="nui-tree-item-ext"><b title="���"
									class="js-component-icon nui-ico nui-ico-empty  "
									id="_mail_icon_5_59" role="link" tabindex="0"></b>
								</span>
							</div>
						</li>
						<li class="js-component-tree nui-tree-item" id="_mail_tree_10_62"
							style="display: none">
							<div aria-checked="false" role="treeitem" hidefocus="hidefocus"
								tabindex="0" class="js-component-component nui-tree-item-label"
								id="_mail_component_63_63">
								<span class="nui-tree-item-text" title="��ɾ���ʼ�">��ɾ���ʼ�</span>&nbsp;
								<strong id="_mail_tree_10_62count" class="nui-tree-item-count"></strong>
							</div>
						</li>
						<li
							class="js-component-tree nui-tree-item nui-tree-item-isUnfold"
							id="_mail_tree_11_65">
							<div role="treeitem" hidefocus="hidefocus" tabindex="0"
								class="js-component-component nui-tree-item-label"
								id="_mail_component_68_68" aria-haspopup="true"
								aria-expanded="true">
								<span class="nui-tree-item-symbol"><b
									class="nui-tree-item-symbol-fold nui-ico nui-ico-rArr fn-bg"></b><b
									class="nui-tree-item-symbol-unfold nui-ico nui-ico-dArr fn-bg" style='display:none'></b>
								</span><span class="nui-tree-item-text"><span
									id="spnHideFolders">����6���ļ���</span>
								</span>&nbsp;
								<strong style="display: none;" id="_mail_tree_11_65count"
									class="nui-tree-item-count"></strong><span
									class="nui-tree-item-ext"><b title="�½��ļ���"
									class="js-component-icon nui-ico nui-ico-plus  "
									id="_mail_icon_6_66" role="link" tabindex="0"></b><b
									title="����鿴����"
									class="js-component-icon nui-ico nui-ico-option  "
									id="_mail_icon_7_67" role="link" tabindex="0"></b>
								</span>
							</div>
							<ul aria-label="��ർ��" role="tree" class="nui-tree" style="">
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_19_129" style="display: none">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_130_130">
										<span class="nui-tree-item-text" title="�ռ���">�ռ���</span>&nbsp;
										<strong id="_mail_tree_19_129count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_20_132" style="display: none">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_134_134">
										<span class="nui-tree-item-text" title="�����ʼ�">�����ʼ�&nbsp;<b
											class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-1  "
											id="_mail_icon_21_133"></b>
										</span>&nbsp;
										<strong id="_mail_tree_20_132count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_21_136" style="display: none">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_137_137">
										<span class="nui-tree-item-text" title="�ݸ���">�ݸ���</span>&nbsp;
										<strong id="_mail_tree_21_136count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_22_139" style="display: none">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_140_140">
										<span class="nui-tree-item-text" title="�ѷ���">�ѷ���</span>&nbsp;
										<strong id="_mail_tree_22_139count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_23_142">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_143_143">
										<span class="nui-tree-item-text" title="��ɾ��">��ɾ��</span>&nbsp;
										<strong id="_mail_tree_23_142count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_24_145">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_146_146">
										<span class="nui-tree-item-text" title="�����ʼ�">�����ʼ�</span>&nbsp;
										<strong id="_mail_tree_24_145count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_25_148">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_149_149">
										<span class="nui-tree-item-text" title="����ʼ�">����ʼ�</span>&nbsp;
										<strong id="_mail_tree_25_148count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_26_151">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_152_152">
										<span class="nui-tree-item-text" title="�����ʼ�">�����ʼ�</span>&nbsp;
										<strong id="_mail_tree_26_151count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_27_154">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_156_156">
										<span class="nui-tree-item-text" title="�ͻ���ɾ��">�ͻ���ɾ��</span>&nbsp;
										<strong id="_mail_tree_27_154count"
											class="nui-tree-item-count"></strong><span
											class="nui-tree-item-ext"><b title="���"
											class="js-component-icon nui-ico nui-ico-empty  "
											id="_mail_icon_22_155" role="link" tabindex="0"></b>
										</span>
									</div>
								</li>
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_28_158">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_159_159">
										<span class="nui-tree-item-text" title="��ɾ���ʼ�">��ɾ���ʼ�</span>&nbsp;
										<strong id="_mail_tree_28_158count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
							</ul>
						</li>
						<li class="js-component-tree nui-tree-item" id="_mail_tree_12_73">
							<div aria-checked="false" role="treeitem" hidefocus="hidefocus"
								tabindex="0" class="js-component-component nui-tree-item-label"
								id="_mail_component_76_76">
								<span class="nui-tree-item-text">�ʼ���ǩ</span>&nbsp;
								<strong id="_mail_tree_12_73count" class="nui-tree-item-count"></strong><span
									class="nui-tree-item-ext"><b title="��ӱ�ǩ"
									class="js-component-icon nui-ico nui-ico-plus  "
									id="_mail_icon_8_74" role="link" tabindex="0"></b><b
									title="�����ǩ"
									class="js-component-icon nui-ico nui-ico-option  "
									id="_mail_icon_9_75" role="link" tabindex="0"></b>
								</span>
							</div>
						</li>
						<li class="js-component-tree mS nui-tree-item"
							id="_mail_tree_13_78">
							<div aria-checked="false" role="treeitem" hidefocus="hidefocus"
								tabindex="0" class="js-component-component nui-tree-item-label"
								id="_mail_component_82_82">
								<span class="nui-tree-item-text">��������</span>&nbsp;
								<strong id="_mail_tree_13_78count" class="nui-tree-item-count"></strong><span
									class="nui-tree-item-ext"><b title="��ȡȫ��������ʼ�"
									class="js-component-icon nui-ico nui-ico-receive  "
									id="_mail_icon_10_79" role="link" tabindex="0"></b><b
									title="�½���������"
									class="js-component-icon nui-ico nui-ico-plus  "
									id="_mail_icon_11_80" role="link" tabindex="0"></b><b
									title="������������"
									class="js-component-icon nui-ico nui-ico-option  "
									id="_mail_icon_12_81" role="link" tabindex="0"></b>
								</span>
							</div>
						</li>
						<li
							class="js-component-tree nui-tree-item nui-tree-item-isUnfold"
							id="_mail_tree_14_84">
							<div role="treeitem" hidefocus="hidefocus" tabindex="0"
								class="js-component-component nui-tree-item-label"
								id="_mail_component_86_86" aria-haspopup="true"
								aria-expanded="true">
								<span class="nui-tree-item-symbol"><b
									class="nui-tree-item-symbol-fold nui-ico nui-ico-rArr fn-bg"></b><b
									class="nui-tree-item-symbol-unfold nui-ico nui-ico-dArr fn-bg" style='display:none'></b>
								</span><span class="nui-tree-item-text">�ļ�����</span>&nbsp;
								<strong style="display: none;" id="_mail_tree_14_84count"
									class="nui-tree-item-count"></strong><span
									class="nui-tree-item-ext"><b title="�����ļ�����"
									class="js-component-icon nui-ico nui-ico-option  "
									id="_mail_icon_13_85" role="link" tabindex="0"></b>
								</span>
							</div>
							<ul aria-label="��ർ��" role="tree" class="nui-tree" style="">
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_15_102">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_103_103">
										<span class="nui-tree-item-text" title="����">����</span>&nbsp;
										<strong id="_mail_tree_15_102count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_16_105">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_106_106">
										<span class="nui-tree-item-text" title="����">����</span>&nbsp;
										<strong id="_mail_tree_16_105count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_17_108">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_109_109">
										<span class="nui-tree-item-text" title="�Ƹ���">�Ƹ���</span>&nbsp;
										<strong id="_mail_tree_17_108count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
								<li class="js-component-tree nui-tree-item"
									id="_mail_tree_18_111">
									<div aria-checked="false" role="treeitem"
										hidefocus="hidefocus" tabindex="0"
										class="js-component-component nui-tree-item-label"
										id="_mail_component_112_112">
										<span class="nui-tree-item-text" title="���">���</span>&nbsp;
										<strong id="_mail_tree_18_111count"
											class="nui-tree-item-count"></strong>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		<section id="secContent" class="frame-main-cont" role="main">
				<div id="dvContainer">			
					<div id="_dvModuleContainer_mbox.ListModule_1" style=""></div>
				</div>
			</section>
    </section>
  </body>
</html>
