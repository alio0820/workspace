<%@ page language="java" pageEncoding="utf-8"%>
<link href="uploader/css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="uploader/js/swfupload.js"></script>
<script type="text/javascript" src="uploader/js/swfupload.queue.js"></script>
<script type="text/javascript" src="uploader/js/fileprogress.js"></script>
<script type="text/javascript" src="uploader/js/handlers.js"></script>
<%
	Cookie cookie =new Cookie("jsessionid","");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
%>
<script type="text/javascript">
		var swfu;
		var jsessionid="<%=request.getSession().getId()%>";
		window.onload = function() {
			var settings = {
				flash_url : "uploader/js/swfupload.swf",
				upload_url: "jscripts/uploadFile;jsessionid="+jsessionid,//解决session丢失问题
				post_params: {"PHPSESSID" : "<?php echo session_id(); ?>"},
				file_size_limit : "100 MB",
				file_types : "*.*",
				file_types_description : "All Files",
				file_upload_limit : 100,
				file_queue_limit : 0,
				custom_settings : {
					progressTarget : "fsUploadProgress",
					cancelButtonId : "btnCancel"
				},
				debug: false,

				// Button settings
				button_image_url: "uploader/images/TestImageNoText_65x29.png",
				button_width: "65",
				button_height: "29",
				button_placeholder_id: "spanButtonPlaceHolder",
				button_text: '<span class="theFont">Upload</span>',
				button_text_style: ".theFont { font-size: 15;}",
				button_text_left_padding: 12,
				button_text_top_padding: 3,
				
				// The event handler functions are defined in handlers.js
				file_queued_handler : fileQueued,
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_start_handler : uploadStart,
				upload_progress_handler : uploadProgress,
				upload_error_handler : uploadError,
				upload_success_handler : uploadSuccess,
				upload_complete_handler : uploadComplete,
				queue_complete_handler : queueComplete	// Queue plugin event
			};

			swfu = new SWFUpload(settings);
	     };
	</script>
<div>
	<h2>file upload</h2>
	<form id="form1" action="index.php" method="post" enctype="multipart/form-data">
		<p>该页面专为文件上传而订制</p>
			<div class="fieldset flash" id="fsUploadProgress">
			<span class="legend">Upload Queue</span>
			</div>
		<div id="divStatus">0 Files Uploaded</div>
		<div>
			<span id="spanButtonPlaceHolder"></span>
			<input id="btnCancel" type="button" value="Cancel All Uploads" onclick="swfu.cancelQueue();" disabled="disabled" style="margin-left: 2px; font-size: 8pt; height: 29px;" />
		</div>
	</form>
</div>
