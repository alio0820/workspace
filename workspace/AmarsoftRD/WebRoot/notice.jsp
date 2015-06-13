<%@ page language="java" import="java.util.*,com.action.NoticeAction,com.bean.NoticeBean" pageEncoding="utf-8"%>
		<%String title="会议公告";%>
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
			.contentpart:hover .close{
				display:block;
			}
		</style>
		<%if(roleId<=2){%>
		<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
	    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
	    <%}%>
		<script>
	 		$(document).ready(function(){
	 			$('.contentpart .header').click(function(){
	 	 			$(this).next().slideToggle();
	 	 		});
	 			<%if(roleId<=2){%>
	 			contentjs.initUeditor('editor');
	 			<%}%>
	 		});
	 		<%if(roleId<=2){%>
	 		//编辑功能
	 		function editNotice(obj){
	 			var contentpart = $(obj).parent().parent();
 				var noticeId = contentpart.attr('data');
 				var title = contentpart.find('.content_title').html();
 				var call = contentpart.find('.content_salutation').html();
 				var content = contentpart.find('.content_info').html();
 				var publisher = contentpart.find('.publisher').html();
 				var time = contentpart.find('.time').html();
 				
 				var timestamp = new Date().getTime();
 				var div = '<div id="'+timestamp+'" style="display:none;"></div>';
 				var editpart = $(div).insertBefore(contentpart);
 				$(editpart).load("jsp_file/show_notice.jsp",{'timestamp':timestamp,'noticeId':noticeId,'title':title,'call':call,'publisher':publisher,'time':time,'status':2},function(){
 					contentjs.initUeditor('editor_'+timestamp,content);
 					contentpart.hide();
 					editpart.find('.content').show();
 					editpart.find('.header').click(function(){
 						$(this).next().slideToggle();
 					});
 					editpart.find('.contentpart').unwrap();
 				});
 				return false;
	 		}
	 		//删除公告
	 		function delNotice(obj){
	 			var contentpart = $(obj).parent();
	 			var noticeId = contentpart.attr('data');
	 			if(!confirm('你确定删除该条公告？')) return false;
	 			$.ajax({
	 				type:'post',
	 				url:"jsp_file/notice_action.jsp",
	 				async:true,
	 				cache:false,
	 				dataType:'text',
	 				data:'noticeId='+noticeId,
	 				success: function(msg){
	 					msg = eval("("+msg+")");
	 					if(msg.status=="success"){
	 						contentpart.remove();
	 						contentjs.showTip('success','删除公告成功',85);
	 					}
	 					else{
	 						contentjs.showTip('failure','删除公告失败...',90);
	 					}
	 				}
	 			});
	 			return false;
	 		}
	 		//发表新公告
	 		function publishNotice(){
	 			//title call publisher time content
	 			var title = document.getElementById('title').value;
	 			var call = document.getElementById('call').value;
	 			var publisher = document.getElementById('publisher').value;
	 			var time = document.getElementById('time').value;
	 			var content = UE.getEditor('editor').getContent().replace(/([\n\t\r]\s*)/gi,"");
	 			//判断输入内容是否为空
	 			if(title==""){
	 				contentjs.showTip('failure','标题不能为空...',90);return false;
	 			}else if(call==""){
	 				contentjs.showTip('failure','称呼不能为空...',90);return false;
	 			}else if(publisher==""){
	 				contentjs.showTip('failure','发布者不能为空...',100);return false;
	 			}else if(content==""){
	 				contentjs.showTip('failure','内容不能为空...',90);return false;
	 			}
	 			
	 			var content2 = getURLEncode(content);
	 			$.ajax({
	 				type:'post',
	 				url:"jsp_file/notice_action.jsp",
	 				async:true,
	 				cache:false,
	 				dataType:'text',		//json类型貌似不能用alert弹值，html类型输出的是全部的html,包括换行符
	 				data:'title='+title+'&call='+call+'&publisher='+publisher+'&time='+time+'&content='+content2,
	 				success: function(msg){
	 			//		msg = msg.replace(/\n$/,"");//去掉后面的换行符
	 					msg = eval("("+msg+")");
	 					if(msg.status=="success"){
	 						onloadNotice(null,title,call,content,publisher,time,msg.id);
	 						document.getElementById('title').value="";
	 						UE.getEditor('editor').setContent("");
	 						contentjs.showTip('success','发布公告成功',85);
	 					}
	 					else{
	 						contentjs.showTip('success','发布公告失败...',90);
	 					}
	 				}
	 			});
	 			return false;
	 		}
	 		//更新公告
	 		function saveNotice(obj,name){
	 			var contentpart = $(obj).parent().parent();
	 			var noticeId = contentpart.attr("data");
	 			var title = contentpart.find('.edit_title').val();
	 			var call = contentpart.find('.edit_salutation').val();
	 			var publisher = contentpart.find('.edit_publisher').val();
	 			var time = contentpart.find('.edit_time').val();
	 			var content = UE.getEditor(name).getContent().replace(/([\n\t\r]\s*)/gi,"");
	 			
	 			//判断输入内容是否为空
	 			if(title==""){
	 				contentjs.showTip('failure','标题不能为空...',90);return false;
	 			}else if(call==""){
	 				contentjs.showTip('failure','称呼不能为空...',90);return false;
	 			}else if(publisher==""){
	 				contentjs.showTip('failure','发布者不能为空...',100);return false;
	 			}else if(content==""){
	 				contentjs.showTip('failure','内容不能为空...',90);return false;
	 			}
	 			
	 			var content2 = getURLEncode(content);
	 			$.ajax({
	 				type:'post',
	 				url:"jsp_file/notice_action.jsp",
	 				async:true,
	 				cache:false,
	 				dataType:'text',		//json类型貌似不能用alert弹值，html类型输出的是全部的html,包括换行符
	 				data:'title='+title+'&call='+call+'&noticeId='+noticeId+'&content='+content2+'&publisher='+publisher+'&time='+time,
	 				success: function(msg){
	 					msg = eval("("+msg+")");
	 					if(msg.status=="success"){
	 						onloadNotice(contentpart,title,call,content,publisher,time,noticeId);
	 						contentpart.next().remove();
	 						contentpart.remove();
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
	 			var contentpart = $(obj).parent().parent().next();
	 			contentpart.show();
	 			contentpart.prev().remove();
	 			return false;
	 		}
	 		//动态加载刚更新或新发布的公告
	 		function onloadNotice(contentpart,title,call,content,publisher,time,noticeId){
 				var div = '<div style="display:none;"></div>';
 				var editpart = null;
 				if(contentpart!=null)
 					editpart = $(div).insertBefore(contentpart);
 				else
 					editpart = $(div).prependTo($('.notice'));
 				$(editpart).load("jsp_file/show_notice.jsp",{'noticeId':noticeId,'title':title,'call':call,'content':content,'publisher':publisher,'time':time,'status':1},function(){
 					editpart.find('.content').show();
 					editpart.find('.header').click(function(){
 						$(this).next().slideToggle();
 					});
 					editpart.find('.contentpart').unwrap();
 				});
	 		}
	 		<%}%>
	 	</script>
        <%@ include file="menu.jsp"%>
		<br><br>
    	<div id="doc">
    	<div class="jk_box" style='border-radius:5px 5px 0 0px'>
			<div class="jk_main"><!-- 第五层-Main页面-->
				<%@ include file="main_left.jsp"%>
				<div class="textbox fr"><!-- 右侧页面-->
					<div class="textbox_top"></div>
					<div class="textbox_m" style="min-height:710px;width:648px;_height:710px;position:relative;">
						<div style='position:relative;height:100%'>
							<h3>研发部内部公告</h3>
							<div class="notice">
							<%
								ArrayList<NoticeBean> list = NoticeAction.getAllNotices();
								for(NoticeBean noticeBean : list){%>
									<div class="contentpart" data ="<%=noticeBean.getNoticeId()%>">
									<%if(roleId<=2){%><div class="close" onclick="delNotice(this)"></div><%}%>
				    				<div class="header"><%=noticeBean.getTitle()%>
				    					<%if(roleId<=2){%><span class="btn edit_btn" title="编辑" onclick="editNotice(this)">编辑</span><%}%>
				    				</div>
				    				<div class="content">
										<div class="content_title"><%=noticeBean.getTitle()%></div>
										<div class="content_salutation"><%=noticeBean.getAppellation()%></div>
										<div class="content_info"><%=noticeBean.getContent()%></div>
										<div class="content_foot"><span class="publisher"><%=noticeBean.getDepartment()%></span><br/>
										<span class="time"><%=noticeBean.getInputTime()%></span></div>
				    				</div>
				    			</div>
								<%}if(roleId<=2){%>
			    				<%@ include file="jsp_file/show_notice.jsp"%>
			    				<%}else{%>
									<div class="contentpart" data ="">
										<div class="header">普通用户不能发布公告，如需发布公告，请联系管理员陈晚秋或翟老师</div>
									</div>
								<%}%>
							</div>
						</div>
					</div>
					<div class="textbox_btm"></div>
				</div>
			</div>			
			<%@ include file="relativeInfo.jsp"%>
		</div>
		</div>
		<%@ include file="foot.jsp"%>