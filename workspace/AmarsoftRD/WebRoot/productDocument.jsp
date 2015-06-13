<%@ page language="java" import="java.util.*,com.tool.MyFile,com.bean.FileBean" pageEncoding="utf-8"%>
		<%String title="研发部产品文档";%>
		<%@ include file="head.jsp"%>
		<style>
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
				--font-weight: bold;
			}
			.contentpart a{
				display:inline-block;
				width:100%;
				overflow:hidden;
				color:#666666;
			}
			.icon{
				background-image:url("images/pic/glyphicons-halflings.png");
				background-repeat:no-repeat;
				display:inline-block;
				height:14px;
				width:14px;
				line-height:14px;
				vertical-align:text-top;
				opacity:0.7;
			}
			.icon-th{
				background-position:-240px 0;
			}
			.icon-folder-close{
				background-position:-384px -120px;
			}
			.icon-folder-open{
				background-position:-408px -120px;
			}
			.icon-file{
				background-position:-24px -24px;
			}
		</style>
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
							<h3>研发部产品文档</h3>
							<div class="notice">
			    			<%
			    				ArrayList<FileBean> list = MyFile.getFileList(application.getRealPath("/"),"document/Product");
			    				for(FileBean fileBean :list){
			    			%>
    						<div class="contentpart">
			    				<a class="header" path="<%=fileBean.getCurrentPath()%>" isFolder="<%=fileBean.isFolder()%>">
			    					<i class="icon-th icon"></i>
			    					<%=fileBean.getName()%>
			    					<%if(roleId<=2){%><div class="close"></div><%}%>
			    				</a>
			    				<%if(fileBean.isFolder()){%>
			    				<div class="content">
			    				</div>
			    				<%}%>
			    			</div>
			    			<%}if(list.size()==0){%>
			    				<div class="contentpart">
			    					<a class="header">还未放置任何产品文档...</a>
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