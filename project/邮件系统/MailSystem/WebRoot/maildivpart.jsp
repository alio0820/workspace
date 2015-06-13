<%@ page language="java" import="java.util.*,com.mail.*,com.web.office.bean.*" pageEncoding="gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<%
	String data = request.getParameter("data");
%>
<div hidefocus="hidefocus" class="js-component-menu nui-menu "
	tabindex="0" id="_mail_menu_search"
	style="left: auto; right: 0px; transform: translate(0px, 0px); opacity: 1; top: 40px; visibility: visible;">
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_search_01">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">包含 <span class="nui-txt-suc"><%=data%></span>
				的邮件<span class="nui-txt-tips">(全文搜索)</span>
			</span>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_search_02">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">包含 <span class="nui-txt-suc"><%=data%></span>
				的邮件<span class="nui-txt-tips">(标题+发件人)</span>
			</span>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_search_03">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">包含 <span class="nui-txt-suc"><%=data%></span>
				的附件</span>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_search_04">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">包含 <span class="nui-txt-suc"><%=data%></span>
				的联系人</span>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_search_05">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">包含 <span class="nui-txt-suc"><%=data%></span>
				的网盘文件</span>
		</div>
	</div>
	<div class="nui-menu-split nui-split"></div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_search_06">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">高级搜索...</span>
		</div>
	</div>
</div>

<div hidefocus="hidefocus" class="js-component-menu nui-menu " tabindex="0" id="_mail_menu_view"
	style="opacity: 1; left: 517px; top: 126px; visibility: visible; transform: translate(0px, 0px);">
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_4_184">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">全部</span>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_5_185">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-icon"><b
				class="js-component-icon nui-ico nui-ico-unread  "
				id="_mail_icon_30_186"></b>
			</span><span class="nui-menu-item-text">未读邮件</span>
		</div>
	</div>
	<div
		class="js-component-menuitem nui-menu-item nui-menu-item-hasSubMenu"
		tabindex="-1" id="_mail_menuitem_6_187">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">其他状态</span><span
				class="nui-menu-item-arr"><b class="nui-ico nui-ico-rArr">r</b>
			</span>
		</div>
		<div hidefocus="hidefocus" class="js-component-menu nui-menu "
			tabindex="0" id="_mail_menu_19_244"
			style="transform: translate(0px, 0px); opacity: 1; visibility: hidden; top: 0px; display: none;">
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_32_245">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">已读</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_33_246">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-re  "
						id="_mail_icon_48_247"></b>
					</span><span class="nui-menu-item-text">已回复</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_34_248">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-fw  "
						id="_mail_icon_49_249"></b>
					</span><span class="nui-menu-item-text">已转发</span>
				</div>
			</div>
		</div>
	</div>
	<div class="nui-menu-split nui-split"></div>
	<div
		class="js-component-menuitem nui-menu-item nui-menu-item-hasSubMenu"
		tabindex="-1" id="_mail_menuitem_7_188">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">附件</span><span
				class="nui-menu-item-arr"><b class="nui-ico nui-ico-rArr">r</b>
			</span>
		</div>
		<div hidefocus="hidefocus" class="js-component-menu nui-menu "
			tabindex="0" id="_mail_menu_18_238"
			style="opacity: 1; visibility: hidden; top: 0px; transform: translate(0px, 0px); display: none;">
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_29_239">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-att  "
						id="_mail_icon_46_240"></b>
					</span><span class="nui-menu-item-text">普通附件</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_30_241">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-bigAtt  "
						id="_mail_icon_47_242"></b>
					</span><span class="nui-menu-item-text">云附件</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_31_243">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">无附件</span>
				</div>
			</div>
		</div>
	</div>
	<div
		class="js-component-menuitem nui-menu-item nui-menu-item-hasSubMenu"
		tabindex="-1" id="_mail_menuitem_8_189">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">排序</span><span
				class="nui-menu-item-arr"><b class="nui-ico nui-ico-rArr">r</b>
			</span>
		</div>
		<div hidefocus="hidefocus" class="js-component-menu nui-menu "
			tabindex="0" id="_mail_menu_12_198"
			style="transform: translate(0px, 0px); opacity: 1; visibility: hidden; top: 0px; display: none;">
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_12_199">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-radio nui-ico-radio-checked"
						id="_mail_icon_32_200"></b>
					</span><span class="nui-menu-item-text">按时间从新到旧</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_13_201">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-radio"
						id="_mail_icon_33_202"></b>
					</span><span class="nui-menu-item-text">按时间从旧到新</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_14_203">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-radio"
						id="_mail_icon_34_204"></b>
					</span><span class="nui-menu-item-text">按发件人降序</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_15_205">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-radio"
						id="_mail_icon_35_206"></b>
					</span><span class="nui-menu-item-text">按发件人升序</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_16_207">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-radio"
						id="_mail_icon_36_208"></b>
					</span><span class="nui-menu-item-text">按主题降序</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_17_209">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-radio"
						id="_mail_icon_37_210"></b>
					</span><span class="nui-menu-item-text">按主题升序</span>
				</div>
			</div>
		</div>
	</div>
	<div class="nui-menu-split nui-split"></div>
	<div class="js-component-menuitem txt-flag1 nui-menu-item"
		tabindex="-1" id="_mail_menuitem_9_190">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-icon"><b
				class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-1  "
				id="_mail_icon_31_191"></b>
			</span><span class="nui-menu-item-text">红旗</span>
		</div>
	</div>
	<div
		class="js-component-menuitem nui-menu-item nui-menu-item-hasSubMenu"
		tabindex="-1" id="_mail_menuitem_10_192">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">其他旗帜</span><span
				class="nui-menu-item-arr"><b class="nui-ico nui-ico-rArr">r</b>
			</span>
		</div>
		<div hidefocus="hidefocus" class="js-component-menu nui-menu "
			tabindex="0" id="_mail_menu_17_221"
			style="transform: translate(0px, 0px); opacity: 1; visibility: hidden; top: 0px; display: none;">
			<div class="js-component-menuitem txt-flag2 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_21_222">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-2  "
						id="_mail_icon_38_223"></b>
					</span><span class="nui-menu-item-text">绿旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag3 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_22_224">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-3  "
						id="_mail_icon_39_225"></b>
					</span><span class="nui-menu-item-text">橙旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag4 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_23_226">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-4  "
						id="_mail_icon_40_227"></b>
					</span><span class="nui-menu-item-text">蓝旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag5 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_24_228">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-5  "
						id="_mail_icon_41_229"></b>
					</span><span class="nui-menu-item-text">粉旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag6 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_25_230">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-6  "
						id="_mail_icon_42_231"></b>
					</span><span class="nui-menu-item-text">青旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag7 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_26_232">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-7  "
						id="_mail_icon_43_233"></b>
					</span><span class="nui-menu-item-text">黄旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag8 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_27_234">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-8  "
						id="_mail_icon_44_235"></b>
					</span><span class="nui-menu-item-text">紫旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag15 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_28_236">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-15  "
						id="_mail_icon_45_237"></b>
					</span><span class="nui-menu-item-text">灰旗</span>
				</div>
			</div>
		</div>
	</div>
	<div class="nui-menu-split nui-split"></div>
	<div
		class="js-component-menuitem nui-menu-item nui-menu-item-hasSubMenu"
		tabindex="-1" id="_mail_menuitem_11_193">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">优先级</span><span
				class="nui-menu-item-arr"><b class="nui-ico nui-ico-rArr">r</b>
			</span>
		</div>
		<div hidefocus="hidefocus" class="js-component-menu nui-menu "
			tabindex="0" id="_mail_menu_16_217"
			style="transform: translate(0px, 0px); opacity: 1; visibility: hidden; top: 0px; display: none;">
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_18_218">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">紧急</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_19_219">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">普通</span>
				</div>
			</div>
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_20_220">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">缓慢</span>
				</div>
			</div>
		</div>
	</div>
</div>
<div hidefocus="hidefocus" class="js-component-menu nui-menu " tabindex="0" id="_mail_menu_moveto"
	style="opacity: 1; left: 450px; top: 126px; visibility: visible; transform: translate(0px, 0px);">
	<div class="nui-menu-scroll nui-scroll">
		<div class="js-component-menuitem nui-menu-item" tabindex="-1"
			id="_mail_menuitem_168_664">
			<div class="nui-menu-item-link">
				<span class="nui-menu-item-text">草稿箱</span>
			</div>
		</div>
		<div class="js-component-menuitem nui-menu-item" tabindex="-1"
			id="_mail_menuitem_169_665">
			<div class="nui-menu-item-link">
				<span class="nui-menu-item-text">已发送</span>
			</div>
		</div>
		<div class="js-component-menuitem nui-menu-item" tabindex="-1"
			id="_mail_menuitem_170_666">
			<div class="nui-menu-item-link">
				<span class="nui-menu-item-text">已删除</span>
			</div>
		</div>
		<div class="js-component-menuitem nui-menu-item" tabindex="-1"
			id="_mail_menuitem_171_667">
			<div class="nui-menu-item-link">
				<span class="nui-menu-item-text">订阅邮件</span>
			</div>
		</div>
		<div class="js-component-menuitem nui-menu-item" tabindex="-1"
			id="_mail_menuitem_172_668">
			<div class="nui-menu-item-link">
				<span class="nui-menu-item-text">广告邮件</span>
			</div>
		</div>
		<div class="js-component-menuitem nui-menu-item" tabindex="-1"
			id="_mail_menuitem_173_669">
			<div class="nui-menu-item-link">
				<span class="nui-menu-item-text">垃圾邮件</span>
			</div>
		</div>
		<div class="js-component-menuitem nui-menu-item" tabindex="-1"
			id="_mail_menuitem_174_670">
			<div class="nui-menu-item-link">
				<span class="nui-menu-item-text">客户端删信</span>
			</div>
		</div>
		<div class="nui-menu-split nui-split"></div>
		<div class="js-component-menuitem nui-menu-item" tabindex="-1"
			id="_mail_menuitem_175_671">
			<div class="nui-menu-item-link">
				<span class="nui-menu-item-text">已删除邮件</span>
			</div>
		</div>
	</div>
	<div class="nui-menu-split nui-split"></div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_176_672">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">新建文件夹并移动</span>
		</div>
	</div>
</div>
<div hidefocus="hidefocus" class="js-component-menu nui-menu " tabindex="0" id="_mail_menu_markas"
	style="opacity: 1; left: 383px; top: 126px; visibility: visible; transform: translate(0px, 0px);">
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_177_673">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">已读</span>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_178_674">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-icon"><b
				class="js-component-icon nui-ico nui-ico-unread  "
				id="_mail_icon_134_675"></b>
			</span><span class="nui-menu-item-text">未读</span>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_179_676">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">全部设为已读</span>
		</div>
	</div>
	<div class="nui-menu-split nui-split"></div>
	<div class="js-component-menuitem txt-flag1 nui-menu-item"
		tabindex="-1" id="_mail_menuitem_180_677">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-icon"><b
				class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-1  "
				id="_mail_icon_135_678"></b>
			</span><span class="nui-menu-item-text">红旗</span>
		</div>
	</div>
	<div
		class="js-component-menuitem nui-menu-item nui-menu-item-hasSubMenu"
		tabindex="-1" id="_mail_menuitem_181_679">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-icon"><b
				class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-0  "
				id="_mail_icon_136_680"></b>
			</span><span class="nui-menu-item-text">其他旗帜</span><span
				class="nui-menu-item-arr"><b class="nui-ico nui-ico-rArr">r</b>
			</span>
		</div>
		<div hidefocus="hidefocus" class="js-component-menu nui-menu "
			tabindex="0" id="_mail_menu_83_685"
			style="transform: translate(0px, 0px); opacity: 1; visibility: visible; top: -93px;">
			<div class="js-component-menuitem txt-flag2 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_186_686">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-2  "
						id="_mail_icon_137_687"></b>
					</span><span class="nui-menu-item-text">绿旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag3 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_187_688">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-3  "
						id="_mail_icon_138_689"></b>
					</span><span class="nui-menu-item-text">橙旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag4 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_188_690">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-4  "
						id="_mail_icon_139_691"></b>
					</span><span class="nui-menu-item-text">蓝旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag5 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_189_692">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-5  "
						id="_mail_icon_140_693"></b>
					</span><span class="nui-menu-item-text">粉旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag6 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_190_694">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-6  "
						id="_mail_icon_141_695"></b>
					</span><span class="nui-menu-item-text">青旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag7 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_191_696">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-7  "
						id="_mail_icon_142_697"></b>
					</span><span class="nui-menu-item-text">黄旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag8 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_192_698">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-8  "
						id="_mail_icon_143_699"></b>
					</span><span class="nui-menu-item-text">紫旗</span>
				</div>
			</div>
			<div class="js-component-menuitem txt-flag15 nui-menu-item"
				tabindex="-1" id="_mail_menuitem_193_700">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-icon"><b
						class="js-component-icon nui-ico nui-ico-flag  nui-ico-flag-15  "
						id="_mail_icon_144_701"></b>
					</span><span class="nui-menu-item-text">灰旗</span>
				</div>
			</div>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_182_681">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">取消旗帜</span>
		</div>
	</div>
	<div class="nui-menu-split nui-split"></div>
	<div
		class="js-component-menuitem nui-menu-item nui-menu-item-hasSubMenu"
		tabindex="-1" id="_mail_menuitem_183_682">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">标签</span><span
				class="nui-menu-item-arr"><b class="nui-ico nui-ico-rArr">r</b>
			</span>
		</div>
		<div hidefocus="hidefocus" class="js-component-menu nui-menu "
			tabindex="0" id="_mail_menu_84_702"
			style="transform: translate(0px, 0px); opacity: 1; visibility: hidden; top: 0px; display: none;">
			<div class="js-component-menuitem nui-menu-item" tabindex="-1"
				id="_mail_menuitem_194_703">
				<div class="nui-menu-item-link">
					<span class="nui-menu-item-text">新建标签并标记</span>
				</div>
			</div>
		</div>
	</div>
	<div class="nui-menu-split nui-split"></div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_184_683">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">置顶邮件</span>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_185_684">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">取消置顶</span>
		</div>
	</div>
</div>
<div hidefocus="hidefocus" class="js-component-menu nui-menu " tabindex="0" id="_mail_menu_checkall"
	style="opacity: 1; left: 211px; top: 126px; visibility: visible; transform: translate(0px, 0px);">
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_195_704">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">全选</span>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_196_705">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">不选</span>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_197_706">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">附件</span>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_198_707">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">反选</span>
		</div>
	</div>
	<div class="nui-menu-split nui-split"></div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_199_708">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">未读</span>
		</div>
	</div>
	<div class="js-component-menuitem nui-menu-item" tabindex="-1"
		id="_mail_menuitem_200_709">
		<div class="nui-menu-item-link">
			<span class="nui-menu-item-text">已读</span>
		</div>
	</div>
</div>
