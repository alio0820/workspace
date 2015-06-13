<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<%
	String attachNames = request.getParameter("attachNames");
	String downloadUrls = request.getParameter("downloadUrls");
	String previewUrls = request.getParameter("previewUrls");
	attachNames = attachNames==null?"":attachNames;
	downloadUrls = downloadUrls==null?"":downloadUrls;
	previewUrls = previewUrls==null?"":previewUrls;
	String[] attachName = attachNames.split(";");
	String[] downloadUrl = downloadUrls.split(";");
	String[] previewUrl = previewUrls.split(";");
	int attachLength = attachName.length;
%>
<%if(downloadUrls.equals("")){%>
<li class="fS dD" id="_liAttach">
	<div class="fT">
		附&nbsp;&nbsp;&nbsp;件：
	</div>
	<div class="fU">
		<span class="nui-txt-normal" id="1366107610255_spHeadAttachLen"><%=attachLength%>个</span><span
			class="txt-info" id="1366107610255_spHeadAttachName">(<span><b
				class="js-component-icon nui-ico nui-ico-file  nui-ico-file-22  "
				id="_mail_icon_50_289"></b><%=attachName[0]%></span><%=attachLength > 1 ? "等..." : ""%>)</span><span
			id="1366107610255_spHeadAttachFlash"> <a
			hidefocus="hidefocus" class="js-component-link nui-txt-link"
			href="javascript:void(0)" id="_mail_link_31_290"><%=attachLength > 1 ? "查看全部附件":"查看附件"%></a>
		</span>
	</div>
</li>
<%}else{%>
<div style="" class="pN" id="dvAttachBody">
	
	<div class="oR" id="dvAttachHead">
		<div class="ll" id="dvAttachHeadBanner">
			<b class="nui-ico nui-ico-att"></b><strong class="hq">附件</strong><span
				class="nui-txt-tips">(<%=attachLength%>)</span><a hidefocus="hidefocus"
				target="ifrDownUrl" class="js-component-link nui-txt-link hr"
				href="http://twebmail.mail.163.com/js5/read/readpack.jsp?sid=ECQnVkEQVJCmWwDHdfQQRkZTRUvoBpEw&amp;mid=195:1tbiwxMAABVSqLwdOC+0c9&amp;part=3&amp;part=4"
				id="_mail_link_66_495">打包下载</a>
		</div>
		<div class="nui-split nui-split-cDark pl"></div>
	</div>
	<div style="margin-bottom: 15px;" class="oS"
		id="dvCommonAttach">
		<ul id="ulCommonAttachItem" class="np nui-fClear">
		<%
			for(int i=0;i<attachLength;i++){
		%>
			<li class="js-component-readattachitem jG <%if(i==0)out.println("attach-li-first"); %>"
				id="_mail_readattachitem_0_485">
				<table>
					<tbody>
						<tr>
							<td class="dz">
								<div class="bJ">
									<b
										class="js-component-icon nui-ico nui-ico-file75  nui-ico-file75-6  "
										id="_mail_icon_92_487"></b>
								</div>
							</td>
						</tr>
						<tr>
							<td class="fd">
								<strong class="cx"><%=attachName[i]%></strong><span
									class="nui-txt-tips cy">3.45K</span>
								<div class="dA">
									<div class="cz"></div>
									<div class="cB nui-fClear">
										<div class="bK">
											<%=attachName[i]%>
										</div>
										<a hidefocus="hidefocus" target="ifrDownUrl"
											class="js-component-link bZ"
											href="<%=downloadUrl[i]%>"
											id="_mail_link_61_488"><img class="nui-ico bs M"
												src="http://mimg.127.net/p/t.gif">
											<br>下载</a><a hidefocus="hidefocus"
											class="js-component-link bZ bt" href="javascript:void(0)"><img
												class="nui-ico bs N" src="http://mimg.127.net/p/t.gif">
											<br>打开</a><a hidefocus="hidefocus" target="_blank"
											class="js-component-link bZ"
											href="<%=previewUrl[i]%>"
											id="_mail_link_62_489"><img class="nui-ico bs O"
												src="http://mimg.127.net/p/t.gif">
											<br>预览</a><a hidefocus="hidefocus"
											class="js-component-link bZ bt" href="javascript:void(0)"><img
												class="nui-ico bs P" src="http://mimg.127.net/p/t.gif">
											<br>存网盘</a>
									</div>
									<div class="cA"></div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</li>
			<%}%>
		</ul>
	</div>
	<div class="nui-split nui-split-cDark"></div>
</div>
<%}%>