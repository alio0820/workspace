<%@ page language="java" import="com.aes.action.TopicDesignAction,java.util.List" pageEncoding="gbk"%>
<%
	List topicType = TopicDesignAction.getTopicType();
	List topicRange = TopicDesignAction.getTopicRange();
%>
			<div id="content" class="span10">
			<div>
				<ul class="breadcrumb">
					<li>
						<a href="index.jsp">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a style='cursor:default;text-decoration:none;'>题目设计</a>
					</li>
				</ul>
			</div>
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-globe"></i> 选择试题类型</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form class='form-horizontal'>
						<fieldset>
							<div style='display:inline-block;'>
								<label class="control-label" for="topicType">试题类型</label>
								<div class="controls">
								  <select id="topicType" data-rel="chosen">
								  <%for(int i=0;i<topicType.size();i++){ %>
									<option value='<%=((String[])topicType.get(i))[0]%>'><%=((String[])topicType.get(i))[1]%></option>
								  <%}%>
								  </select>
								</div>
							</div>
							<div style='display:inline-block;'>
								<label class="control-label" for="topicRange">试题考点</label>
								<div class="controls">
								  <select data-placeholder="公共基础" id="topicRange" data-rel="chosen">
								<%	boolean flag = false;
									int size = topicRange.size();
									for(int i=0;i<size;i++){
										String topicRangeId = ((String[])topicRange.get(i))[0];
										String topicRangeName = ((String[])topicRange.get(i))[1];
										String parentId = ((String[])topicRange.get(i))[2];
										if(topicRangeId.equals(parentId)){
											if(flag) out.println("</optgroup>");
											else flag = true;
											out.println("<optgroup label='"+topicRangeName+"'>");
										}
										else{
											out.println("<option value='"+topicRangeId+"'>"+topicRangeName+"</option>");
											if(i==size-1&&flag) out.println("</optgroup>");
										}
									}
								%>
								  </select>
								</div>
							</div>
						</fieldset>
						</form>
					</div>
				</div>
			</div>
			
			<div class="row-fluid sortable">
				<div id="topicDesignMain" class="box span9">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-font"></i> 试题设计</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<%
						if(topicType!=null){
							String topicTypeDefault = ((String[])topicType.get(0))[0];
							if(topicTypeDefault.equals("SingleChoice")){
					%>
					<%@ include file="div_part/topicType01.jsp" %>
					<%}else if(topicTypeDefault.equals("MultipleChoice")){%>
					<%@ include file="div_part/topicType02.jsp" %>
					<%}else if(topicTypeDefault.equals("Blank")){%>
					<%@ include file="div_part/topicType03.jsp" %>
					<%}else if(topicTypeDefault.equals("Judge")){%>
					<%@ include file="div_part/topicType04.jsp" %>
					<%}else {%>
					<%@ include file="div_part/topicType05.jsp" %>
					<%}}%>
				</div>
				
				<div class="box span3">
					<div class="box-header well" data-original-title>
						<h3>Unordered List</h3>
						<div class="box-icon">
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<ul>
						  <li>Lorem ipsum dolor sit amet</li>
						  <li>Consectetur adipiscing elit</li>
						  <li>Integer molestie lorem at massa</li>
						  <li>Facilisis in pretium nisl aliquet</li>
						  <li>Nulla volutpat aliquam velit
							<ul>
							  <li>Phasellus iaculis neque</li>
							  <li>Purus sodales ultricies</li>
							  <li>Vestibulum laoreet porttitor sem</li>
							  <li>Ac tristique libero volutpat at</li>
							</ul>
						  </li>
						  <li>Faucibus porta lacus fringilla vel</li>
						  <li>Aenean sit amet erat nunc</li>
						  <li>Eget porttitor lorem</li>
						</ul>            
					</div>
				</div><!--/span-->
				
				<div class="box span3">
					<div class="box-header well" data-original-title>
						<h3>Ordered List</h3>
						<div class="box-icon">
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<ol>
						  <li>Lorem ipsum dolor sit amet</li>
						  <li>Consectetur adipiscing elit</li>
						  <li>Integer molestie lorem at massa</li>
						  <li>Facilisis in pretium nisl aliquet</li>
						  <li>Nulla volutpat aliquam velit</li>
						  <li>Faucibus porta lacus fringilla vel</li>
						  <li>Aenean sit amet erat nunc</li>
						  <li>Eget porttitor lorem</li>
						</ol>           
					</div>
				</div><!--/span-->
				
				<div class="box span3">
					<div class="box-header well" data-original-title>
						<h3>Description List</h3>
						<div class="box-icon">
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<dl>
						  <dt>Description lists</dt>
						  <dd>A description list is perfect for defining terms.</dd>
						  <dt>Euismod</dt>
						  <dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
						  <dd>Donec id elit non mi porta gravida at eget metus.</dd>
						  <dt>Malesuada porta</dt>
						  <dd>Etiam porta sem malesuada magna mollis euismod.</dd>
						</dl>            
					</div>
				</div>
			</div>
			</div>