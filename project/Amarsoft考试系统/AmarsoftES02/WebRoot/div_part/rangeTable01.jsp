<%@ page language="java" import="com.aes.action.BusinessPointAction,com.aes.beans.TopicRangeBean,java.util.List" pageEncoding="gbk"%>
<%
	List topicRangeCatalog = BusinessPointAction.getTopicRangeCatalog();
%>
<table id="rangeTable" class="table table-bordered">
  <thead>
	  <tr>
		  <th>��������</th>
		  <th>ע��ʱ��</th>
		  <th>�����</th>
		  <th>״̬</th>
		  <th style='padding:3px;padding-left:8px;'>����
		  	<a class="btn btn-success btn-circle" href="#" onclick="return as_add_range(1)">
				<i class="icon-plus icon-white"></i>
			</a>
		  </th>
	  </tr>
  </thead>
  <tbody>
  <%
  int size = topicRangeCatalog.size();
	for(int i=0;i<size;i++){
		TopicRangeBean trb  = (TopicRangeBean)(topicRangeCatalog.get(i));
		String topicRangeId = trb.getTopicRangeId();
		String parentId = trb.getParentId();
		String topicRangeName = trb.getTopicRangeName();
		String sortNo = trb.getSortNo();
		String inputDate = trb.getInputTime()!=null?trb.getInputTime().substring(0,10):"";
		int isInUse = trb.getIsInUse();
  %>
	<tr id='<%=topicRangeId%>'>
		<td><%=topicRangeName%></td>
		<td class="center"><%=inputDate%></td>
		<td class="center"><%=sortNo%></td>
		<td class="center">
			<%if(isInUse==1){%>
			<span class="label label-success">Active</span>
			<%}else{%>
			<span class="label">Inactive</span>
			<%}%>
		</td>
		<td class="center">
			<a class="btn btn-success" href="#" onclick="return TopicRangeCatalog(this)">
				<i class="icon-zoom-in icon-white"></i>  
				�鿴                                            
			</a>
			<a class="btn btn-info" href="#" onclick="return as_edit_range(this,1)">
				<i class="icon-edit icon-white"></i>
				�༭                                            
			</a>
			<a class="btn btn-danger" href="#" onclick="return as_del_range(this,1)">
				<i class="icon-trash icon-white"></i> 
				ɾ��
			</a>
		</td>
	</tr>
	<%} %>
  </tbody>
 </table>
