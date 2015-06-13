<%@ page language="java" import="java.util.*,com.mail.*,com.web.office.bean.*,javax.mail.Folder;" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<%
	int currentpage = Integer.parseInt(request.getParameter("currentpage"));
//	System.out.println(currentpage+"---------------------------------000");
//	System.out.println(session.getAttribute("totalpage")+"---------------------------------");
	int totalpage = Integer.parseInt(session.getAttribute("totalpage").toString());
	List<MailInfoBean> list = IMAPGetMail.getMailList(session,currentpage);
	int max = list.size();
 %>
<header id="1365694196651_Header" class="frame-main-cont-head">
	<div class="js-component-toolbar nui-toolbar " id="_mail_toolbar_3_361">
		<div class="nui-toolbar-item">
			<div
				class="js-component-button nui-dropdownBtn nui-btn nui-btn-hasOnlyIcon nui-dropdownBtn-hasOnlyIcon  "
				tabindex="0" role="button" id="tool_checkall_<%=currentpage%>">
				<span class="nui-btn-icon"><span
					class="js-component-checkbox nui-chk " tabindex="0"
					role="checkbox" id="_mail_checkbox_<%=currentpage%>"><span
						class="nui-chk-symbol"><b
							class="js-component-icon nui-ico nui-ico-checkbox  "
							id="_mail_icon_60_364"></b>
					</span>
				</span>
				</span><span class="nui-btn-text"></span><span
					class="nui-dropdownBtn-arr"><b
					class="nui-ico nui-ico-dArr"></b>
				</span>
			</div>
		</div>
		<div class="nui-toolbar-item">
			<div class="js-component-button nui-btn " tabindex="0"
				role="button" id="tool_delete_<%=currentpage%>">
				<span class="nui-btn-text">删 除</span>
			</div>
		</div>
		<div class="nui-toolbar-item">
			<div class="js-component-button nui-btn " tabindex="0"
				role="button" id="tool_inform_<%=currentpage%>">
				<span class="nui-btn-text">举 报</span>
			</div>
		</div>
		<div class="nui-toolbar-item">
			<div class="js-component-button nui-dropdownBtn nui-btn "
				tabindex="0" role="button" id="tool_markas_<%=currentpage%>">
				<span class="nui-btn-text">标记为</span><span
					class="nui-dropdownBtn-arr"><b
					class="nui-ico nui-ico-dArr"></b>
				</span>
			</div>
			<div class="js-component-button nui-dropdownBtn nui-btn "
				tabindex="0" role="button" id="tool_moveto_<%=currentpage%>">
				<span class="nui-btn-text">移动到</span><span
					class="nui-dropdownBtn-arr"><b
					class="nui-ico nui-ico-dArr"></b>
				</span>
			</div>
			<div class="js-component-button nui-dropdownBtn nui-btn "
				tabindex="0" role="button" id="tool_view_<%=currentpage%>">
				<span class="nui-btn-text">查看</span><span
					class="nui-dropdownBtn-arr"><b
					class="nui-ico nui-ico-dArr"></b>
				</span>
			</div>
			<div class="js-component-button nui-dropdownBtn nui-btn "
				tabindex="0" role="button" id="tool_more_<%=currentpage%>">
				<span class="nui-btn-text">更多</span><span
					class="nui-dropdownBtn-arr"><b
					class="nui-ico nui-ico-dArr"></b>
				</span>
			</div>
		</div>
		<div class="nui-toolbar-item">
			<div id="tool_refresh_<%=currentpage%>" class="js-component-button nui-btn " tabindex="0"
				role="button">
				<span class="nui-btn-text">刷 新</span>
			</div>
		</div>
		<div class="nui-toolbar-ext">
			<div class="nui-toolbar-item">
				<div class="js-component-calendar nui-calendar"
					id="_mail_calendar_2_372">
					<b class="nui-ico nui-ico-calendar"></b>
				</div>
			</div>
			<div class="nui-toolbar-item">
				<div title="当前第<%=currentpage%>页"
					class="js-component-select nui-simpleSelect nui-select"
					tabindex="0" id="_mail_select_2_373">
					<span class="nui-select-text"><%=currentpage%>/<%=totalpage%></span><span
						class="nui-select-arr"><b
						class="nui-ico nui-ico-dArr"></b>
					</span>
				</div>
				<div title="上一页"
					class="js-component-button nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  
					<%=(currentpage==1?"nui-btn-disabled nui-roundBtn-disabled":"")%>"
					tabindex="0" role="button" id="_mail_button_prepage">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico nui-ico-prev  "
						id="_mail_icon_61_375"></b>
					</span><span class="nui-btn-text"></span>
				</div>
				<div title="下一页"
					class="js-component-button nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  
					<%=(currentpage==totalpage?"nui-btn-disabled nui-roundBtn-disabled":"")%>"				
					tabindex="0" role="button" id="_mail_button_nextpage">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico nui-ico-next  "
						id="_mail_icon_62_377"></b>
					</span><span class="nui-btn-text"></span>
				</div>
				<div title="设置"
					class="js-component-button nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
					tabindex="0" role="button" id="_mail_button_82_378">
					<span class="nui-btn-icon"><b
						class="js-component-icon nui-ico nui-ico-setting  "
						id="_mail_icon_63_379"></b>
					</span><span class="nui-btn-text"></span>
				</div>
			</div>
		</div>
	</div>
</header>
<div id="1365694196651_ScrollDiv"
	class="frame-main-cont-body nui-scroll frame-main-cont-body-first">
	<div class="qu  " id="1365694196651_MainDiv">
		<div id="1365694196651_adDiv" class="qi">
			<div class="oI">
				<a hidefocus="hidefocus"
					class="js-component-link kL nui-fIBlock"
					href="javascript:void(0)" id="_mail_link_29_407" title="上一条"><b
					class="js-component-icon nui-ico nui-ico-lArr  "
					id="_mail_icon_64_410"></b>
				</a><a hidefocus="hidefocus"
					class="js-component-link kL nui-fIBlock"
					href="javascript:void(0)" id="_mail_link_30_408" title="下一条"><b
					class="js-component-icon nui-ico nui-ico-rArr  "
					id="_mail_icon_65_411"></b>
				</a><a hidefocus="hidefocus"
					class="js-component-link kL nui-fIBlock"
					href="javascript:void(0)" id="_mail_link_close_<%=currentpage%>" title="关闭"><b
					class="js-component-icon nui-ico nui-ico-close  "
					id="_mail_icon_66_412">x</b>
				</a>
			</div>
			<span class="oi">[<a target="_blank"
				class="mK nui-txt-tips"
				onclick="Nav.entry('OptionInterface',{module:'options.OptionOutLinkModule',linkName:'mobile_set_option&amp;from=clicktwo'});return false;"
				href="javascript:void(0)">办公免费邮号码邮箱</a>]</span><a target="_blank"
				class="mK mn"
				onclick="Nav.entry('OptionInterface',{module:'options.OptionOutLinkModule',linkName:'mobile_set_option&amp;from=clicktwo'});return false;"
				href="javascript:void(0)">好友知道你的手机号码，就能给你发邮件 </a> -
			<a target="_blank" class="mK lS"
				onclick="Nav.entry('OptionInterface',{module:'options.OptionOutLinkModule',linkName:'mobile_set_option&amp;from=clicktwo'});return false;"
				href="javascript:void(0)">查看详情</a> - 手机号码邮箱，让沟通变得更简单
		</div>
		<div
			class="js-component-block nui-tipsBlock nui-assistBlock nui-block "
			id="_mail_block_2_355" style="display: none"></div>
		<%
			Folder folder = (Folder)session.getAttribute("folder");
			int unread = folder.getUnreadMessageCount();
			if(unread!=0){				
		%>
		<div style="" class="pL">
			<div class="js-component-title nui-title " id="_mail_title_8_1616">
				<h1 class="nui-title-text"></h1>
				<span class="nui-title-tips nui-txt-tips"><a
					hidefocus="hidefocus" class="nui-txt-link js-component-link unRead"
					href="javascript:void(0)" id="_mail_link_182_1614" title="点击查看未读邮件">有
						<strong><%=unread%></strong> 封未读邮件</a> <a hidefocus="hidefocus"
					class="nui-txt-link js-component-link " href="javascript:void(0)"
					id="_mail_link_183_1615" title="全部设置为已读邮件">全部设为已读</a>
				</span>
			</div>
		</div>
		<%}%>
		<div class="pX sv" id="list_mailContent">			
			<div id='list_letter_<%=currentpage%>'>
			<%
				Date date = new Date();
				int month = date.getMonth()+1;
				for(int i=0,j=1;i<max;i++){
					MailInfoBean maillist = list.get(i);
					String subject = maillist.getSubject();
					String sentDate = maillist.getSentDate();
					String sentTime = maillist.getSentTime();
					String showDate = sentDate.substring(0,4)+"-"+sentDate.substring(5,7)+"-"+sentDate.substring(8,10);
					String[] from = maillist.getFrom().split("\"");
					String send = from[1].trim();
					String read = maillist.getRead();
					String replied = maillist.getReplied();
					//String recent = maillist.getRecent();
					String attachment = maillist.getAttachment();
					String address = from[2].trim();
					//是否最近的邮件
					if(j==1&&((month-Integer.parseInt(sentDate.substring(sentDate.indexOf("年")+1,sentDate.indexOf("月"))))>1||date.getYear()+1900!=Integer.parseInt(sentDate.substring(0,sentDate.indexOf("年"))))){
						j=0;
			%>
						<div tabindex="0" aria-label="更早" title="更早" class="pL kg"
							id="list_mailHead">
							<span class="hc">更早</span><span
								class="nui-title-tips nui-txt-tips">(<%=max-i%>)</span>
						</div>
					<%}%>
			<div sign="letter" id="<%=currentpage%>_<%=i%>" aria-label="<%=sentDate%>&nbsp;<%=send%>&nbsp;发来一封邮件，主题为：&nbsp;<%=subject%>" aria-time="<%=sentTime%>" tabindex="0" class='oe <%=read.equals("0")?"ib":""%> nui-txt-flag0'>
				<div class="kd fF bH">
				<div sign="start" class="eT">
					<div class="cP" title="">
						<b class="nui-ico nui-ico-drag"></b>
					</div>
					<span aria-label="选中此邮件" tabindex="0" role="checkbox" title="选中此邮件" class="nui-chk cs" sign="checkbox" aria-checked="false">
						<span class="nui-chk-symbol">
							<b class="nui-ico nui-ico-checkbox"></b>
						</span>
					</span>
					<b sign="logo" title="已回复" class='cQ nui-ico <%=replied.equals("1")?"nui-ico-re":read.equals("1")?"nui-ico-read":"nui-ico-unread" %>'></b>
					<div sign="start-from" class="cM">
						<span title="" class="nui-user bE"><%=send%></span>
					</div>
					<b sign="flag" title="设为红旗" class="cR nui-ico nui-ico-flag  nui-ico-flag-0 "></b>
				</div>
				<div class="gp">
					<div class="cq"><%=subject%></div>
				</div>
				<div class="gq">
					<div title="<%=sentDate%>" class="dw"><%=showDate%></div>
					<%if(!attachment.equals("")){ %>
					<div title="此邮件包含附件" class="nui-ico nui-ico-att cN"></div>
					<%}else {%>
					<div style="visibility: hidden" title="" class="nui-ico  cN"></div>
					<%}%>
					<div tabindex="0" role="button" title="选择邮件标签" class="js-component-button nui-miniBtn nui-btn nui-btn-hasIcon nui-miniBtn-hasIcon cO">
						<span class="nui-btn-icon">
							<b class="nui-ico nui-ico-dArr"></b>
						</span>
						<span class="nui-btn-text"></span>
					</div>
				</div>
				<div class="gr"></div>
				</div>
			</div>
			<%}%>
			</div>
		</div>
	</div>
</div>