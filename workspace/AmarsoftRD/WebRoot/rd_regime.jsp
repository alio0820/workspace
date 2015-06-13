<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
		<%String title="研发部管理章程";%>
		<%@ include file="head.jsp"%>
<%--		<script src="js/nicEdit.js"></script>--%>
		<script>
//			bkLib.onDomLoaded(function() {
//			new nicEditor({ fullPanel: true }).panelInstance('txtContent');
//			});
		</script>
		<style>
			.notice .contentpart .content {
				display: block;
			}
			.content_info a {
				width: 100%;
				height: 30px;
				line-height: 28px;
				display: inline-block;
			}
			.content_info a:hover {
				background: #FAF4FF;
			}
			.contentpart .header {
				font-weight: bold;
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
			<div class="jk_main"><!-- 第五层-Main页面-->
				<%@ include file="main_left.jsp"%>
				<div class="textbox fr"><!-- 右侧页面-->
					<div class="textbox_top"></div>
					<div class="textbox_m" style="min-height:710px;width:648px;_height:710px;position:relative;">
						<div style='position:relative;height:100%'>
							<h3>研发部管理章程</h3>
							<div class="notice">
							<div class="contentpart">
			    				<div class="header">管理章程及相关文档</div>
			    				<div class="content">
									<div class="content_title"></div>
									<div class="content_salutation"></div>
									<div class="content_info">
										<a href="download.jsp?data=download/001你hao.pdf">研发部管理章程001你hao.pdf</a>
										<a href="download.jsp?data=download/file/01.doc">研发部管理章程-小寨.doc</a>
										<a href="download.jsp?data=download/file/小李.doc">中文文件名</a>
									</div>
									<div class="content_foot"></div>
			    				</div>
			    			</div>
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