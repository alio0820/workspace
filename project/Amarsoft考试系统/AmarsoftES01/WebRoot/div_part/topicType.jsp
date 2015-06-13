<%@ include file="IncludeBegin_list.jsp"%>
<%
	String type = request.getParameter("type");
	if(type==null||type.equals("")||type.equals("SingleChoice")){
%>
<%//单选题 %>
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
					  <label class="control-label" for="typeahead">试题名称 </label>
					  <div class="controls">
						<input type="text" class="span6 typeahead" id="typeahead"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
						<p class="help-block">the name for the topic!You can search for it by name!</p>
					  </div>
				  </div>
				  <div class="control-group">
					  <label class="control-label" for="autogrow">试题内容 </label>
					  <div class="controls">
					  	<textarea class="autogrow" style='min-height:61px;min-width:500px;'placeholder='Just write here with content'></textarea>
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
						<textarea style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
					</div>
				  </div>
				  <div class="control-group">
				  	<label class="control-label">选项&nbsp;B</label>
					<div class="controls">
						<textarea style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
					</div>
				  </div>
				  <div class="control-group">
				  	<label class="control-label">选项&nbsp;C</label>
					<div class="controls">
						<textarea style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
					</div>
				  </div>
				  <div class="control-group">
				  	<label class="control-label">选项&nbsp;D</label>
					<div class="controls">
						<textarea style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
					</div>
				  </div>
				  <div class="control-group">
					  <label class="control-label" for="optionAnswer">试题答案</label>
						<div class="controls">
						  <select id="optionAnswer" data-rel="chosen">
							<option>A</option>
							<option>B</option>
							<option>C</option>
							<option>D</option>
							<option>暂无答案</option>
						  </select>
						</div>
				  </div>
				  <div class="form-actions">
					<button type="submit" class="btn btn-primary">保存</button>
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
	</div>
</div>
<%}else if(type.equals("MultipleChoice")){%>
<%//多选题 %>
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
					  <label class="control-label" for="typeahead">试题名称 </label>
					  <div class="controls">
						<input type="text" class="span6 typeahead" id="typeahead"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
						<p class="help-block">the name for the topic!You can search for it by name!</p>
					  </div>
				  </div>
				  <div class="control-group">
					  <label class="control-label" for="autogrow">试题内容 </label>
					  <div class="controls">
					  	<textarea class="autogrow" style='min-height:61px;min-width:500px;'placeholder='Just write here with content'></textarea>
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
						<textarea style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
					</div>
				  </div>
				  <div class="control-group">
				  	<label class="control-label">选项&nbsp;B</label>
					<div class="controls">
						<textarea style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
					</div>
				  </div>
				  <div class="control-group">
				  	<label class="control-label">选项&nbsp;C</label>
					<div class="controls">
						<textarea style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
					</div>
				  </div>
				  <div class="control-group">
				  	<label class="control-label">选项&nbsp;D</label>
					<div class="controls">
						<textarea style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
					</div>
				  </div>
				  <div class="control-group">
					<label class="control-label" for="optionAnswer">试题答案</label>
					<div class="controls">
					  <select id="optionAnswer" multiple data-rel="chosen">
						<option>A</option>
						<option selected>B</option>
						<option>C</option>
						<option>D</option>
						<option>暂无答案</option>
					  </select>
					</div>
				  </div>
				  <div class="form-actions">
					<button type="submit" class="btn btn-primary">保存</button>
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
	</div>
</div>
<%}else if(type.equals("Judge")){%>
<%//判断题%>
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
					  <label class="control-label" for="typeahead">试题名称 </label>
					  <div class="controls">
						<input type="text" class="span6 typeahead" id="typeahead"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
						<p class="help-block">the name for the topic!You can search for it by name!</p>
					  </div>
				  </div>
				  <div class="control-group">
					  <label class="control-label" for="autogrow">试题内容 </label>
					  <div class="controls">
					  	<textarea class="autogrow" style='min-height:61px;min-width:500px;'placeholder='Just write here with content'></textarea>
					  </div>
				  </div>
				  <div class="control-group">
					<label class="control-label" for="optionAnswer">试题答案</label>
					<div class="controls">
					  <select id="optionAnswer" data-rel="chosen">
						<option>对</option>
						<option>错</option>
						<option>暂无答案</option>
					  </select>
					</div>
				  </div>
				  <div class="form-actions">
					<button type="submit" class="btn btn-primary">保存</button>
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
	</div>
</div>
<%}else if(type.equals("Blank")){%>
<%//填空题 %>
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
					  <label class="control-label" for="typeahead">试题名称 </label>
					  <div class="controls">
						<input type="text" class="span6 typeahead" id="typeahead"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
						<p class="help-block">the name for the topic!You can search for it by name!</p>
					  </div>
				  </div>
				  <div class="control-group">
					  <label class="control-label" for="autogrow">试题内容 </label>
					  <div class="controls">
					  	<textarea class="autogrow" style='min-height:61px;min-width:500px;'placeholder='Just write here with content'></textarea>
					  </div>
				  </div>
				  <div class="control-group">
				  	<label class="control-label">填空&nbsp;1&nbsp;答案</label>
					<div class="controls">
						<textarea style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
					</div>
				  </div>
				  <div class="control-group">
				  	<label class="control-label">填空&nbsp;2&nbsp;答案</label>
					<div class="controls">
						<textarea style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
					</div>
				  </div>
				  <div class="control-group">
				  	<label class="control-label">填空&nbsp;3&nbsp;答案</label>
					<div class="controls">
						<textarea style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
					</div>
				  </div>
				  <div class="control-group">
				  	<label class="control-label">填空&nbsp;4&nbsp;答案</label>
					<div class="controls">
						<textarea style='height:32px;min-width:480px;'placeholder='Just write here with option.'></textarea>
					</div>
				  </div>
				  <div class="form-actions">
					<button type="submit" class="btn btn-primary">保存</button>
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
	</div>
</div>
<%}else{%>
<%//主观题 %>
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
					  <label class="control-label" for="typeahead">试题名称 </label>
					  <div class="controls">
						<input type="text" class="span6 typeahead" id="typeahead"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
						<p class="help-block">the name for the topic!You can search for it by name!</p>
					  </div>
				  </div>
				  <div class="control-group">
					  <label class="control-label" for="autogrow">试题内容 </label>
					  <div class="controls">
					  	<textarea class="autogrow" style='min-height:61px;min-width:500px;'placeholder='Just write here with content'></textarea>
					  </div>
				  </div>
				  <div class="control-group">
					<label class="control-label" for="optionAnswer">试题答案</label>
					<div class="controls">
					  	<textarea class="autogrow" style='min-height:61px;min-width:500px;'placeholder='Just write here with answer'></textarea>
					  </div>
				  </div>
				  <div class="form-actions">
					<button type="submit" class="btn btn-primary">保存</button>
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
	</div>
</div>
<%}%>
<%@ include file="IncludeEnd.jsp"%>
