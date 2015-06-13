<%@ page language="java" import="java.util.*,com.action.PostAction,com.bean.PostBean" pageEncoding="utf-8"%>
		<%String title="每周精品帖";%>
		<%@ include file="head.jsp"%>
		<link href="css/minibtn.css" rel="stylesheet" type="text/css">
		<script src="js/minibtn.js"></script>
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
		<script>
	 		$(document).ready(function(){
	 			$('.contentpart .header').click(function(){
	 	 			$(this).next().slideToggle();
	 	 		});
	 		});
	 	</script>
        <%@ include file="menu.jsp"%>
		<br><br>
    	<div id="doc">
    	<div class="jk_box" style='border-radius:5px 5px 0 0px'>
			<div class="jk_main" style="float:left;margin-bottom:3px;width:100%;">
				<div class="fr" style="box-shadow:0 1px 3px 2px rgba(0, 0, 0, 0.2);border-radius:4px;width:100%;">
					<div class="textbox_m textbox_r">
						<div style='position:relative;height:100%'>
							<h3 style="margin-top:10px;">每周精品帖</h3>
							<div class="notice">
							<%ArrayList<PostBean> list = PostAction.getAllNicePosts();
							  String info = "关注：;8468715;精品帖：;"+list.size();
							%>
							<%@ include file="postHead.jsp"%>
							<div class="posts">
								<ul class="posts_ul">
									<% for(PostBean postBean : list){%>
									<li class="posts_ul_li" data-field="<%=postBean.getPostId()%>">
										<div class="t_con mini-div">
											<%if(roleId==2){%><div onclick="delPost(this)" class="close"></div><%}%>
											<div class="posts_ul_li_left">
												<div title="回复" class="posts_rep_num"><%=postBean.getReadNum()%></div>
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
		    				<!-- <div class="contentpart">
		    				<div class="header">引入精品帖<span style="float:right"></span></div>
		    				<div class="content">
		    					<div><label>主题：</label><input type="text" class="mitxt" id="topic"/></div>
		    					<label>内容：</label>
								<div style="width:100%;text-align:center;margin-top:10px;">
									<span class="lzl_panel_submit" style="float:none;display:inline-block;" 
										onclick="contentjs.showTip('failure','该功能待完成',85);">引入</span>
								</div>
		    				</div>
			    			</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="relativeInfo.jsp"%>
		</div>
		</div>
		<%@ include file="foot.jsp"%>