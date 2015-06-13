<%@ page language="java" import="java.util.*,com.action.PersonAction" pageEncoding="utf-8"%>
<dl class="userdetail-profile-habits" id="dl_head">
	<a class="cancel-link link" href="javascript:void(0)" onclick="hide(this)">取消</a>
	<a class="save-link link" href="javascript:void(0)" onclick="saveHeadPortrait()">保存</a>
	<dt>
		选择你喜欢的头像
	</dt>
	<%
		ArrayList<String> heads = PersonAction.getFileNames(application.getRealPath("/"));
		int size = heads.size();
		if(size==0)
			out.println("<dd>不好意思，图片资源开小差了...</dd>");
		else{
			for(int i=0;i<size;i++){
				if(i%6==0) out.println("<dd>");
	%>
		<a href="javascript:void(0)" class="p_author_face head_portrait">
			<img src="images/head/<%=heads.get(i)%>">
		</a>
	<%
				if(i%6==0) out.println("</dd>");
			}
		}
	%>
</dl>