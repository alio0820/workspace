<%@ page language="java" import="java.util.List" pageEncoding="gbk"%>
<%@ page import="com.aes.action.PaperAction,com.aes.beans.PaperTopicBean" %>
<%
	String param = request.getParameter("param");
	int index = param.indexOf(";");
	String examPaperId = param.substring(0,index);
	String examPaperName = param.substring(index+1);
%>
<div id="content" class="span10">
	<div>
		<ul class="breadcrumb">
			<li>
				<a href="#">Home</a> <span class="divider">/</span>
			</li>
			<li>
				<a href="#">试卷生成</a>
			</li>
		</ul>
	</div>
	<div class="row-fluid sortable">
		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2><i id="<%=examPaperId%>" class="icon-globe"></i> <%=examPaperName%>——试卷内容</h2>
				<div class="box-icon">
					<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
					<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
					<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
				</div>
			</div>
			<div class="box-content">
				<table class="table table-striped table-bordered bootstrap-datatable datatable">
			  <thead>
				  <tr>
				  	  <th style="width:70px;">题目编号</th>
					  <th>试题名称</th>
					  <th>试题类型</th>
					  <th>试题考点</th>
					  <th>正确率</th>
<%--					  <th>创建者</th>--%>
<%--					  <th>创建时间</th>--%>
<%--					  <th>更新时间</th>--%>
<%--					  <th>状态</th>--%>
					  <th style='padding:3px;'><span style="margin-top:5px;margin-left:5px;display:inline-block">动作</span>
					  	<a class="btn btn-success btn-circle" href="#" title="预览" onclick="return as_preview_paper('2013092300000001'<%/*=examPaperId*/%>)">
							<i class="icon-screenshot icon-white"></i>
						</a>
					  </th>
				  </tr>
			  </thead>
			  <tbody>
			  <%
			  	List paperTopicList = PaperAction.getPaperTopic(examPaperId);
			  	int size_paperTopicList = paperTopicList.size();
			  	for(int i=0;i<size_paperTopicList;i++){
			  		PaperTopicBean ptb = (PaperTopicBean)(paperTopicList.get(i));
			  		String questionId = ptb.getQuestionId();
			  		String questionName = ptb.getQuestionName();
			  		String sortNo = ptb.getSortNo();
			  		String topicTypeId = ptb.getTopicTypeId();
			  		String topicTypeName = ptb.getTopicTypeName();
			  		String topicRangeId = ptb.getTopicRangeId();
			  		String topicRangeName = ptb.getTopicRangeName();
			  		String accuracyRate = ptb.getAccuracyRate();
			  %>
				<tr id="<%=questionId%>">
					<td><%=sortNo%></td>
					<td><%=questionName %></td>
					<td id="<%=topicTypeId%>"><%=topicTypeName%></td>
					<td id="<%=topicRangeId%>"><%=topicRangeName%></td>
					<td><%=accuracyRate%></td>
					<td class="center">
						<a class="btn btn-success" onclick="return alert('您好')">
							<i class="icon-zoom-in icon-white"></i>  
							查看                                            
						</a>
						<a class="btn btn-info" href="#">
							<i class="icon-edit icon-white"></i>  
							编辑                                            
						</a>
						<a class="btn btn-danger" href="#">
							<i class="icon-trash icon-white"></i> 
							删除
						</a>
					</td>
				</tr>
				<%}if(size_paperTopicList==0){
				%>
				<tr><td colspan="6">该试卷还没有添加任何试题...</td></tr>
				<%}%>
			  </tbody>
		  </table>
			</div>
		</div>
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
			<ul class="nav nav-tabs" id="myTab">
				<li class="active"><a href="#info">题库录入</a></li>
				<li><a href="#info">手动录入</a></li>
				<li><a href="#messages">提示信息</a></li>
			</ul>
			 
			<div id="myTabContent" class="tab-content" style="overflow:visible">
				<div class="tab-pane active" id="info">
					<%@ include file="div_part/queryForTopic.jsp" %>
				</div>
				<div class="tab-pane" id="custom">
					<h3>Custom <small>small text</small></h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare nulla. Donec consectetur, velit a pharetra ultricies, diam lorem lacinia risus, ac commodo orci erat eu massa. Sed sit amet nulla ipsum. Donec felis mauris, vulputate sed tempor at, aliquam a ligula. Pellentesque non pulvinar nisi.</p>
				</div>
				<div class="tab-pane" id="messages">
					<h3>Messages <small>small text</small></h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare nulla. Donec consectetur, velit a pharetra ultricies, diam lorem lacinia risus, ac commodo orci erat eu massa. Sed sit amet nulla ipsum. Donec felis mauris, vulputate sed tempor at, aliquam a ligula. Pellentesque non pulvinar nisi.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor.</p>
				</div>
			</div>
			
		</div>
	</div>
	</div>
	<div id="topicDesignMainParent" class="row-fluid sortable" style="display:none">
		<div id="topicDesignMain" class="box span12">
			<div class="box-header well" data-original-title>
				<h2><i class="icon-font"></i> 添加试题</h2>
				<div class="box-icon">
					<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
					<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
					<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
				</div>
			</div>
		</div>
	</div>
	<div id="topicImport" class="row-fluid sortable" style="display:none">
		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2><i class="icon-user"></i> 题库-单项选择题</h2>
				<div class="box-icon">
					<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
					<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
					<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
				</div>
			</div>
		</div>
	</div>
</div>