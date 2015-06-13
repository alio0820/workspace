<%@ page language="java"  pageEncoding="gbk"%>

<div id="content" class="span10">
	<div>
		<ul class="breadcrumb">
			<li>
				<a href="#">Home</a> <span class="divider">/</span>
			</li>
			<li>
				<a href="#">题库管理</a>
			</li>
		</ul>
	</div>
	<div id="queryForTopic" class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-globe"></i> 选择试题</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
				<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
				<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
			</div>
		</div>
		<div class="box-content">
			<%@ include file="div_part/queryForTopic.jsp" %>
		</div>
	</div>
	</div>
	<%
		if(topicType.size()!=0){
			String _topicTypeId = ((String[])topicType.get(0))[0];
			if(_topicTypeId.equals("SingleChoice")){
	%>
	<%@ include file="div_part/topicBank01.jsp" %>
	<%}else if(_topicTypeId.equals("MultipleChoice")){ %>
	<%@ include file="div_part/topicBank02.jsp" %>
	<%}else if(_topicTypeId.equals("Blank")){ %>
	<%@ include file="div_part/topicBank03.jsp" %>
	<%}else if(_topicTypeId.equals("Judge")){ %>
	<%@ include file="div_part/topicBank04.jsp" %>
	<%}else{ %>
	<%@ include file="div_part/topicBank05.jsp" %>
	<%}}%>
</div>