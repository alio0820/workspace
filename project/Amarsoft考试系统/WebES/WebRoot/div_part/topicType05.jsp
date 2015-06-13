<%@ page language="java" import="com.action.TopicDesignAction,java.util.List" pageEncoding="gbk"%>
<%//主观题 %>
<div id="Subjective" class="box-content">
  <form class="form-horizontal">
	<fieldset>
	  <legend>试题类型终身编号#005</legend>
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
		  <label class="control-label" for="topicAnswer">试题答案</label>
		  <div class="controls">
		  	<textarea class="autogrow" id='topicAnswer' style='min-height:61px;min-width:500px;'placeholder='Just write here with answer'></textarea>
		  </div>
	  </div>
	  <div class="form-actions">
		<button type="button" class="btn btn-primary" onclick="return as_save(5)">保存</button>
		<button type='reset'  class="btn">取消</button>
	  </div>
	</fieldset>
  </form>     
  <div class="row-fluid">
	  <div class="span12">
		<h2>Topic Preview</h2>
		<a style="text-decoration:none;cursor:pointer;" onclick="return topic_preview(5)">click here to see the preview of this topic:</a>
		<div class="tooltip-demo well">
		  <div class="" id="topicPreview">
		  	<font color="red">第1题：</font><span id="topicContent_pre">西南大学2005年7月经教育部批准由西南师范大学、西南农业大学合并组建而成。原两校发轫于1906年在西南地区开中国新学的（ ）。</span><br>
		  </div>
		</div>
	  </div>
  </div>	 
</div>