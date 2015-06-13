<%@ page language="java" import="java.util.*,com.bean.UserBean,com.action.RankAction" pageEncoding="utf-8"%>
<%
	//topic time content
	request.setCharacterEncoding("utf-8");
	String floor = request.getParameter("floor");
	String inputTime = request.getParameter("inputTime");
	String replay4Id = request.getParameter("replay4Id");
	String replayId = request.getParameter("replayId");
	String content = request.getParameter("content");
	String status = request.getParameter("status");
	UserBean user2 = (UserBean)(session.getAttribute("userBean"));
%>
<div class="l_post">
	<div class="d_author">
		<ul class="p_author">
			<li class="icon">
				<div class="icon_relative j_user_card">
					<a href="javascript:void(0)" class="p_author_face " target="_blank">
						<img src="<%=user2.getHead()%>">
					</a>
				</div>
			</li>
			<li class="d_name">
				<a target="_blank" href="javascript:void(0)" class="p_author_name sign_highlight j_user_card">
					<%=user2.getNickName()%>
				</a>
			</li>
			<li class="l_badge" style="display: block;">
				<div class="p_badge">
				<%String[] rankInfo = RankAction.getRankInfo(user2.getRank());%>
					<div title="本吧头衔<%=rankInfo[0]%>级，经验值<%=user2.getRank()%>"
						class="d_badge d_badge_icon2_2">
						<div class="d_badge_title ">
							<%=rankInfo[1]%>
						</div>
						<div class="d_badge_lv" style="background:url(<%=rankInfo[2]%>) no-repeat scroll 0 1px rgba(0, 0, 0, 0)">
							<%=rankInfo[0]%>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<div class="d_post_content_main">
		<div class="p_content p_content_icon_row1">
			<div class="d_post_content j_d_post_content" <%if(status.equals("2")){%>contenteditable="true"<%}%>>
				<%=content%>
			</div>
		</div>
		<div class="core_reply j_lzl_wrapper">
			<div class="core_reply_tail">
				<div class="j_lzl_r p_reply">
<%--					<a style="display: inline;" class="lzl_link_unfold"--%>
<%--						href="javascript:void(0)">回复(0)</a>--%>
<%--					<span style="display: none;" class="lzl_link_fold">收起回复</span>--%>
					<a style="display: inline;" class="lzl_link_unfold"
						href="javascript:void(0)" onclick="editReplay(this,1,'<%=replayId%>')">编辑</a>
					<a style="display: inline;" class="lzl_link_unfold"
						href="javascript:void(0)" onclick="deleteReplay(this,1,'<%=replayId%>')">删除</a>
				</div>
				<ul class="p_tail">
					<li>
						<span class=""><%=floor%>楼</span>
					</li>
					<li>
						<span><%=inputTime%></span>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>