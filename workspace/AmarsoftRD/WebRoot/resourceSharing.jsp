<%@ page language="java" import="java.util.*,com.tool.MyFile,com.bean.FileBean" pageEncoding="utf-8"%>
		<%String title="资源分享";%>
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
			.dropbox{
				padding:0 10px 10px 10px;
			}
		</style>
		<script>
	 		/*$(document).ready(function(){
	 			var dropbox = document.getElementById('dropbox');
	 			var preview = document.getElementById('preview');
	 			document.addEventListener("dragenter", function(e){ 
	 			    dropbox.style.borderColor = 'gray'; 
	 			}, false); 
	 			document.addEventListener("dragleave", function(e){ 
	 			    dropbox.style.borderColor = 'silver'; 
	 			}, false); 
	 			dropbox.addEventListener("dragenter", function(e){ 
	 			    dropbox.style.borderColor = 'gray'; 
	 			    dropbox.style.backgroundColor = 'white'; 
	 			}, false); 
	 			dropbox.addEventListener("dragleave", function(e){ 
	 			    dropbox.style.backgroundColor = 'transparent'; 
	 			}, false); 
	 			dropbox.addEventListener("dragenter", function(e){ 
	 			    e.stopPropagation(); 
	 			    e.preventDefault(); 
	 			}, false); 
	 			dropbox.addEventListener("dragover", function(e){ 
	 			    e.stopPropagation(); 
	 			    e.preventDefault(); 
	 			}, false); 
	 			dropbox.addEventListener("drop", function(e){ 
	 			    e.stopPropagation(); 
	 			    e.preventDefault(); 
	 			     
	 			    handleFiles(e.dataTransfer.files); 
	 			     
	 			    //submit.disabled = false; 
	 			}, false);
	 			
	 			//用handleFiles()依次处理所有文件
	 			handleFiles = function(files) {
	 			    for (var i = 0; i < files.length; i++) {
	 			        var file = files[i];*/
	 			        //if(!file.type.match(/image*/)) {
	 			    	/*    continue;
	 			    	}
	 			       	var img = document.createElement("img");
	 			      	img.classList.add("obj");
	 			      	img.file = file; 
	 			      	preview.appendChild(img);
	 			       
	 			      	var reader = new FileReader(); 
	 			      	reader.onload = (function(aImg) { return function(e) {  aImg.src = e.target.result; }; })(img); 
	 			      	reader.readAsDataURL(file);
	 			      	
*/	 			      	
/*	 			      	var xhr = new XMLHttpRequest(); 
		 			  	xhr.open('post', '/file/upload', true); 

		 			  	//监听上传进度和完成事件
		 			  	xhr.upload.addEventListener("progress", function(e) { 
		 			      if (e.lengthComputable) { 
		 			          var percentage = Math.round((e.loaded * 100) / e.total); 
		 			          img.style.opacity = 1-percentage/100.0; 
		 			      } 
		 			  	}, false); 
		 			   
		 			  	xhr.upload.addEventListener("load", function(e){ 
		 			       
		 			  	}, false); 

		 			  	//最后把数据模拟成multipart/form-data的格式上传
		 			  	xhr.setRequestHeader("Content-Type", "multipart/form-data, boundary="+boundary); // simulate a file MIME POST request. 
		 			  	xhr.setRequestHeader("Content-Length", fileSize); 
		 			   
		 			  	var body = ''; 
		 			  	body += "--" + boundary + "\r\n"; 
		 			  	body += "Content-Disposition: form-data; name=\""+dropbox.getAttribute('name')+"\"; filename=\"" + fileName + "\"\r\n"; 
		 			  	body += "Content-Type: "+fileType+"\r\n\r\n"; 
		 			  	body += fileData + "\r\n"; 
		 			  	body += "--" + boundary + "--\r\n"; 
		 			  	xhr.sendAsBinary(body);
	 			    }
	 			}
	 		});*/
	 	</script>
        <%@ include file="menu.jsp"%>
		<br><br>
    	<div id="doc">
    	<div class="jk_box" style='border-radius:5px 5px 0 0px'>
			<div class="jk_main" style="float:left;margin-bottom:3px;width:100%;">
				<div class="fr" style="box-shadow:0 1px 3px 2px rgba(0, 0, 0, 0.2);border-radius:4px;width:100%;">
					<div class="textbox_m textbox_r">
						<div style='position:relative;padding-bottom:10px;'>
							<h3 style="margin-top:10px;">研发部资源分享</h3>
							<div class="notice">
								<div class="contentpart" style="cursor: default;">
				    				<div class="header">已共享文件...</div>
				    			</div>
								<div class="dropbox">
									<%
				    				ArrayList<FileBean> list = MyFile.getFileList(application.getRealPath("/"),"download");
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
					    			<%}%>
				    			</div>
				    			<%if(roleId<=3){%>
								<div class="contentpart" style="cursor: default;">
				    				<div class="header">点击Upload按钮即可完成上传...</div>
				    			</div>
				    			<div name="image" id="dropbox" style="padding:10px;">
				    				<%@ include file="uploader/uploader.jsp"%>
				    			</div>
				    			<div id="preview"></div>
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