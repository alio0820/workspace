<%@ page language="java" import="com.action.TopicBankAction,com.bean.TopicBankBean,java.util.List" pageEncoding="gbk"%>
<%
	int queryStyle=request.getParameter("queryStyle").equals("1")?1:2;
	String[] queryItems = request.getParameter("queryItems").split(",");
	String queryItem ="";
	String table = "tc";//topic_catalog
	if(queryStyle==1){													//�˶δ�����Ż�2013-9-27 19:22:02
		String temp = request.getParameter(queryItems[0]);
		if(queryItems[0].equals("topicType"))
			queryItem =table+".type='"+temp+"' ";
		else if(queryItems[0].equals("topicRange"))
			queryItem =table+".topicRange='"+temp+"' ";
		else if(queryItems[0].equals("topicName"))
			queryItem =table+".questionName like '%"+temp+"%' ";
		else
			queryItem = " 1=1 ";
	}
	else{
		for(int i=0;i<queryItems.length;i++){
			String temp=request.getParameter(queryItems[i]);
			if(queryItems[i].equals("topicType"))
				queryItem +=table+".type='"+temp+"' and ";
			else if(queryItems[i].equals("topicRange"))
				queryItem +=table+".topicRange='"+temp+"' and ";
			else if(queryItems[i].equals("topicName"))
				queryItem +=table+".questionName like '%"+temp+"%' and ";
		}
		if(!queryItem.equals(""))
			queryItem = queryItem.substring(0,queryItem.length()-5);
		else	//�����ѡʱһ����δѡ�У����ұ����������
			queryItem = " 1=1 ";//table+".topicType="+request.getParameter("topicType");
	}
	String paperId = request.getParameter("paperId");
	if(paperId!=null&&!paperId.equals("undefined"))
		queryItem += " and "+table+".questionId not in (select questionId from exampaper_relative where exampaperId ="+paperId+") ";
	List topicBankList = TopicBankAction.getTopicWithCondition(queryItem,1);
	int size  = topicBankList.size();
%>
	<div class="box-content">
		<table class="table table-striped table-bordered bootstrap-datatable datatable">
		  <thead>
			  <tr>
				  <th>��������</th>
				  <th>��������</th>
				  <th>���⿼��</th>
				  <th>��ȷ��</th>
				  <th>�����</th>
				  <th style="min-width:45px;">������</th>
				  <th>����ʱ��</th>
				  <th>״̬</th>
				  <th >����</th>
			  </tr>
		  </thead>
		  <tbody>
		  <%
		  	for(int i=0;i<size;i++){
		  		TopicBankBean tbb = (TopicBankBean)(topicBankList.get(i));
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
				<td><%=topicTypeName%></td>
				<td><%=topicRangeName %></td>
				<td><%=accuracyRate%></td>
				<td><%=sortNo%></td>
				<td><%=inputUserName%></td>
				<td class="center"><%=inputTime%></td>
				<td class="center">
					<%if(isInUse==1){%>
					<span class="label label-success">Active</span>
					<%}else{%>
					<span class="label">Inactive</span>
					<%}%>
				</td>
				<td class="center" style="min-width:208px;">
				<%if(paperId!=null&&!paperId.equals("undefined")){%>
					<a onclick="return as_import_TopicToPaper(this)" class="btn btn-success btn-circle" title="���">
						<i class="icon-plus icon-white"></i>
					</a>
				<%}else{%>
					<a class="btn btn-success" onclick="return getTopicDetail(this)">
						<i class="icon-zoom-in icon-white"></i>  
						�鿴                                            
					</a>
					<a class="btn btn-info" href="#" onclick="return as_edit_topic(this)">
						<i class="icon-edit icon-white"></i>  
						�༭                                            
					</a>
					<a class="btn btn-danger" href="#" onclick="return as_del_topic(this)">
						<i class="icon-trash icon-white"></i> 
						ɾ��
					</a>
				<%}%>
				</td>
			</tr>
			<%}if(size==0){
			%>
			<tr><td colspan="9">��Ǹû�в�ѯ���κ����⣬������ѯ��������...</td></tr>
			<%}%>
		  </tbody>
	  </table>            
	</div>