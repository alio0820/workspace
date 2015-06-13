<%@ page language="java" import="java.util.*,com.bean.PostBean,com.action.PostAction,com.action.RankAction" pageEncoding="utf-8"%>
		<%	
			String title="帖子内容";
        	String postId = request.getParameter("postId");
        	String sPath = application.getRealPath("/")+"document/post_resources/";
        	PostBean postBean = PostAction.getPostById(postId,sPath);
        	ArrayList<ReplayBean> list = PostAction.getAllReplay(postId,1);
        	String info = "浏览量：;"+postBean.getReadNum()+";回复量：;"+list.size();
        %>
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
			.notice .edit_salutation{
				height:20px;
				margin-bottom:5px;
			}
			.notice .edit_info{
				width:600px;
				height:60px;
				padding:3px;
			}
			.toolBar{
				position:absolute;
				top:100%;
				left:0;
				margin-top:-30px;
				margin-left:5px;
			}
			#replayBox{
				background:url(images/pic/replay_background.jpg);
				float:left;
				width:907px;
				border-top:1px solid #E5E5E5;
				border-left: 1px solid #CCCCCC;
				border-right: 1px solid #CCCCCC;
				display:none;
			}
			.replayBoxInner{
				width:600px;
				background:#FAFAFA;
				border:1px solid #DFDFDF;
				padding:10px 14px 14px;
				margin:10px 0 20px 150px;
			}
			#replayEditBox{
				border-color:#9A9A9A #CCCCCC #CCCCCC #9A9A9A;
				border-style:solid;
				border-width:1px;
				min-height:220px;
				padding:5px 10px;
				word-wrap:break-word;
			}
			#replayEditBox:focus{
				background:#FFFFFF;
				border:1px solid #5C9DFF;
			}
			#replayBox .poster_submit {
			    float: left;
			    -moz-user-select:none;
			}
			#replayBox .ui_btn {
				background:url(images/pic/tb_button_patch.png);
			    background-position: 0 -292px;
			    font-size: 14px;
			    height: 28px;
			    overflow: hidden;
			    color: #FFFFFF;
			    cursor: pointer;
			    display: inline-block;
			    padding: 0 0 0 3px;
			    margin-bottom:10px;
			    word-wrap: break-word;
			}
			#replayBox .ui_btn span{
				background:url(images/pic/tb_button_patch.png);
				background-position: right -320px;
			    display: inline-block;
			    height: 28px;
			    line-height: 28px;
			    overflow: hidden;
			    padding: 0 18px 0 15px;
			    text-align: center;
			}
			#replayBox .ui_btn:hover{
				background-position:0 -372px;
			}
			#replayBox .ui_btn:active{
				background-position:0 -440px;
			}
			#replayBox .ui_btn:hover span{
				background-position:right -400px;
			}
			#replayBox .ui_btn:active span{
				background-position:right -468px;
			}
		</style>
		<%if(roleId<=3){%>
		<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
	    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
	    <%}%>
		<script>
		// 450383731@qq.com	xingye cdzhai@amarsoft.com
			var floor = <%=list.size()+1%>;
			var postId = "<%=postId%>";
			var userName = "<%=user.getNickName()%>";
	 		$(document).ready(function(){
	 			$('#lzonly_cntn').click(function(){
	 				var span = $(this).find('span');
	 				if($(this).hasClass('replay_hide')){
	 					$('.l_post:gt(0)').show();
	 					$(this).removeClass('replay_hide');
	 					span.html('只看楼主');
	 				}
	 				else{
	 					$('.l_post:gt(0)').hide();
	 					$(this).addClass('replay_hide');
	 					span.html('查看全部');
	 				}
	 				return false;
	 			});
	 			$('#replayEditBox').keyup(function(event){
	 				if(event.keyCode==13&&event.ctrlKey){
	 					$('.poster_submit').trigger('click');
		 				return false;
	 				}
	 			});
	 		});
	 		//编辑功能
	 		function editPost(obj){
	 			var post_content = $('#post_content');
 				//var postId =$('.core').attr('data');
 				var title = $('.core_title h1').attr('title');
 				var content = $('.p_content').html();
 				
 				var timestamp = new Date().getTime();
 				var div = '<div id="'+timestamp+'" style="display:none;"></div>';
 				var editpart = $(div).insertBefore(post_content);
 				$(editpart).load("jsp_file/show_post.jsp",{'timestamp':timestamp,'postId':postId,'title':title,'status':2},function(){
 					contentjs.initUeditor('editor_'+timestamp,content);
 					post_content.hide();
 					editpart.find('.content').show();
 					editpart.find('.d_post_content_main').unwrap();
 				});
 				return false;
	 		}
	 		//更新帖子
	 		function savePost(obj,name){
	 			var contentpart = $(obj).parent().parent().parent();
	 			//var postId = contentpart.attr("data");
	 			var title = contentpart.find('.edit_title').val();
	 			var content = UE.getEditor(name).getContent().replace(/[\n\t\r]\s*/gi,"");
	 			//判断输入内容是否为空
	 			if(title==""){
	 				contentjs.showTip('failure','标题不能为空...',90);return false;
	 			}else if(content==""){
	 				contentjs.showTip('failure','内容不能为空...',90);return false;
	 			}
	 			var content2 = getURLEncode(content);
	 			$.ajax({
	 				type:'post',
	 				url:"jsp_file/post_action.jsp",
	 				async:true,
	 				cache:false,
	 				dataType:'text',		//json类型貌似不能用alert弹值，html类型输出的是全部的html,包括换行符
	 				data:'title='+title+'&postId='+postId+'&content='+content2+'&method=2',
	 				success: function(msg){
	 					msg = eval("("+msg+")");
	 					if(msg.status=="true"){
	 						onloadPost(contentpart,title,content);
	 						//$('#edui_fixedlayer').remove();
	 						contentjs.showTip('success','更新公告成功',85);
	 					}
	 					else{
	 						contentjs.showTip('failure','更新公告失败...',90);
	 					}
	 				}
	 			});
	 			return false;
	 		}
	 		//取消编辑
	 		function cancel(obj){
	 			var contentpart = $(obj).parent().parent().parent().next();
	 			contentpart.show();
	 			contentpart.prev().remove();
	 			return false;
	 		}
	 		//动态加载刚更新的帖子
	 		function onloadPost(contentpart,title,content){
	 			var post_title = $('#post_title');
	 			post_title.attr('title',title);
	 			post_title.html(title);
	 			var p_content = $('#post_content .p_content');
	 			p_content.html(content);
	 			contentpart.next().show();
	 			contentpart.remove();
	 		}
	 		function location_replay(){
	 			var href = window.location.href.replace(/#.*$/,"");
	 			$('#replayBox').show();
	 			window.location.href = href+"#replayBox_a";
	 			$('#replayEditBox').focus();
	 			return false;
	 		}
	 		function replay(grade){
	 			if(<%=roleId%>==4){
	 				contentjs.showTip('failure','请先登录...',60);
	 				return false;
	 			}
	 			var comment = $('#replayEditBox').html();
	 			if(comment.replace(/(&nbsp;)|(<br\/?>)|(\s*)/gi,"").length==0){
	 				contentjs.showTip('failure','回复内容不能为空',110);
	 				return false;
	 			}
	 			content = comment.replace(/([\n\t\r]\s*)/gi,"");
	 			var content2 = getURLEncode(content);
	 			$.ajax({
	 				type:'post',
	 				url:"jsp_file/post_action.jsp",
	 				async:true,
	 				cache:false,
	 				dataType:'text',
	 				data:'grade='+grade+'&postId='+postId+'&content='+content2+'&method=4',
	 				success: function(msg){
	 					msg = eval("("+msg+")");
	 					if(msg.status=="true"){
	 						var info = msg.info;
	 						var infos = info.split(";");
	 						floor = floor+1;
	 						onloadReplay(infos[0],postId,content,grade,floor,infos[1]);
	 						contentjs.showTip('success','回复帖子成功',85);
	 						$('#replayEditBox').html("");
	 					}
	 					else{
	 						contentjs.showTip('failure','回复帖子失败...',90);
	 					}
	 				}
	 			});
	 			return false;
	 		}
	 		function onloadReplay(replayId,replay4Id,content,status,floor,inputTime){
	 			var p_postlist = $('.p_postlist');
 				var timestamp = new Date().getTime();
 				var div = '<div id="'+timestamp+'" style="display:none;"></div>';
 				var part = $(div).appendTo(p_postlist);
 				$(part).load("jsp_file/show_replay.jsp",{'replayId':replayId,'replay4Id':replay4Id,'content':content,'status':status,'floor':floor,'inputTime':inputTime},function(){
 					part.find('.l_post').unwrap();
 				});
 				return false;
	 		}
	 		function editReplay(obj,grade,replayId){
	 			if(grade==1){
	 				var comment_parent = $(obj).parent().parent().parent().prev();
	 				comment_parent.find('.d_post_content').attr('contenteditable',"true");
	 				comment_parent.addClass('p_content_edit');
	 				if(comment_parent.find('.toolBar').length==0){
	 					var comment = comment_parent.find('.d_post_content').html().replace(/\s*/g,"");
		 				var div='<div class="toolBar"><span onclick="cancelEditReplay(this,\''+comment+'\')" title="取消" class="btn save_btn">取消</span>'+
		 				'<span onclick="saveEditReplay(this,\''+replayId+'\')" title="保存" class="btn save_btn">保存</span></div>';
		 				$(div).appendTo(comment_parent);
	 				}
	 			}
	 		}
	 		function cancelEditReplay(obj,comment){
	 			var div = $(obj).parent();
	 			div.parent().removeClass('p_content_edit');
	 			div.prev().removeAttr('contenteditable');
	 			div.prev().html(comment);
	 			div.remove();
	 		}
	 		function saveEditReplay(obj,replayId){
	 			var div = $(obj).parent();
	 			var comment = div.prev().html().replace(/\s*/g,"");
	 			var comment2 = getURLEncode(content);
	 			$.ajax({
	 				type:'post',
	 				url:"jsp_file/post_action.jsp",
	 				async:true,
	 				cache:false,
	 				dataType:'text',
	 				data:'replayId='+replayId+'&content='+comment2+'&method=5',
	 				success: function(msg){
	 					msg = eval("("+msg+")");
	 					if(msg.status=="true"){
	 						cancelEditReplay(obj,comment);
	 						contentjs.showTip('success','修改回复成功',85);
	 					}
	 					else{
	 						contentjs.showTip('failure','修改回复失败...',90);
	 					}
	 				}
	 			});
	 		}
	 		function deleteReplay(obj,grade,replayId){
	 			if(!confirm("你确定要删除该条回复？")) return false;
	 			$.ajax({
	 				type:'post',
	 				url:"jsp_file/post_action.jsp",
	 				async:true,
	 				cache:false,
	 				dataType:'text',
	 				data:'replayId='+replayId+'&postId='+postId+'&grade='+grade+'&method=6',
	 				success: function(msg){
	 					msg = eval("("+msg+")");
	 					if(msg.status=="true"){
	 						var l_post = $(obj).parent().parent().parent().parent().parent();
	 						l_post.remove();
	 						contentjs.showTip('success','删除回复成功',85);
	 					}
	 					else{
	 						contentjs.showTip('failure','删除回复失败...',90);
	 					}
	 				}
	 			});
	 		}
	 		function doPraise(event){
	 			$.ajax({
	 				type:'post',
	 				url:"jsp_file/post_action.jsp",
	 				async:true,
	 				cache:false,
	 				dataType:'text',
	 				data:'postId='+postId+'&method=9',
	 				success: function(msg){
	 					msg = eval("("+msg+")");
	 					if(msg.status=="true"){
	 						adjustZanQueue(event);
	 					}
	 					else{
	 						contentjs.showTip('failure',msg.info,75);
	 					}
	 				}
	 			});
	 		}
	 		function adjustZanQueue(event){
	 			var repost_zan = $('.repost_zan');
				var count = $('.shareCount').html();
				var zan_user = $('.zan_user').html();
				if(repost_zan.attr('data-field')=="true"){
					repost_zan.html('赞');
					repost_zan.attr('data-field',false);
					count = Number(count)-1;
					$('.shareCount').html(count);
					contentjs.showSpecialTip(event,"-1");
					if(zan_user.indexOf(userName)>=0){
						zan_user = zan_user.replace(userName,"");
						zan_user = zan_user.replace(/(^[、])|([、]$)|([、]+)/,"");
					}
				}
				else{
					repost_zan.html('取消赞');
					repost_zan.attr('data-field',true);
					count = Number(count)+1;
					$('.shareCount').html(count);
					contentjs.showSpecialTip(event,"+1");
					zan_user =userName+"、"+zan_user;
					zan_user =zan_user.replace(/[、]$/,"");
				}
				$('.share_thread_wrapper').attr('title','累积被赞'+count+'次');
				$('.zan_user').html(zan_user);
				if(zan_user!="")
					$('.zan_user').parent().show();
				else
					$('.zan_user').parent().hide();
	 		}
	 	</script>
        <%@ include file="menu.jsp"%>
		<br><br>
    	<div id="doc">
    	<div class="jk_box" style='border-radius:5px 5px 0 0px'>
			<div class="jk_main" style="float:left;margin-bottom:3px;width:100%;">
				<div class="fr" style="box-shadow:0 1px 3px 2px rgba(0, 0, 0, 0.2);border-radius:4px;width:100%;margin-bottom:3px;">
					<div class="textbox_m textbox_r">
						<div style='position:relative;height:100%'>
							<h3 style="margin-top:10px;">帖子内容</h3>
							<div class="notice">
							<%@ include file="postHead.jsp"%>
							<div class="core" data="<%=postId%>">
								<div id="j_core_title_wrap" class="core_title_wrap">
									<div class="core_title core_title_theme_2">
										<h1 id="post_title" title="<%=postBean.getTitle() %>" class="core_title_txt ">
											<%=postBean.getTitle()%>
										</h1>
										<ul class="core_title_btns">
											<li>
												<a class="l_lzonly" href="javascript:void(0)" id="lzonly_cntn">
													<span class="d_lzonly_bdaside" id="lzonly">只看楼主</span>
												</a>
											</li>
											<li class="p_favthread" id="j_favthread">
												<div class="p_favthr_tip"></div>
												<div class="p_favthr_main" title="该功能尚未可用">
														收藏
												</div>
												<div class="p_favthr_listshadow">
													&nbsp;
												</div>
											</li>
											<li class="quick_reply">
												<a class="j_quick_reply" href="javascript:void(0)" onclick="location_replay()">回复</a>
											</li>
										</ul>
									</div>
								</div>
								<div id="j_p_postlist" class="p_postlist">
<%--								-------------------------------------------------------------	--%>
									<div class="l_post noborder">
										<div class="d_author">
											<div class="louzhubiaoshi_wrap">
												<div class="louzhubiaoshi j_louzhubiaoshi">
													<a href="javascript:void(0)"></a>
												</div>
											</div>
											<ul class="p_author">
												<li class="icon">
													<div class="icon_relative">
														<a href="<%=user.getUserName().equals(postBean.getInputUser())?"personalInfo.jsp":"javascript:void(0)"%>" 
															class="p_author_face">
															<img src="<%=postBean.getUserHead()%>">
														</a>
													</div>
												</li>
												<li class="d_name">
													<a target="_blank" href="javascript:void(0)" class="p_author_name j_user_card"><%=postBean.getInputUserName()%></a>
												</li>
												<li class="l_badge" style="display:block;">
													<div class="p_badge">
													<%String[] rankInfo = RankAction.getRankInfo(postBean.getUserRank());%>
														<div title="本帖帖主，头衔<%=rankInfo[0]%>级，经验值<%=postBean.getUserRank()%>"
															class="d_badge d_badge_icon2_2">
															<div class="d_badge_title">
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
										<div id="post_content" class="d_post_content_main">
											<div class="p_content">
												<%=postBean.getContent()%>
											</div>
											<div class="share_btn_wrapper">
												<div class="share_thread share_thread_wrapper" onclick="doPraise(event)"
													title="累计被赞<%=postBean.getPraiseNum()%>次">
													<div class="bdshare_t bds_tools get-codes-bdshare" id="bdshare_tb">
														<span class="bds_more dis_share_num" id="bds_share_more">
														<%ArrayList<UserBean> userlist = PostAction.getPraisePerson(postId);
														  boolean isZan = false;
														  String userNames = "";
														  String nickNames = "";
														  for(UserBean userPraise:userlist){
															  userNames += userPraise.getUserName()+"、";
															  if(Common.isBlank(userPraise.getNickName()))
															  	nickNames += userPraise.getUserName()+"、";
															  else
																nickNames += userPraise.getNickName()+"、";
														  }
														  if(userNames.indexOf(user.getUserName())>=0)
															  isZan = true;
														  userNames = userNames.replaceAll("、$","");
														  nickNames = nickNames.replaceAll("、$","");
														%>
														<span class="repost_zan" data-field="<%=isZan%>"><%=isZan?"取消赞":"赞"%></span>
														<span class="repost_num">
															(<a style="margin-top: 1px;" class="shareCount" href="javascript:void(0)"><%=postBean.getPraiseNum()%></a>)
														</span>
														</span>
													</div>
													<span class="share_btn_big_right"></span>
												</div>
											</div>
											<div style='padding-left:20px;display:<%=userlist.size()==0?"none":"block"%>'>
												<span class="zan_icon"></span>
												<span class="zan_user" style="display:inline-block;"><%=nickNames%></span>
											</div>
											<div class="core_reply j_lzl_wrapper">
												<a class="l_post_anchor"></a>
												<div class="core_reply_tail">
													<ul class="p_reply">
														<li><a class="p_reply_first" style="cursor:pointer" onclick="location_replay()">回复</a></li>
													</ul>
													<%if(user.getUserName().equals(postBean.getInputUser())){%>
													<ul class="p_reply">
														<li><a class="p_reply_first" href="javascript:void(0)" onclick="editPost(this)">编辑</a></li>
													</ul>
													<%}%>
													<ul class="p_tail">
														<li>
															<span class="">1楼</span>
														</li>
														<li>
															<span><%=postBean.getInputTime()%></span>
														</li>
													</ul>
												</div>
												<div style="display: none" class="j_lzl_container core_reply_wrapper">
													<div class="core_reply_border_top"></div>
													<div class="j_lzl_c_b_a core_reply_content">
														<ul style="display: none" class="j_lzl_m_w">
															<li data-field="" class="lzl_li_pager j_lzl_l_p lzl_li_pager_s">
																<p class="j_lzl_p">
																	<a href="javascript:void(0)">我也说一句</a>
																</p>
																<p>
																	&nbsp;
																</p>
															</li>
														</ul>
														<div style="display: none;"
															class="lzl_editor_container j_lzl_e_c lzl_editor_container_s"></div>
														<input type="text" style="display: none;"
															class="j_lzl_e_f_h">
													</div>
													<div class="core_reply_border_bottom"></div>
												</div>
											</div>
										</div>
									</div>
<%--								---------------------------------------------------------------	--%>
									<%
										int i =1;
										for(ReplayBean replayBean:list){
											i++;
									%>
									<div class="l_post">
										<div class="d_author">
											<ul class="p_author">
												<li class="icon">
													<div class="icon_relative j_user_card">
														<a href="javascript:void(0)" class="p_author_face ">
															<img src="<%=replayBean.getUserHead()%>">
														</a>
													</div>
												</li>
												<li class="d_name">
													<a target="_blank" href="javascript:void(0)" class="p_author_name sign_highlight j_user_card">
														<%=replayBean.getInputUserName()%>
													</a>
												</li>
												<li class="l_badge" style="display: block;">
													<div class="p_badge">
													<%rankInfo = RankAction.getRankInfo(replayBean.getUserRank());%>
														<div title="本吧头衔<%=rankInfo[0]%>级，经验值<%=replayBean.getUserRank()%>"
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
												<div class="d_post_content j_d_post_content">
													<%=replayBean.getComment() %>
												</div>
											</div>
											<div class="core_reply j_lzl_wrapper">
												<div class="core_reply_tail">
													<div class="j_lzl_r p_reply">
														<%if(user.getUserName().equals(replayBean.getInputUser())){%>
														<a style="display: inline;" class="lzl_link_unfold"
															href="javascript:void(0)" onclick="editReplay(this,1,'<%=replayBean.getReplayId()%>')">编辑</a>
														<%}%>
														<%if(roleId<=2){%>
														<a style="display: inline;" class="lzl_link_unfold"
															href="javascript:void(0)" onclick="deleteReplay(this,1,'<%=replayBean.getReplayId()%>')">删除</a>
														<%}%>
														<!-- <a style="display: inline;" class="lzl_link_unfold"
															 href="javascript:void(0)">回复(<%=replayBean.getReplayNum()%>)</a>
														<span style="display: none;" class="lzl_link_fold">收起回复</span>-->
													</div>
													<ul class="p_tail">
														<li>
															<span class=""><%=i%>楼</span>
														</li>
														<li>
															<span><%=replayBean.getInputTime()%></span>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<%}%>
					</div>
					<div id="replayBox">
						<a name="replayBox_a"></a>
						<div style="margin-left:150px;margin-top:10px;font-size:14px;font-weight:bold;">发表回复</div>
						<div class="replayBoxInner">
							<div id="replayEditBox" class="tb-editor-editarea" contenteditable="true" data="<%=postId%>">
								
							</div>
						</div>
						<div style="margin-left:150px;margin-top:-10px;">
							<a title="Ctrl+Enter快捷发表" class="ui_btn ui_btn_m j_submit poster_submit" href="javascript:void(0)" onclick="replay(1)">
			                    <span><em>发 表</em></span>
			                </a>
						</div>
					</div>
				</div>
				
				</div>
				</div>
				</div>
			</div>			
			<%@ include file="relativeInfo.jsp"%>
		</div>
		</div>
		<%@ include file="foot.jsp"%>