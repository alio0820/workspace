<%@ page language="java" import="java.util.*,com.bean.UserBean,com.action.PersonAction" pageEncoding="utf-8"%>
<%
	//topic call publisher time content
	request.setCharacterEncoding("utf-8");
	String timestamp = request.getParameter("timestamp");
	String postId = request.getParameter("postId");
	String _title = request.getParameter("title");
	String status = request.getParameter("status");
	UserBean user2 = PersonAction.getUserFromSession(session);
	String _nickName = "";
	int _roleId = 4;
	if(user2!=null) {
		_nickName = user2.getNickName();
		_roleId = Integer.parseInt(user2.getRoleId());
	}
	if(postId==null){//新增状态
%>
<div class="contentpart">
	<div class="header">发表新帖<span style="float:right"></span></div>
	<div class="content">
		<div class="content_title">
			<label>标题：</label><input type="text" class="edit_title" id="title"/>
		</div>
		<label>内容：</label>
		<script id="editor" type="text/plain" style="width:880px;height:300px;"></script>
		<div style="width:100%;text-align:center;margin-top:10px;">
			<span class="lzl_panel_submit iframe_submit" style="float:none;display:inline-block;" onclick="publishPost()">发表</span>
		</div>
	</div>
</div>

<%}else if(status.equals("2")){//编辑状态 %>
<div class="d_post_content_main" data ="<%=postId%>">
<div class="contentpart">
	<div class="header"><%=_title%>
		<span class="btn save_btn" title="取消" onclick="cancel(this)">取消</span>
		<span class="btn save_btn" title="保存" onclick="savePost(this,'editor_<%=timestamp%>')">保存</span>
	</div>
	<div class="content">
		<div class="content_title" style="margin-bottom:10px;"><input type="text" class="edit_title" value="<%=_title%>"/></div>
		<div class="content_info">
			<script id="editor_<%=timestamp%>" type="text/plain" style="width:740px;height:300px;"></script>
		</div>
	</div>
</div>
</div>
<%}else{//展示状态%>
<%--<li class="posts_ul_li" data-field="<%=postId%>">--%>
<%--	<div onclick="delPost(this)" class="close"></div>--%>
<%--	<div class="t_con">--%>
<%--		<div class="posts_ul_li_left">--%>
<%--			<div title="回复" class="posts_rep_num">0</div>--%>
<%--		</div>--%>
<%--		<div class="posts_ul_li_right">--%>
<%--			<div class="posts_lz">--%>
<%--				<div class="posts_title">--%>
<%--					<a class="posts_th_tit" target="_blank"--%>
<%--						title="<%=_title%>" href="technology_info.jsp?postId=<%=postId%>"><%=_title%></a>--%>
<%--					<span>--%>
<%--					</span>--%>
<%--				</div>--%>
<%--				<div class="posts_author">--%>
<%--					<span title="主题作者: <%=_nickName%>" class="tb_icon_author">--%>
<%--						<a target="_blank" href="javascript:void(0)" <%if(true){%>title="该用户已经连续签到107天了，连续30天一举“橙”名"<%}%>--%>
<%--						class="<%if(true){%>sign_highlight<%}%> j_user_card"><%=_nickName%></a>--%>
<%--					</span>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="clear"></div>--%>
<%--	</div>--%>
<%--</li>--%>
<li class="posts_ul_li" data-field="<%=postId%>">
	<div class="t_con mini-div">
		<%if(_roleId==2){%><div onclick="delPost(this)" class="close"></div><%}%>
		<div class="posts_ul_li_left">
			<div title="浏览量" class="posts_rep_num">0</div>
		</div>
		<div class="posts_ul_li_right">
			<div class="posts_lz">
				<div class="posts_title">
					<a class="posts_th_tit" target="_blank"
						title="<%=_title%>" href="technology_info.jsp?postId=<%=postId%>"><%=_title%></a>
					<span class="status">
						<img class="jing" title="精品帖" src="images/pic/jing.gif" style="display:none;">
						<img class="zding" title="置顶帖" src="images/pic/zding.gif" style="display:none;">
					</span>
				</div>
				<div class="posts_author">
					<span title="主题作者: <%=_nickName%>" class="tb_icon_author">
						<a target="_blank" href="javascript:void(0)" <%if(true){%>title="该用户已经连续签到107天了，连续30天一举“橙”名"<%}%>
						class="<%if(true){%>sign_highlight<%}%> j_user_card"><%=_nickName%></a>
					</span>
				</div>
			</div>
		</div>
		<%if(_roleId<=2){%>
		<div class="nui-miniBtn">
			<span class="nui-btn-icon">
				<b class="nui-ico-dArr"></b>
			</span>
			<span class="nui-btn-text"></span>
		</div>
		<%}%>
		<div class="clear" style="height:5px;"></div>
	</div>
	<%if(_roleId<=2){%>
	<div class="nui-menu" data-top="0" nicepost="0" 
		style="opacity:1;right:160px;top:25px;transform:translate(0px,0px);">
		<div class="nui-menu-item" data="top">
			<div class="nui-menu-item-link">				
				<span class="nui-menu-item-text">标记为置顶</span>
			</div>
		</div>
		<div class="nui-menu-item" data="nicepost">
			<div class="nui-menu-item-link">
				<span class="nui-menu-item-text">标记为精品</span>
			</div>
		</div>
	</div>
	<%}%>
</li>
<%}%>