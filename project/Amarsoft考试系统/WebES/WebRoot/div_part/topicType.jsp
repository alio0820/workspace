<%@ page language="java" import="com.action.TopicDesignAction,java.util.List" pageEncoding="gbk"%>
<%
	String type = request.getParameter("type");
	if(type==null||type.equals("")||type.equals("SingleChoice")){
%>
<%//��ѡ�� %>
<div id="SingleChoice" class="box-content">
  <form class="form-horizontal">
	<fieldset>
	  <legend>����������#006</legend>
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
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;A</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;B</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;C</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;D</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
		  <label class="control-label" for="topicAnswer">�����</label>
			<div class="controls">
			  <select id="topicAnswer" data-rel="chosen">
				<option>A</option>
				<option>B</option>
				<option>C</option>
				<option>D</option>
				<option>���޴�</option>
			  </select>
			</div>
	  </div>
	  <div class="form-actions">
		<button type="button" class="btn btn-primary" onclick="return as_save()">����</button>
		<button type='reset'  class="btn">ȡ��</button>
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
<%}else if(type.equals("MultipleChoice")){%>
<%//��ѡ�� %>
<div id="MultipleChoice" class="box-content">
  <form class="form-horizontal">
	<fieldset>
	  <legend>����������#007</legend>
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
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;A</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;B</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;C</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;D</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
		  <label class="control-label" for="topicAnswer">�����</label>
			<div class="controls">
			  <select id="topicAnswer" data-rel="chosen">
				<option>A</option>
				<option>B</option>
				<option>C</option>
				<option>D</option>
				<option>���޴�</option>
			  </select>
			</div>
	  </div>
	  <div class="form-actions">
		<button type="button" class="btn btn-primary" onclick="return as_save()">����</button>
		<button type='reset'  class="btn">ȡ��</button>
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
<%}else if(type.equals("Judge")){%>
<%//�ж���%>
<div id="Judge" class="box-content">
  <form class="form-horizontal">
	<fieldset>
	  <legend>����������#008</legend>
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
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;A</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;B</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;C</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;D</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
		  <label class="control-label" for="topicAnswer">�����</label>
			<div class="controls">
			  <select id="topicAnswer" data-rel="chosen">
				<option>A</option>
				<option>B</option>
				<option>C</option>
				<option>D</option>
				<option>���޴�</option>
			  </select>
			</div>
	  </div>
	  <div class="form-actions">
		<button type="button" class="btn btn-primary" onclick="return as_save()">����</button>
		<button type='reset'  class="btn">ȡ��</button>
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
<%}else if(type.equals("Blank")){%>
<%//����� %>
<div id="Blank" class="box-content">
  <form class="form-horizontal">
	<fieldset>
	  <legend>����������#009</legend>
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
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;A</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;B</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;C</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;D</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
		  <label class="control-label" for="topicAnswer">�����</label>
			<div class="controls">
			  <select id="topicAnswer" data-rel="chosen">
				<option>A</option>
				<option>B</option>
				<option>C</option>
				<option>D</option>
				<option>���޴�</option>
			  </select>
			</div>
	  </div>
	  <div class="form-actions">
		<button type="button" class="btn btn-primary" onclick="return as_save()">����</button>
		<button type='reset'  class="btn">ȡ��</button>
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
<%}else{%>
<%//������ %>
<div id="Subjective" class="box-content">
  <form class="form-horizontal">
	<fieldset>
	  <legend>����������#010</legend>
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
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;A</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;B</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;C</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
	  	<label class="control-label">ѡ��&nbsp;D</label>
		<div class="controls">
			<textarea name='optionContent' style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
		</div>
	  </div>
	  <div class="control-group">
		  <label class="control-label" for="topicAnswer">�����</label>
			<div class="controls">
			  <select id="topicAnswer" data-rel="chosen">
				<option>A</option>
				<option>B</option>
				<option>C</option>
				<option>D</option>
				<option>���޴�</option>
			  </select>
			</div>
	  </div>
	  <div class="form-actions">
		<button type="button" class="btn btn-primary" onclick="return as_save()">����</button>
		<button type='reset'  class="btn">ȡ��</button>
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
<%}%>