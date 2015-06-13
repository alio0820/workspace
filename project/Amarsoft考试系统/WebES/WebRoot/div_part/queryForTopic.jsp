<%@ page language="java" import="com.action.TopicDesignAction,java.util.List" pageEncoding="gbk"%>
<%
	List topicType = TopicDesignAction.getTopicType();
	List topicRange = TopicDesignAction.getTopicRange();
%>
<div class="page-header tabs-other" style="margin:5px 0 18px;">
  <h3>查询方式 <small>
  <span style="margin-left:15px;">
  	<input type="checkbox" id="is-ajax1" style="opacity: 0;" onclick="changeCheckbox(1)" checked>普通查询
  	<input type="checkbox" id="is-ajax2" style="opacity: 0;" onclick="changeCheckbox(2)">组合查询</span>
  	<span style="margin-left:50px;">请根据查询条件查看试题...</span>
  </small></h3>
</div>
<form class='form-horizontal'>
<fieldset>
	<div class="queryUnit">
		<label class="control-label" for="topicType">
			<i class="icon icon-orange icon-star-on" style="margin-top:-1px;" data="topicType"></i> 试题类型
		</label>
		<div class="controls">
		  <select id="topicType" data-rel="chosen">
		  <%for(int i=0;i<topicType.size();i++){ %>
			<option value='<%=((String[])topicType.get(i))[0]%>'><%=((String[])topicType.get(i))[1]%></option>
		  <%}%>
		  </select>
		</div>
	</div>
	<div class="queryUnit">
		<label class="control-label" for="topicRange" style="margin-top:-3px;">
			<i class="icon icon-orange icon-star-on tabs-hide" style="margin-top:-1px;" data="topicRange"></i>  试题考点
		</label>
		<div class="controls">
		  <select data-placeholder="公共基础" id="topicRange" data-rel="chosen">
		<%	boolean flag_topic = false;
			int size_topic = topicRange.size();
			for(int i=0;i<size_topic;i++){
				String topicRangeId = ((String[])topicRange.get(i))[0];
				String topicRangeName = ((String[])topicRange.get(i))[1];
				String parentId = ((String[])topicRange.get(i))[2];
				if(topicRangeId.equals(parentId)){
					if(flag_topic) out.println("</optgroup>");
					else flag_topic = true;
					out.println("<optgroup label='"+topicRangeName+"'>");
				}
				else{
					out.println("<option value='"+topicRangeId+"'>"+topicRangeName+"</option>");
					if(i==size_topic-1&&flag_topic) out.println("</optgroup>");
				}
			}
		%>
		  </select>
		</div>
	</div>
	<div id="addTopic">
		<label class="control-label" style="width:150px;">
			<a onclick="return addTopicForPaper()" class="btn btn-success">
				<i class="icon-zoom-in icon-white"></i>
				录入                                            
			</a>
		</label>
	</div>
	<div class="queryUnit tabs-other" style="margin-top:10px;">
		<label class="control-label" for="topicType">
			<i class="icon icon-orange icon-star-on tabs-hide" style="margin-top:-1px;" data="topicName"></i> 试题名称
		</label>
		<div class="controls">
		 	<input type="text" value="" id="topicName" class="focused">
		</div>
	</div>
	<div class="tabs-other" style="margin-top:3px;float:left;">
		<label class="control-label" style="width:150px;">
			<a onclick="return queryForTopic()" class="btn btn-success">
				<i class="icon-zoom-in icon-white"></i>  
				查询                                            
			</a>
		</label>
	</div>
</fieldset>
</form>