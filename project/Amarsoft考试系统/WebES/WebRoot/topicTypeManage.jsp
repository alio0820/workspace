<%@ page language="java" import="com.action.TopicTypeAction,com.bean.TopicTypeBean,java.util.List" pageEncoding="gbk"%>
<%	List topicTypeList = TopicTypeAction.getTopicType();
%>
			<div id="content" class="span10">
			<div>
				<ul class="breadcrumb">
					<li>
						<a href="index.jsp">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a style='cursor:default;text-decoration:none;'>���͹���</a>
					</li>
				</ul>
			</div>
			
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i> ���͹���</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div id='businesspoint01' class="box-content">
						<table id="TypeTable" class="table table-bordered">
						  <thead>
							  <tr>
								  <th>��������</th>
								  <th>ע��ʱ��</th>
								  <th>�����</th>
								  <th>״̬</th>
								  <th style='padding:3px;padding-left:8px;'>����
								  	<a class="btn btn-success btn-circle" onclick="return alert('�������ˣ�')">
										<i class="icon-plus icon-white"></i>
									</a>
								  </th>
							  </tr>
						  </thead>
						  <tbody>
						  <%
						  int size = topicTypeList.size();
							for(int i=0;i<size;i++){
								TopicTypeBean ttb  = (TopicTypeBean)(topicTypeList.get(i));
								String topicTypeId = ttb.getTopicTypeId();
								String topicTypeName = ttb.getTopicTypeName();
								String sortNo = ttb.getSortNo();
								String inputDate = (ttb.getInputTime()!=null&&ttb.getInputTime().length()>=10)?ttb.getInputTime().substring(0,10):"";
								int isInUse = ttb.getIsInUse();
						  %>
							<tr id='<%=topicTypeId%>'>
								<td><%=topicTypeName%></td>
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
									<a class="btn btn-success" href="#" onclick="return TopicTypeView(this)">
										<i class="icon-zoom-in icon-white"></i>  
										�鿴                                            
									</a>
									<a class="btn btn-info" href="#" onclick="return as_edit_topicType(this)">
										<i class="icon-edit icon-white"></i>
										�༭                                            
									</a>
<%--									<a class="btn btn-danger" href="#" onclick="return as_del_topicType(this)">--%>
<%--										<i class="icon-trash icon-white"></i> --%>
<%--										ɾ��--%>
<%--									</a>--%>
								</td>
							</tr>
							<%} %>
						  </tbody>
					  </table>            
					</div>
				</div>
			</div>
			</div>