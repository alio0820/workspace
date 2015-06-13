<%@page import="com.bean.PaperBean"%>
<%@ page language="java" import="com.action.PaperAction,java.util.List" pageEncoding="gbk"%>
<%
	List allPaper = PaperAction.getAllPaper();
	int size = allPaper.size();
%>
<div id="content" class="span10">
	<div>
		<ul class="breadcrumb">
			<li>
				<a href="">Home</a> <span class="divider">/</span>
			</li>
			<li>
				<a style='cursor:default;text-decoration:none;'>�Ծ����</a>
			</li>
		</ul>
	</div>
	<div class="row-fluid sortable">
		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2><i class="icon-globe"></i> �ѷ����Ծ�</h2>
				<div class="box-icon">
					<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
					<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
					<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
				</div>
			</div>
			<div class="box-content">
			<table id="ungeneratePaper" class="table table-striped table-bordered bootstrap-datatable">
			  <thead>
				  <tr>
					  <th>�Ծ�����</th>
					  <th>��Ŀ����</th>
					  <th>����ʱ��</th>
					  <th>������</th>
					  <th>����ʱ��</th>
					  <th>������</th>
					  <th>��������</th>
					  <th>������</th>
					  <th>����</th>
				  </tr>
			  </thead>
			  <tbody>
			  <%
			  	for(int i=0;i<size;i++){
			  		PaperBean pb = (PaperBean)(allPaper.get(i));
			  		String examPaperId = pb.getExamPaperId();
			  		String examPaperName = pb.getExamPaperName();
			  		int questionNum = pb.getQuestionNum();
//			  		String inputUserId = pb.getInputUserId();
			  		String inputUserName = pb.getInputUserName();
			  		String inputTime = pb.getInputTime();
			  		String updateTime = pb.getUpdateTime();
//			  		String updateUser = pb.getUpdateUser();
			  		String updateUserName = pb.getUpdateUserName();
			  		String updateContent = pb.getUpdateContent();
			  		String relativeUser = pb.getRelativeUser();
			  		String relativeUserName = pb.getRelativeUserName();
			  %>
				<tr id="<%=examPaperId%>" class="cursor:pointer">
					<td><%=examPaperName%></td>
					<td><%=questionNum %></td>
					<td><%=inputTime%></td>
					<td><%=inputUserName%></td>
					<td><%=updateTime%></td>
					<td><%=updateUserName%></td>
					<td ><%=updateContent%></td>
					<td ><%=relativeUserName%></td>
					<td class="center" style="min-width:208px;">
						<a class="btn btn-success" onclick="return as_view_paper(this,'testPaper')">
							<i class="icon-zoom-in icon-white"></i>  
							����                                            
						</a>
						<a class="btn btn-info" href="#" onclick="return as_edit_paper(this)">
							<i class="icon-edit icon-white"></i>  
							�༭                                            
						</a>
						<a class="btn btn-danger" href="#" onclick="return as_del_paper(this)">
							<i class="icon-trash icon-white"></i> 
							ɾ��
						</a>
						<a class="btn btn-warning" href="#" onclick="return as_publish_cancel_paper(this)">
							<i class="icon-map-marker icon-white"></i> 
							ȡ������
						</a>
					</td>
				</tr>
				<%}if(size==0){%>
					<tr><td colspan="9">Ŀǰû�в�ѯ���κ��ѷ������Ծ�ȥ�������Ծ�����...</td></tr>
				<%}%>
			  </tbody>
		  </table>            
			</div>
		</div>
	</div>
</div>