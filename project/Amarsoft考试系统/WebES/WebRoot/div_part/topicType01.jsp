<%@ page language="java" import="java.util.List" pageEncoding="gbk"%>
<%//��ѡ�� %>
<div id="SingleChoice" class="box-content">
  <form class="form-horizontal">
	<fieldset>
	  <legend>��������������#001</legend>
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
		  </div>
	  </div>
	  <div class="control-group">
		  <label class="control-label" for="optionNum">ѡ�����</label>
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
	  <div class="control-group optionDiv">
	  	<label class="control-label">ѡ��&nbsp;A</label>
		<div class="controls">
			<textarea name='optionContent' class="option-content" placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group optionDiv">
	  	<label class="control-label">ѡ��&nbsp;B</label>
		<div class="controls">
			<textarea name='optionContent' class="option-content" placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group optionDiv">
	  	<label class="control-label">ѡ��&nbsp;C</label>
		<div class="controls">
			<textarea name='optionContent' class="option-content" placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group optionDiv">
	  	<label class="control-label">ѡ��&nbsp;D</label>
		<div class="controls">
			<textarea name='optionContent' class="option-content" placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group answerDiv">
		  <label class="control-label" for="topicAnswer">�����</label>
			<div class="controls">
			  <select id="topicAnswer" data-rel="chosen">
				<option>A</option>
				<option>B</option>
				<option>C</option>
				<option>D</option>
			  </select>
			</div>
	  </div>
	  <div class="form-actions">
		<button type="button" class="btn btn-primary" onclick="return as_save(1)">����</button>
		<button type='reset'  class="btn">ȡ��</button>
	  </div>
	</fieldset>
  </form>     
  <div class="row-fluid">
	  <div class="span12">
		<h2>Topic Preview</h2>
		<a style="text-decoration:none;cursor:pointer;" onclick="return topic_preview(1)">click here to see the preview of this topic:</a>
		<div class="tooltip-demo well">
		  <div class="" id="topicPreview">
		  	<font color="red">��1�⣺</font><span id="topicContent_pre">���ϴ�ѧ2005��7�¾���������׼������ʦ����ѧ������ũҵ��ѧ�ϲ��齨���ɡ�ԭ��У������1906�������ϵ������й���ѧ�ģ� ����</span><br>
		  	<table id="topicOption_pre" cellspacing="0" cellpadding="5" border="0" style="border-top:1px dashed rgb(201,201,201);margin:8px 0 0 8px;">
		  		<tbody>
			  		<tr><td class="small">A.</td><td>����Ů��ʦ��ѧԺ </td></tr>
			  		<tr><td>B</td><td>���ѧԺ </td></tr>
			  		<tr><td>C</td><td>����ʦ��ѧԺ</td></tr>
			  		<tr><td>D</td><td>�Ĵ�ʡ������ѧԺ</td></tr>
		  		</tbody>
		  	</table>
		  </div>
		</div>                                  
	  </div>
  </div>	 
 </div>