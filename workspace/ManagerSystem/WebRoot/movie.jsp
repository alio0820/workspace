<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="head.jsp"%>
<style>
	#video{
		width:640px;
		height:360px;
	}
</style>
<div>
	<video id='video' poster>
		<source src ='video/lingdao.mp4'/>
	</video>
	<script>
		video = document.getElementById('video');
		video.play();
	</script>
</div>
<%@ include file="foot.jsp"%>