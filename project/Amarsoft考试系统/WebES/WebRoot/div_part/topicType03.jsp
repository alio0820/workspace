<%@ page language="java" import="com.action.TopicDesignAction,java.util.List" pageEncoding="gbk"%>
<%//����� %>
<div id="Blank" class="box-content">
  <form class="form-horizontal">
	<fieldset>
	  <legend>��������������#003</legend>
	  <div class="control-group">
		  <label class="control-label" for="topicName">�������� </label>
		  <div class="controls">
			<input type="text" class="span6 typeahead" id="topicName"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
			<p class="help-block">the name for the topic!You can search for it by name!</p>
		  </div>
	  </div>
	  <div class="control-group">
		  <label class="control-label" for="topicContent">�������� </label>
		  <div class="controls">
		  	<textarea class="autogrow" id='topicContent' style='min-height:61px;min-width:500px;'placeholder='Just write here with content'></textarea>
		  	<object id='menu_right' type="application/x-oleobject" classid="clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11"> 
				<param name="Command" value="Related Topics,menu"> 
				<param name="Item1" value="����;http://www.aspease.com">
				<param name="Item2" value="�Ѻ�;http://www.sohu.com"> 
				<param name="Item3" value="����;http://www.sina.com"> 
				<param name="Item4" value="����;http://www.163.com">
				<param name="Item5" value="����ѧԺ;http://favorites.myrice.com">
			</object>
		  </div>
	  </div>
	  <div class="control-group">
		  <label class="control-label" for="optionNum">��ո���</label>
			<div class="controls">
			  <span id="optionNum" class="uneditable-input" style="width:80px;display:inline-block;float:left;margin-right:20px;">4</span>
			  <a class="btn btn-success" href="#" onclick="return collectBlank()">
				<i class="icon-pencil icon-white"></i>  
				��д��                                            
			  </a>
			</div>
	  </div>
	  <div class="control-group optionDiv">
	  	<label class="control-label">���&nbsp;1&nbsp;��</label>
		<div class="controls">
			<textarea name='optionContent' class='option-content'placeholder='Just write here with blank answer.'></textarea>
		</div>
	  </div>
	  <div class="control-group optionDiv">
	  	<label class="control-label">���&nbsp;2&nbsp;��</label>
		<div class="controls">
			<textarea name='optionContent' class='option-content' placeholder='Just write here with blank answer.'></textarea>
		</div>
	  </div>
	  <div class="control-group optionDiv">
	  	<label class="control-label">���&nbsp;3&nbsp;��</label>
		<div class="controls">
			<textarea name='optionContent' class='option-content'placeholder='Just write here with blank answer.'></textarea>
		</div>
	  </div>
	  <div class="control-group optionDiv">
	  	<label class="control-label">���&nbsp;4&nbsp;��</label>
		<div class="controls">
			<textarea name='optionContent' class='option-content'placeholder='Just write here with blank answer.'></textarea>
		</div>
	  </div>
	  <div class="form-actions">
		<button type="button" class="btn btn-primary" onclick="return as_save(3)">����</button>
		<button type='reset'  class="btn">ȡ��</button>
	  </div>
	</fieldset>
  </form>     
  <div class="row-fluid">
	  <div class="span12">
		<h2>Topic Preview</h2>
		<a style="text-decoration:none;cursor:pointer;" onclick="return topic_preview(3)">click here to see the preview of this topic:</a>
		<div class="tooltip-demo well">
		  <div class="" id="topicPreview">
		  	<font color="red">��1�⣺</font><span id="topicContent_pre">���ϴ�ѧ2005��7�¾���������׼������ʦ����ѧ������ũҵ��ѧ�ϲ��齨���ɡ�ԭ��У������1906�������ϵ������й���ѧ�ģ� ����</span><br>
		  	<table id="topicOption_pre" cellspacing="0" cellpadding="5" border="0" style="border-top:1px dashed rgb(201,201,201);margin:8px 0 0 8px;">
		  		<tbody>
			  		<tr><td class="small">A.</td><td>����Ů��ʦ��ѧԺ </td></tr>
			  		<tr><td>B.</td><td>���ѧԺ </td></tr>
			  		<tr><td>C.</td><td>����ʦ��ѧԺ</td></tr>
			  		<tr><td>D.</td><td>�Ĵ�ʡ������ѧԺ</td></tr>
		  		</tbody>
		  	</table>
		  </div>
		</div>
	  </div>
  </div>	 
</div>