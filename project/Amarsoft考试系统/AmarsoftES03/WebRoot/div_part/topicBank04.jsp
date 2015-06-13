<%@ page language="java" import="com.aes.action.TopicBankAction,com.aes.beans.TopicBankBean,java.util.List" pageEncoding="gbk"%>
<%
	List JudgeList = TopicBankAction.getJudgeAll();
	int size4  = JudgeList.size();
%>
<div id="Judge" class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2><i class="icon-user"></i> ���-�ж���</h2>
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
					  <th>��������</th>
					  <th>���⿼��</th>
					  <th>��ȷ��</th>
					  <th>�����</th>
					  <th>������</th>
					  <th>����ʱ��</th>
					  <th>����ʱ��</th>
					  <th>״̬</th>
					  <th>����</th>
				  </tr>
			  </thead>
			  <tbody>
			  <%
			  	for(int i=0;i<size4;i++){
			  		TopicBankBean tbb = (TopicBankBean)(JudgeList.get(i));
			  		String questionId = tbb.getQuestionId();
			  		String questionName = tbb.getQuestionName();
			  		String content = tbb.getContent();
			  		String answer = tbb.getAnswer();
			  		String topicTypeId = tbb.getTopicTypeId();
			  		String topicTypeName = tbb.getTopicTypeName();
			  		String topicRangeId = tbb.getTopicRangeId();
			  		String topicRangeName = tbb.getTopicRangeName();
			  		int optionNum = tbb.getOptionNum();
			  		String accuracyRate = tbb.getAccuracyRate();
			  		String sortNo = tbb.getSortNo();
			  		String inputUserId = tbb.getInputUserId();
			  		String inputUserName = tbb.getInputUserName();
			  		String inputTime = tbb.getInputTime();
			  		String updateTime = tbb.getUpdateTime();
			  		int isInUse = tbb.getIsInUse();
			  %>
				<tr id="<%=questionId%>">
					<td><%=questionName%></td>
					<td><%=topicRangeName %></td>
					<td><%=accuracyRate%></td>
					<td><%=sortNo%></td>
					<td><%=inputUserName%></td>
					<td class="center"><%=inputTime%></td>
					<td class="center"><%=updateTime%></td>
					<td class="center">
						<%if(isInUse==1){%>
						<span class="label label-success">Active</span>
						<%}else{%>
						<span class="label">Inactive</span>
						<%}%>
					</td>
					<td class="center">
						<a class="btn btn-success" href="#">
							<i class="icon-zoom-in icon-white"></i>  
							�鿴                                            
						</a>
						<a class="btn btn-info" href="#">
							<i class="icon-edit icon-white"></i>  
							�༭                                            
						</a>
						<a class="btn btn-danger" href="#">
							<i class="icon-trash icon-white"></i> 
							ɾ��
						</a>
					</td>
				</tr>
				<%}%>
			  </tbody>
		  </table>            
		</div>
	</div>
</div>