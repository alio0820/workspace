<%@ page language="java" import="java.util.*,com.bean.*,com.action.*" pageEncoding="utf-8"%>
<%String title="Amarsoft研发部信息平台";%>
<%@ include file="head.jsp"%>
<script src="js/ad.js"></script>
<style>
	.edit-link {
		display:none;
	    float: right;
	    color: #2C76C0;
	    outline: medium none;
	    text-decoration: none;
	    transition: color 0.2s ease 0s;
	}
	
	.edit-btn {
	    background: url("images/pic/edit_btn.png") no-repeat scroll 0 1px rgba(0, 0, 0, 0);
	    float: right;
	    line-height: 20px;
	    padding-left: 20px;
	    color:#2C76C0;
	    margin-top:20px;
	}
	.profile .split-line {
	    background: none repeat scroll 0 0 #F2F2F2;
	    height: 1px;
	    margin-top: 12px;
	   	margin-bottom:12px;
	    overflow: hidden;
	}
	.profile dl{
		display:inline-block;
		width:710px;
	}
	.profile dl:hover .edit-link{
		display:block;
	} 
	.profile dt {
	    background-image: url("images/pic/detail.png");
	    background-repeat:no-repeat;
	    color: #666666;
	    font-size: 14px;
	    height: 14px;
	    line-height:14px;
	    margin-bottom: 15px;
	    padding-left: 20px;
	    vertical-align: baseline;
	}
	.profile dd {
	    line-height: 24px;
	    padding-left: 20px;
	}
	.userdetail-profile-basic dd, .userdetail-profile-habits dd {
	    clear: both;
	}
	.profile .profile-attr {
	    color: #999999;
	    display: inline-block;
	    padding-right: 10px;
	    text-align: right;
	    width: 50px;
	}
	.userdetail-profile-basic span, .userdetail-profile-habits span {
	    float: left;
	    max-width: 645px;
	}
	.userdetail-profile-basic .profile-cnt, .userdetail-profile-habits .profile-cnt {
	    padding-left: 3px;
	    word-wrap: break-word;
	}
	.notice .contentpart .content{
		display:block;
	}
	.contentpart .content label{
		width:auto;
	}
	.contentpart a{
		display:inline-block;
		margin-left:10px;
		color:#21936A;
	}
	.contentpart a:hover{
		color:#F09B21;
	}
	.content .content_info{
		margin-top:10px;
	}
	#ad{
		z-index: 101; 
		width: 400px;
		position: fixed;
		height: 200px;
		padding:10px;
		border:1px solid #C6C6C6;
		border-radius:5px;
		box-shadow:0 1px 3px 2px rgba(0, 0, 0, 0.2);
		background:#FFFFFF;
	}
	#ad:hover .close{
		display:block;
	}
</style>
<script>
		$(document).ready(function(){
			$('.contentpart .header').click(function(){
 	 			$(this).nextAll().slideToggle();
 	 		});
			$('.header a').click(function(event){
//				IE:				
//				window.event.cancelBubble = true;//停止冒泡
//				window.event.returnValue = false;//阻止事件的默认行为

//				Firefox：
//				event.preventDefault();// 取消事件的默认行为  
//				event.stopPropagation(); // 阻止事件的传播
				if(document.all)
					window.event.cancelBubble = true;
				else
					event.stopPropagation();
			});
			var ad_box = $('.ad').clone().css('visibility','hidden');
			ad_box.appendTo($('body'));
			$('<div class="close" onclick="$(this).parent().remove()"></div>').appendTo(ad_box);
			ad_box.attr('id',"ad");
			adjs.start();
		});
</script>
<%@ include file="menu.jsp"%>
<br><br>
<div id="doc" class="">
  	<div style="border-radius:5px 5px 0 0px" class="jk_box">
		<div class="jk_main" style="float:left;margin-bottom:3px;width:100%;">
			<div class="textbox fr" style="box-shadow:0 1px 3px 2px rgba(0, 0, 0, 0.2);width:100%;margin-right:0px;border-radius:4px;">
				<div class="d_author" style="width:200px;">
					<div class="louzhubiaoshi_wrap">
						<div class="louzhubiaoshi j_louzhubiaoshi" author="<%=nickName%>">
							<a href="javascript:void(0)"></a>
						</div>
					</div>
					<ul class="p_author">
						<li class="icon">
							<div class="icon_relative" data-field="">
								<a class="p_author_face" href="<%if(roleId==4){%>javascript:void(0)<%}else{%>personalInfo.jsp<%}%>">
									<img src="<%=user.getHead()%>">
								</a>
							</div>
						</li>
						<li class="d_name" data-field="">
							<a data-field="" alog-group="p_author" class="p_author_name j_user_card"
							 href="javascript:void(0)" style="text-decoration:none;"><%=nickName%></a>
						</li>
						<li style="display: block;" class="l_badge">
							<div class="p_badge">
								<div class="d_badge d_badge_bawu1" title="主人，最新的动态在右侧">
									<div class="d_badge_title d_badge_title_bawu">
										主人
									</div>
									<div class="d_badge_lv">
										10
									</div>
								</div>
							</div>
						</li>
						<li style="margin-top:15px;">
							<div>
								<%=user.getRemark()%>
							</div>
						</li>
					</ul>
				</div>
				<div style="min-height:710px;position:relative;width:710px;border-width:0px;float:right;border-radius:0 4px 4px 0;padding:0 20px 10px" class="textbox_m notice">
					<div class="contentpart">
						<div class="header">最新公告<a href="notice.jsp">查看全部公告</a></div>
						<%
						ArrayList<NoticeBean> NoticeList = NoticeAction.getNoticesByFirst(1);
						for(NoticeBean noticeBean : NoticeList){%>
	    				<div class="content ad">
							<div class="content_title"><%=noticeBean.getTitle()%></div>
							<div class="content_salutation"><%=noticeBean.getAppellation()%></div>
							<div class="content_info"><%=noticeBean.getContent()%></div>
							<div class="content_foot"><span class="publisher"><%=noticeBean.getDepartment()%></span><br/>
							<span class="time"><%=noticeBean.getInputTime()%></span></div>
	    				</div>
						<%}if(NoticeList.size()==0){%>
							<div class="content" style="text-align:center;">
								<h3>暂无最新公告...</h3>
							</div>
						<%}%>
						
					</div>
					<div class="contentpart">
						<div class="header">最新帖子<a href="technology.jsp">查看全部帖子</a></div>
						<%String sPath = application.getRealPath("/")+"document/post_resources/";
						ArrayList<PostBean> PostList = PostAction.getAllPosts(1,sPath);
						for(PostBean postBean : PostList){%>
						<div class="content">
							<div class="content_title">
								<%=postBean.getTitle()%>
							</div>
							<div class="content_info"><%=postBean.getContent()%></div>
						</div>
						<%}if(PostList.size()==0){%>
						<div class="content" style="text-align:center;">
							<h3>暂无最新帖子...</h3>
						</div>
						<%}%>
					</div>
					<div class="contentpart">
						<div class="header">最新共享资源<a href="resourceSharing.jsp">查看共享资源</a></div>
						<div class="content">
							<div class="content_title">
								<label>程序员的自我修养</label>
							</div>
							<label>内容：未完待续...</label>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="relativeInfo.jsp"%>
	</div>
</div>
<%@ include file="foot.jsp"%>