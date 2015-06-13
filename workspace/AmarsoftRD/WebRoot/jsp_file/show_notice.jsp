<%@ page language="java" import="java.util.*,com.action.NoticeAction,com.common.Common,com.bean.UserBean" pageEncoding="utf-8"%>
<%
	//topic call publisher time content
	request.setCharacterEncoding("utf-8");
	String timestamp = request.getParameter("timestamp");
	String noticeId = request.getParameter("noticeId");
	String _title = request.getParameter("title");
	String call = request.getParameter("call");
	String publisher = request.getParameter("publisher");
	String time = request.getParameter("time");
	String content = request.getParameter("content");
	String status = request.getParameter("status");
	UserBean user2 = (UserBean)(session.getAttribute("userBean"));
	int role = Integer.parseInt(user2.getRoleId());
	if(noticeId==null){//新增状态%>
<div class="contentpart" data="">
	<div class="header">新增公告<span style="float:right">[+]</span></div>
	<div class="content">
		<div class="content_title">
			<label>标题：</label><input type="text" class="edit_title" id="title"/>
		</div>
		<div class="content_salutation">
			<label>称呼：</label><input class="edit_salutation" type="text" id="call"/>
		</div>
		<label>内容：</label>
		<script id="editor" type="text/plain" style="width:630px;height:200px;"></script>
		<div style="width:100%;text-align:center;margin-top:10px;">
			<span onclick="publishNotice()" style="display: inline-block; float: none;" 
				class="lzl_panel_submit iframe_submit">发布</span>
		</div>
		<div class="content_foot">
			<span class="publisher">
				<label>发布者：</label><input class="edit_publisher" type="text" id="publisher" value="研发部"/>
			</span><br/>
			<span class="time">
				<label>时间：</label><input class="edit_time" type="text" id="time" value="<%=Common.getDate()%>"/>
			</span>
		</div>
	</div>
</div>

<%}else if(status.equals("2")){//编辑状态 %>
<div class="contentpart" data ="<%=noticeId%>">
	<div class="header"><%=_title%>
		<%if(role==2){%>
			<span class="btn save_btn" title="取消" onclick="cancel(this)">取消</span>
			<span class="btn save_btn" title="保存" onclick="saveNotice(this,'editor_<%=timestamp%>')">保存</span>
		<%}%>
	</div>
	<div class="content">
		<div class="content_title"><input type="text" class="edit_title" value="<%=_title%>"/></div>
		<div class="content_salutation"><input class="edit_salutation" type="text" value="<%=call%>"/></div>
		<div class="content_info">
			<script id="editor_<%=timestamp%>" type="text/plain" style="width:630px;height:200px;"></script>
		</div>
		<div class="content_foot">
			<span class="publisher"><input class="edit_publisher" type="text" value="<%=publisher%>"/></span><br/>
			<span class="time">
				<input class="edit_time" type="text" value="<%=Common.isBlank(time)?Common.getDate():time%>"/>
			</span>
		</div>
	</div>
</div>
<%}else{//展示状态%>
<div class="contentpart" data ="<%=noticeId%>">
	<%if(role==2){%><div class="close" onclick="delNotice(this)"></div><%}%>
	<div class="header"><%=_title%>
		<%if(role==2){%><span class="btn edit_btn" title="编辑" onclick="editNotice(this)">编辑</span><%}%>
	</div>
	<div class="content">
	<div class="content_title"><%=_title%></div>
	<div class="content_salutation"><%=call%></div>
	<div class="content_info"><%=content%></div>
	<div class="content_foot"><span class="publisher"><%=publisher%></span><br/>
	<span class="time"><%=Common.isBlank(time)?Common.getDate():time%></span></div>
	</div>
</div>
<%}%>