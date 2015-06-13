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
				<div class="box span9">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-font"></i> 试题设计</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						  <form class="form-horizontal">
							<fieldset>
							  <legend>试题终身编号#006</legend>
							  <div class="control-group">
								  <label class="control-label" for="topicName">试题名称 </label>
								  <div class="controls">
									<input type="text" class="span6 typeahead" id="topicName"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
									<p class="help-block">the name for the topic!You can search for it by name!</p>
								  </div>
							  </div>
							  <div class="control-group">
								  <label class="control-label" for="topicContent">试题内容 </label>
								  <div class="controls">
								  	<textarea class="autogrow" id='topicContent' style='min-height:61px;min-width:500px;'placeholder='Just write here with content'></textarea>
								  </div>
							  </div>
							  <div class="control-group">
								  <label class="control-label" for="optionNum">选项个数</label>
									<div class="controls">
									  <select id="optionNum" data-rel="chosen">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option selected>4</option>
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
										<option>9</option>
										<option>10</option>
									  </select>
									</div>
							  </div>
							  <div class="control-group">
							  	<label class="control-label">选项&nbsp;A</label>
								<div class="controls">
									<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
								</div>
							  </div>
							  <div class="control-group">
							  	<label class="control-label">选项&nbsp;B</label>
								<div class="controls">
									<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
								</div>
							  </div>
							  <div class="control-group">
							  	<label class="control-label">选项&nbsp;C</label>
								<div class="controls">
									<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
								</div>
							  </div>
							  <div class="control-group">
							  	<label class="control-label">选项&nbsp;D</label>
								<div class="controls">
									<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
								</div>
							  </div>
							  <div class="control-group">
								  <label class="control-label" for="topicAnswer">试题答案</label>
									<div class="controls">
									  <select id="topicAnswer" data-rel="chosen">
										<option>A</option>
										<option>B</option>
										<option>C</option>
										<option>D</option>
										<option>暂无答案</option>
									  </select>
									</div>
							  </div>
							  <div class="form-actions">
								<button type="button" class="btn btn-primary" onclick="return as_save()">保存</button>
								<button type='reset'  class="btn">取消</button>
							  </div>
							</fieldset>
						  </form>     
						  <div class="row-fluid">
							  <div class="span12">
								<h2>Topic Preview</h2>
								<p>Hover over the links below to see tips:</p>
								<div class="tooltip-demo well">
								  <p class="muted" style="margin-bottom: 0;">Tight pants next level keffiyeh <a href="#" data-rel="tooltip" data-original-title="first tooltip">you probably</a> haven't heard of them. Photo booth beard raw denim letterpress vegan messenger bag stumptown. Farm-to-table seitan, mcsweeney's fixie sustainable quinoa 8-bit american appadata-rel <a href="#" data-rel="tooltip" data-original-title="Another tooltip">have a</a> terry richardson vinyl chambray. Beard stumptown, cardigans banh mi lomo thundercats. Tofu biodiesel williamsburg marfa, four loko mcsweeney's cleanse vegan chambray. A <a href="#" data-rel="tooltip" data-original-title="Another one here too">really ironic</a> artisan whatever keytar, scenester farm-to-table banksy Austin <a href="#" data-rel="tooltip" data-original-title="The last tip!">twitter handle</a> freegan cred raw denim single-origin coffee viral.
								  </p>
								</div>                                  
							  </div>
						  </div>	 
					  </div>
				</div><!--/span-->
				
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