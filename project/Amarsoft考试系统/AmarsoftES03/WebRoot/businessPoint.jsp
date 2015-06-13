<%@ page language="java" import="com.aes.action.BusinessPointAction,com.aes.beans.TopicRangeBean,java.util.List" pageEncoding="gbk"%>
<%	List topicRangeCatalog = BusinessPointAction.getTopicRangeCatalog();
	List topicRangeLibrary = null;
	if(topicRangeCatalog!=null)
		topicRangeLibrary = BusinessPointAction.getTopicRangeLibrary(((TopicRangeBean)topicRangeCatalog.get(0)).getTopicRangeId());
%>
			<div id="content" class="span10">
			<div>
				<ul class="breadcrumb">
					<li>
						<a href="index.jsp">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a style='cursor:default;text-decoration:none;'>试题点管理</a>
					</li>
				</ul>
			</div>
			
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i> 试题考点大类</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div id='businesspoint01' class="box-content">
						<table id="rangeTable" class="table table-bordered">
						  <thead>
							  <tr>
								  <th>分类名称</th>
								  <th>注册时间</th>
								  <th>排序号</th>
								  <th>状态</th>
								  <th style='padding:3px;padding-left:8px;'>动作
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
								String inputDate = (trb.getInputTime()!=null&&trb.getInputTime().length()>=10)?trb.getInputTime().substring(0,10):"";
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
										查看                                            
									</a>
									<a class="btn btn-info" href="#" onclick="return as_edit_range(this,1)">
										<i class="icon-edit icon-white"></i>
										编辑                                            
									</a>
									<a class="btn btn-danger" href="#" onclick="return as_del_range(this,1)">
										<i class="icon-trash icon-white"></i> 
										删除
									</a>
								</td>
							</tr>
							<%} %>
						  </tbody>
					  </table>            
					</div>
				</div>
			
			</div>
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i> 试题考点小类</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div id='businesspoint02' class="box-content">
						<table id='rangeTable02' class="table  table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th>分类名称</th>
								  <th>注册时间</th>
								  <th>排序号</th>
								  <th>所属分类</th>
								  <th>状态</th>
								  <th style='padding:3px;padding-left:8px;'>动作
								  	<a class="btn btn-success btn-circle" href="#" onclick="return as_add_range(2)">
										<i class="icon-plus icon-white"></i>
									</a>
								  </th>
							  </tr>
						  </thead>   
						  <tbody>
							<%
							if(topicRangeLibrary!=null){
						    size = topicRangeLibrary.size();
							for(int i=0;i<size;i++){
								TopicRangeBean trb  = (TopicRangeBean)(topicRangeLibrary.get(i));
								String topicRangeId = trb.getTopicRangeId();
								String parentId = trb.getParentId();
								String parentName = trb.getParentName();
								String topicRangeName = trb.getTopicRangeName();
								String sortNo = trb.getSortNo();
								String inputDate = (trb.getInputTime()!=null&&trb.getInputTime().length()>=10)?trb.getInputTime().substring(0,10):"";
								int isInUse = trb.getIsInUse();
						  %>
							<tr id='<%=topicRangeId%>'>
								<td><%=topicRangeName%></td>
								<td class="center"><%=inputDate%></td>
								<td class="center"><%=sortNo%></td>
								<td id='<%=parentId%>'><%=parentName%></td>
								<td class="center">
									<%if(isInUse==1){%>
									<span class="label label-success">Active</span>
									<%}else{%>
									<span class="label">Inactive</span>
									<%}%>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#" onclick="return TopicRangeLibrary(this)">
										<i class="icon-zoom-in icon-white"></i>  
										查看                                            
									</a>
									<a class="btn btn-info" href="#" onclick="return as_edit_range(this,2)">
										<i class="icon-edit icon-white"></i>  
										编辑                                
									</a>
									<a class="btn btn-danger" href="#" onclick="return as_del_range(this,2)">
										<i class="icon-trash icon-white"></i> 
										删除
									</a>
								</td>
							</tr>
							<%}} %>
						  </tbody>
					  </table>            
					</div>
				</div>
			
			</div>
			<div class="row-fluid sortable">	
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2>Combined All</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-bordered table-striped table-condensed">
							  <thead>
								  <tr>
									  <th>Username</th>
									  <th>Date registered</th>
									  <th>Role</th>
									  <th>Status</th>                                          
								  </tr>
							  </thead>   
							  <tbody>
								<tr>
									<td>Muhammad Usman</td>
									<td class="center">2012/01/01</td>
									<td class="center">Member</td>
									<td class="center">
										<span class="label label-success">Active</span>
									</td>                                       
								</tr>
								<tr>
									<td>White Horse</td>
									<td class="center">2012/02/01</td>
									<td class="center">Staff</td>
									<td class="center">
										<span class="label label-important">Banned</span>
									</td>                                       
								</tr>
								<tr>
									<td>Sheikh Heera</td>
									<td class="center">2012/02/01</td>
									<td class="center">Admin</td>
									<td class="center">
										<span class="label">Inactive</span>
									</td>                                        
								</tr>
								<tr>
									<td>Saruar</td>
									<td class="center">2012/03/01</td>
									<td class="center">Member</td>
									<td class="center">
										<span class="label label-warning">Pending</span>
									</td>                                       
								</tr>
								<tr>
									<td>Sana Amrin</td>
									<td class="center">2012/01/21</td>
									<td class="center">Staff</td>
									<td class="center">
										<span class="label label-success">Active</span>
									</td>                                        
								</tr>                                   
							  </tbody>
						 </table>
						 <div class="pagination pagination-centered">
						  <ul>
							<li><a href="#">Prev</a></li>
							<li class="active">
							  <a href="#">1</a>
							</li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">Next</a></li>
						  </ul>
						</div>     
					</div>
				</div>
			</div>
			</div>