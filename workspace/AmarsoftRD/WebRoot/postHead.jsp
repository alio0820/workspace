<%@ page language="java" import="java.util.*,com.action.NoticeAction" pageEncoding="utf-8"%>
<%String[] infos = info.split(";"); %>
<div class="card">
	<div class="card_head">
		<a href="javascript:void(0)" style="display:block;"><img class="card_img" src="images/pic/timg.png"/></a>
	</div>
	<div class="card_title">
		<a href="javascript:void(0)" title="" class="card_title_fname">华安吧</a>
		<a id="j_head_focus_btn" class="focus_btn islike_focus"
			onclick="return false" href="#"></a>
		<span class="card_num ">
			<span class="card_numLabel"><%=infos[0]%></span>
			<span class="card_menNum"><%=infos[1]%></span>
			<span class="card_numLabel"><%=infos[2]%></span>
			<span class="card_infoNum"><%=infos[3]%></span>
		</span>
	</div>
	<p class="card_slogan">安硕第一吧！技术！原创！内涵！深度！格物致知！</p>
</div>