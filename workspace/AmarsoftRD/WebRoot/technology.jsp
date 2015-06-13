<%@ page language="java" import="java.util.*,com.action.PostAction,com.bean.PostBean" pageEncoding="utf-8"%>
		<%String title="技术人生";%>
		<%@ include file="head.jsp"%>
		<style type="text/css">
			.notice .btn{
				float:right;
				margin-left:5px;
				display:inline-block;
			}
			.notice input{
				padding-left:3px;
				padding-right:3px;
			}
			.notice .edit_title{
				width:300px;
				height:20px;
			}
			.notice .edit_info{
				width:880px;
				height:60px;
				padding:3px;
			}
			.posts_ul .posts_ul_li div.t_con:hover{
				background:#F4F5F9;/*#FFFF01;*/
			}
		</style>
		<%if(roleId<=3){ %>
		<link href="css/minibtn.css" rel="stylesheet" type="text/css">
		<script src="js/minibtn.js"></script>
		<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
	    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
		<script>
	 		$(document).ready(function(){
	 			$('.contentpart .header').click(function(){
	 	 			$(this).next().slideToggle();
	 	 		});
	 			contentjs.initUeditor('editor');
	 		});
	 		//发表新帖子
	 		function publishPost(){
	 			//title content
	 			var title = document.getElementById('title').value;
	 			title = getURLEncode(title);
	 			if(title=="") {contentjs.showTip('failure','标题不能为空');return false;}
	 			//&-->#|#	%-->#@# //特殊字符转换
	 			var content = getURLEncode(UE.getEditor('editor').getContent().replace(/[\n\t\r]\s*/gi,""));
	 			if(content=="") {contentjs.showTip('failure','内容不能为空');return false;}
	 			$.ajax({
	 				type:'post',
	 				url:"jsp_file/post_action.jsp",
	 				async:true,
	 				cache:false,
	 				dataType:'text',
	 				data:"title="+title+"&content="+content+"&method=1",
	 				success: function(msg){
	 					msg = eval("("+msg+")");
	 					if(msg.status=="true"){
	 						onloadPost(msg.info,title);
	 						document.getElementById('title').value="";
	 						UE.getEditor('editor').setContent("");
	 						contentjs.showTip('success','发布帖子成功');
	 					}
	 					else{
	 						contentjs.showTip('failure','发布帖子失败');
	 					}
	 				}
	 			});
	 			return false;
	 		}
	 		//删除帖子
	 		function delPost(obj){
	 			var part = $(obj).parent().parent();
	 			var postId = part.attr('data-field');
	 			if(!confirm('你确定删除该条帖子？')) return false;
	 			$.ajax({
	 				type:'post',
	 				url:"jsp_file/post_action.jsp",
	 				async:true,
	 				cache:false,
	 				dataType:'text',
	 				data:'postId='+postId+'&method=3',
	 				success: function(msg){
	 					msg = eval("("+msg+")");
	 					if(msg.status=="true"){
	 						part.remove();
	 						contentjs.showTip('success','删除公告成功');
	 					}
	 					else{
	 						contentjs.showTip('failure','删除公告失败');
	 					}
	 				}
	 			});
	 			return false;
	 		}
	 		//动态加载新发布的帖子
	 		function onloadPost(postId,title){
	 			var post_ul = $('.posts_ul');
	 			var div = '<div style="display:none;"></div>';
	 			var editpart = $(div).prependTo(post_ul);
	 			editpart.load("jsp_file/show_post.jsp",{'postId':postId,'title':title,'status':1},function(){
	 				editpart.find('.nui-miniBtn').click(function(){
	 	 				return minibtnjs.nui_miniBtn_Event(this);
	 	 			});
	 				editpart.find('.nui-menu-item').click(function(){
	 	 				return minibtnjs.nui_menu_item_Event(this);
	 	 			});
	 				editpart.find('.posts_ul_li').unwrap();
	 			});
	 		}
	 	</script>
	 	<%}%>
        <%@ include file="menu.jsp"%>
		<br><br>
    	<div id="doc">
    	<div class="jk_box" style='border-radius:5px 5px 0 0px'>
			<div class="jk_main" style="float:left;margin-bottom:3px;width:100%;">
				<div class="fr" style="box-shadow:0 1px 3px 2px rgba(0, 0, 0, 0.2);border-radius:4px;width:100%;">
					<div class="textbox_m textbox_r">
						<div style='position:relative;padding-bottom:10px;'>
							<h3 style="margin-top:10px;">技术人生</h3>
							<div class="notice">
							<%String sPath = application.getRealPath("/")+"document/post_resources/";
							ArrayList<PostBean> list = PostAction.getAllPosts(sPath);
							  String info = "关注：;8468715;帖子：;"+list.size();
							%>
							<%@ include file="postHead.jsp"%>
							<div class="posts">
								<ul class="posts_ul">
									<% for(PostBean postBean : list){%>
									<li class="posts_ul_li" data-field="<%=postBean.getPostId()%>">
										<div class="t_con mini-div">
											<%if(roleId==2){%><div onclick="delPost(this)" class="close"></div><%}%>
											<div class="posts_ul_li_left">
												<div title="浏览量" class="posts_rep_num"><%=postBean.getReadNum()%></div>
											</div>
											<div class="posts_ul_li_right">
												<div class="posts_lz">
													<div class="posts_title">
														<a class="posts_th_tit" target="_blank"
															title="<%=postBean.getTitle()%>" href="technology_info.jsp?postId=<%=postBean.getPostId()%>"><%=postBean.getTitle()%></a>
														<span class="status">
															<img class="jing" title="精品帖" src="images/pic/jing.gif" <%if(postBean.getNicePost()!=1){%>style="display:none;"<%}%>>
															<img class="zding" title="置顶帖" src="images/pic/zding.gif" <%if(postBean.getTop()!=1){%>style="display:none;"<%}%>>
														</span>
													</div>
													<div class="posts_author">
														<span title="主题作者: <%=postBean.getInputUserName()%>" class="tb_icon_author">
															<a target="_blank" href="javascript:void(0)" <%if(true){%>title="该用户已经连续签到107天了，连续30天一举“橙”名"<%}%>
															class="<%if(true){%>sign_highlight<%}%> j_user_card"><%= postBean.getInputUserName()%></a>
														</span>
													</div>
												</div>
											</div>
											<%if(roleId<=2){%>
											<div class="nui-miniBtn">
												<span class="nui-btn-icon">
													<b class="nui-ico-dArr"></b>
												</span>
												<span class="nui-btn-text"></span>
											</div>
											<%}%>
											<div class="clear" style="height:5px;"></div>
										</div>
										<%if(roleId<=2){%>
										<div class="nui-menu" data-top="<%=postBean.getTop()%>" nicepost="<%=postBean.getNicePost()%>" 
											style="opacity:1;right:160px;top:25px;transform:translate(0px,0px);">
											<div class="nui-menu-item" data="top">
												<div class="nui-menu-item-link">
													<%if(postBean.getTop()==1){%><span class="nui-menu-item-text">取消置顶</span><%}else{%>
													<span class="nui-menu-item-text">标记为置顶</span><%}%>
												</div>
											</div>
											<div class="nui-menu-item" data="nicepost">
												<div class="nui-menu-item-link">
													<%if(postBean.getNicePost()==1){%><span class="nui-menu-item-text">取消精品</span><%}else{%>
													<span class="nui-menu-item-text">标记为精品</span><%}%>
												</div>
											</div>
										</div>
										<%}%>
									</li>
									<%}%>
								</ul>
							</div>
							<%if(list.size()==0){%>
								<div class="contentpart">
									<div class="header">还未有任何公开的帖子，请登录后点击下方的【发表帖子】对话框，尝试哈发表第一篇帖子...</div>
								</div>
							<%}%>
							<%if(roleId<=3){ %>
			    				<%@ include file="jsp_file/show_post.jsp"%>
			    			<%}%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="relativeInfo.jsp"%>
		</div>
		</div>
		<%@ include file="foot.jsp"%>