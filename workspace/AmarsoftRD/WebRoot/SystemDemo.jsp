<%@ page language="java" import="java.util.*,com.action.PostAction,com.bean.PostBean" pageEncoding="utf-8"%>
		<%String title="系统演示";%>
		<%@ include file="head.jsp"%>
		<style>
			.titleContainer{
				border-radius:3px;
				padding:15px 0 0 10px;
				line-height:22px;
				background:#FAEEBE;
				height:81px;
				position:relative;
			}
			.boxContainer{
				padding:20px 0;
			}
			.demobox{
				border:1px solid #C9C7C8;	
				border-radius:100%;
				height:200px;
				width:205px;
				padding:5px;
				cursor:pointer;
				float:left;
				margin-right:13px;
				margin-bottom:20px;
				box-shadow:0 1px 3px rgba(0, 0, 0, 0.3);
			}
			.demobox:hover{
				opacity:0.9;
			}
			.demobox .box_logo{
				text-align:center;
				font-size:15px;
				font-weight:bold;
				color:#89C97D;
				overflow:hidden;
				margin-top:30px;
			}
			.demobox .box_logo:hover{
				color:#F4AA6E;
			}
			.demobox .box_location{
				width:180px;
				height:20px;
				margin-left:10px;
				margin-top:5px;
				overflow:hidden;
			}
			.demobox .box_describe{
				width:180px;
				height:95px;
				margin-left:10px;
				overflow:hidden;
			}
			.demobox .describe{
				width:35px;
				display:inline-block;
				float:left;
			}
			.demobox .information{
				display:inline-block;
			}
			.box_status{
				text-align:center;
			}
			.no-margin-right{
				margin-right:0px;
			}
		</style>
		<script>
	 		$(document).ready(function(){
	 			var demobox = $('.demobox');
	 			demobox.hover(function(){
	 				$(this).stop().animate({
						'margin-top':"-20px"
					}, 200);
	 			},function(){
	 				$(this).stop().animate({
						'margin-top':"0px"
					}, 200);
	 			});
	 			demobox.click(function(){
	 				var href = $(this).find('.box_location .information').html();
	 				window.open(href, "_blank");
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
							<h3 style="margin-top:10px;">系统演示<font size=12>（该演示系统可能存在与实际系统不一致的部分，具体以实际发布系统为准）</font></h3>
							<div class="notice">
								<div class="titleContainer">
									<div>常用系统</div>
									<div>非常用系统</div>
									<div>正在开发中系统...（请耐心等待）</div>
								</div>
								<div class="boxContainer">
									<div style="height:232px;float:left;">
									<div class="demobox">
										<div class="box_logo">Amarsoft研发部内部系统</div>
										<div class="box_location">
											<span class="information">http://localhost:8080/AmarsoftRD/</span>
										</div>
										<div class="box_describe">
											<span class="information">AmarsoftRD系研发部内部系统第二代，包含研发部规章制度、会议公告、
											技术API、产品文档、华安社区、系统演示及资源共享等模块</span>
										</div>
										<div class="box_status">
											<span class="information">目前已上线</span>
										</div>
									</div>
									
									
									<div class="demobox">
										<div class="box_logo">Amarsoft研发部内部系统</div>
										<div class="box_location">
											<span class="information">http://localhost:8080/AmarsoftRD/</span>
										</div>
										<div class="box_describe">
											<span class="information">AmarsoftRD系研发部内部系统第二代，包含研发部规章制度、会议公告、
											技术API、产品文档、华安社区、系统演示及资源共享等模块</span>
										</div>
										<div class="box_status">
											<span class="information">目前已上线</span>
										</div>
									</div>
									
									
									
									<div class="demobox">
										<div class="box_logo">Amarsoft研发部内部系统</div>
										<div class="box_location">
											<span class="information">http://localhost:8080/AmarsoftRD/</span>
										</div>
										<div class="box_describe">
											<span class="information">AmarsoftRD系研发部内部系统第二代，包含研发部规章制度、会议公告、
											技术API、产品文档、华安社区、系统演示及资源共享等模块</span>
										</div>
										<div class="box_status">
											<span class="information">目前已上线</span>
										</div>
									</div>
									
									
									<div class="demobox no-margin-right">
										<div class="box_logo">Amarsoft研发部内部系统</div>
										<div class="box_location">
											<span class="information">http://localhost:8080/AmarsoftRD/</span>
										</div>
										<div class="box_describe">
											<span class="information">AmarsoftRD系研发部内部系统第二代，包含研发部规章制度、会议公告、
											技术API、产品文档、华安社区、系统演示及资源共享等模块</span>
										</div>
										<div class="box_status">
											<span class="information">目前已上线</span>
										</div>
									</div>
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