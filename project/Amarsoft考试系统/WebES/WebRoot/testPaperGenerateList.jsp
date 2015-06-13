<%@ page language="java" import="java.util.List" pageEncoding="gbk"%>
<%@ page import="com.action.PaperAction,com.bean.PaperTopicBean" %>
<%
	String param = request.getParameter("param");
	String[] params = param.split(";");
	String examPaperId = params[0];
	String examPaperName = params[1];
	String target = params[2];
	List paperTopicList = PaperAction.getPaperTopic(examPaperId);
  	int size_paperTopicList = paperTopicList.size();
%>
<div id="content" class="span10">
	<div>
		<ul class="breadcrumb">
			<li>
				<a href="#">Home</a> <span class="divider">/</span>
			</li>
			<li>
				<a href="#">�Ծ�����</a>
			</li>
		</ul>
	</div>
	<div id ="paperContent" class="row-fluid sortable">
		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2 id="paperHeader"><i id="<%=examPaperId%>" class="icon-globe"></i> <%=examPaperName%>�����Ծ�����</h2>
				<div class="box-icon">
					<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
					<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
					<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
				</div>
			</div>
			<div class="box-content">
				<table class="table table-striped table-bordered bootstrap-datatable datatable" data = "<%=size_paperTopicList%>">
			  <thead>
				  <tr>
				  	  <th style="width:70px;">��Ŀ���</th>
					  <th>��������</th>
					  <th>��������</th>
					  <th>���⿼��</th>
					  <th>��ȷ��</th>
<%--					  <th>������</th>--%>
<%--					  <th>����ʱ��</th>--%>
<%--					  <th>����ʱ��</th>--%>
<%--					  <th>״̬</th>--%>
					  <th style='padding:3px;'><span style="margin-top:5px;margin-left:5px;display:inline-block">����</span>
					  	<a class="btn btn-success btn-circle" href="#" title="Ԥ��" onclick="return as_preview_paper('2013092300000001'<%/*=examPaperId*/%>)">
							<i class="icon-screenshot icon-white"></i>
						</a>
						<a class="back" title="����" onclick="contentApp.switchMenu('<%=target%>');">
							<i class="icon32 icon-color icon-arrowthick-w"></i>
						</a>
					  </th>
				  </tr>
			  </thead>
			  <tbody>
			  <%
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
						<a class="btn btn-success" onclick="return getTopicDetail(this)">
							<i class="icon-zoom-in icon-white"></i>  
							�鿴                                            
						</a>
						<a class="btn btn-info" href="#" onclick="return as_paper_edit_topic(this)">
							<i class="icon-edit icon-white"></i>  
							�༭                                            
						</a>
						<a class="btn btn-danger" href="#" onclick="return as_paper_del_topic(this)">
							<i class="icon-trash icon-white"></i> 
							ɾ��
						</a>
					</td>
				</tr>
				<%}if(size_paperTopicList==0){
				%>
				<tr><td colspan="6">���Ծ�û������κ�����...</td></tr>
				<%}%>
			  </tbody>
		  </table>
			</div>
		</div>
	</div>
	<div id="queryForTopic" class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-globe"></i> ѡ������</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
				<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
				<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
			</div>
		</div>
		<div class="box-content">
			<ul class="nav nav-tabs" id="myTab">
				<li class="active"><a href="#info">���¼��</a></li>
				<li><a href="#info">�ֶ�¼��</a></li>
				<li><a href="#messages">��ʾ��Ϣ</a></li>
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
	<div id="topicDesignMainParent" class="row-fluid sortable">
		<div id="topicDesignMain" class="box span12" style="display:none">
			<div class="box-header well" data-original-title>
				<h2><i class="icon-font"></i> �������</h2>
				<div class="box-icon">
					<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
					<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
					<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
				</div>
			</div>
		</div>
	</div>
	<div id="topicImportParent" class="row-fluid sortable">
		<div id="topicImport" class="box span12" style="display:none">
			<div class="box-header well" data-original-title>
				<h2><i class="icon-search"></i> <span id="topicImportTitle"></span></h2>
				<div class="box-icon">
					<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
					<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
					<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
				</div>
			</div>
		</div>
	</div>
</div>