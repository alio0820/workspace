var contentplug = function(){
	
}();
var topicRangeBig =null;
var topicRangeParentId = null;
var topicRangeParentName =null;
var charSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
//----------------------------------------------businessPoint----------------------------------------------------
/**
 * 试题考点大类(查看)
 */
function TopicRangeCatalog(obj){
	var tr = $(obj).parent().parent();
	var children = $(tr).children();
	var topicRangeId = $(tr).attr('id');
	var topicRangeName = $(children).eq(0).html();
	var inputdate = $(children).eq(1).html();
	var sortNo = $(children).eq(2).html();
	var status = $(children).eq(3).html();
	var width = (document.body.clientWidth-700)/2;
	var height = ($(window).height()-160)/2+$(window).scrollTop();
	var div_lock = '<div id="div_lock" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; overflow: hidden; z-index: 1800;"></div>';
	var pop_info = '<div id="pop_info" style="left: '+width+'px; top: '+height+'px; display: none; position: absolute; width: auto; z-index: 1802;">'+
			   '<table class="table table-bordered" style="width:700px;height:80px;background:white;margin-bottom:0px;"><thead>' +
			   '<tr><th>分类ID</th><th>分类名称</th><th>注册时间</th><th>排序号</th><th>状态</th><th>动作</th></tr></thead>' +
			   '<tbody><tr><td>'+topicRangeId+'</td><td>'+topicRangeName+'</td><td>'+inputdate+'</td><td>'+sortNo+'</td><td>'+status+'</td>' +
			   '<td class="center"><a class="btn btn-success" href="javascript:void(0)"onclick="removePopWindow()"><i class="icon-zoom-in icon-white"></i>返回 </a></td></tr></tbody></table></div>';
	$(document.body).append(div_lock);
	$(document.body).append(pop_info);
	$('#pop_info').fadeIn(500);
	return false;
}
/**
 * 试题考点小类(查看)
 */
function TopicRangeLibrary(obj){
	var tr = $(obj).parent().parent();
	var children = $(tr).children();
	var topicRangeId = $(tr).attr('id');
	var topicRangeName = $(children).eq(0).html();
	var inputdate = $(children).eq(1).html();
	var sortNo = $(children).eq(2).html();
	var parentId = $(children).eq(3).attr('id');
	var parentName = $(children).eq(3).html();
	var status =$(children).eq(4).html();
	var width = (document.body.clientWidth-850)/2;
	var height = ($(window).height()-160)/2+$(window).scrollTop();
	var div_lock = '<div id="div_lock" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; overflow: hidden; z-index: 1800;"></div>';
	var pop_info = '<div id="pop_info" style="left: '+width+'px; top: '+height+'px; display: none; position: absolute; width: auto; z-index: 1802;">'+
			   '<table class="table table-bordered" style="width:900px;height:80px;background:white;margin-bottom:0px;"><thead>' +
			   '<tr><th>分类ID</th><th>分类名称</th><th>注册时间</th><th>排序号</th><th>所属分类ID</th><th>所属分类</th><th>状态</th><th>动作</th></tr></thead>' +
			   '<tbody><tr><td>'+topicRangeId+'</td><td>'+topicRangeName+'</td><td>'+inputdate+'</td><td>'+sortNo+'</td><td>'+parentId+'</td><td>'+parentName+'</td><td>'+status+'</td>' +
			   '<td class="center"><a class="btn btn-success" href="javascript:void(0)"onclick="removePopWindow()"><i class="icon-zoom-in icon-white"></i>返回 </a></td></tr></tbody></table></div>';
	$(document.body).append(div_lock);
	$(document.body).append(pop_info);
	$('#pop_info').fadeIn(500);
	return false;
}
/**
 * 新增考点大类
 */
function as_add_range(num){
	var date = contentApp.getDate();
	var table = document.getElementById(num==1?'rangeTable':'rangeTable02');
	var new_action = '<a class="btn btn-success" href="#" onclick="return as_add_save_range(this,'+num+')"><i class="icon-zoom-in icon-white"></i> 保存 </a>'+
	' <a class="btn btn-info" href="#" onclick="return as_add_cancel_range(this,'+num+')"><i class="icon-edit icon-white"></i> 取消 </a>';
	if(num==1){
		var tr = $(table).find('tr').last();
		$(tr).after($(tr).clone());
		tr = $(table).find('tr').last();
		$(tr).removeClass('row_selected');
		var children = $(tr).children();
		var status_td = $(children).eq(num==1?3:4);
		var status = '<input data-no-uniform="true" checked type="checkbox" class="iphone-toggle">';
		var action = $(children).last().html();
		new_action = new_action+'<div style="display:none">'+action+'</div>';
		$(children).eq(0).html('<input type="text" class="edit" value=""/>');
		$(children).eq(2).html('<input type="text" class="edit" value=""/>');
		$(status_td).html(status);
		$(children).last().html(new_action);
	}
	if(num==2){
		var action = '<a class="btn btn-success" href="#" onclick="return TopicRangeLibrary(this)"><i class="icon-zoom-in icon-white"></i> 查看 </a> '+  
					 '<a class="btn btn-info" href="#" onclick="return as_edit_range(this,2)"><i class="icon-edit icon-white"></i> 编辑 </a> '+					
					 '<a class="btn btn-danger" href="#" onclick="return as_del_range(this,2)"><i class="icon-trash icon-white"></i> 删除  </a>';				                                            
		new_action = new_action+'<div style="display:none">'+action+'</div>';		
	    $(table).dataTable().fnAddData([
	        '<input type="text" class="edit" value=""/>',
	        date,
	        '<input type="text" class="edit" value=""/>',
	        topicRangeParentName,
	        '<input data-no-uniform="true" checked type="checkbox" class="iphone-toggle">',
	        new_action
	    ]);
	    var tr = $(table).find('tr').last();
	    $(tr).find('td').eq(3).attr('id',topicRangeParentId);
	}
	$('.iphone-toggle').iphoneStyle();
	return false;
}

/**
 * 新增_保存-考点大类
 */
function as_add_save_range(obj,num){
	var tr = $(obj).parent().parent();
	var children = $(tr).children();
	var topicRangeName = $(children).eq(0).find('input').val();
	var sortNo = $(children).eq(2).find('input').val();
	var parentId = "";
	if(num==2)
		parentId = topicRangeParentId;
	var status_td = $(children).eq(num==1?3:4);
	var width = $(status_td).find('label').filter('.iPhoneCheckLabelOn').width();
	var isInUse = width==54?1:0;
	BusinessPointAction.addTopicRange(topicRangeName,parentId,sortNo,isInUse,num,function(data){
		if(data=="success"){
			$('#save_success').triggerHandler('click');
			updateView(num);
			return false;
		}
		else if(data=="error"){
			$('#save_error').triggerHandler('click');
			return false;
		}
//		$(children).eq(0).html(topicRangeName);
//		$(children).eq(2).html(sortNo);
//		$(children).last().html($(children).last().find('div').html());
//		if(isInUse==1) 
//			$(status_td).html('<span class="label label-success">Active</span>');
//		else 
//			$(status_td).html('<span class="label">Inactive</span>');
	});
	return false;
}
/**
 * 新增_取消-考点大类
 */
function as_add_cancel_range(obj,num){
	var tr = $(obj).parent().parent();
	if(num==1){
		tr.remove();
	}
	else{
		var oTable = $('#rangeTable02').dataTable();
		oTable.fnDeleteRow( $(tr)[0] );
	}
	return false;
}
/**
 * 编辑考点大类
 */
function as_edit_range(obj,num){
	var tr = $(obj).parent().parent();
	var children = $(tr).children();
	var topicRangeId = $(tr).attr('id');
	var topicRangeName = $(children).eq(0).html();
	var sortNo = $(children).eq(2).html();
	var status_td = $(children).eq(num==1?3:4);
	var status = $(status_td).find('span').html();
	var change = "";
	if(status=='Active')
		change = '<input data-no-uniform="true" checked type="checkbox" class="iphone-toggle">';
	else
		change = '<input data-no-uniform="true" type="checkbox" class="iphone-toggle">';
	status = '<div style="display:none">'+$(status_td).html()+'</div>'+change;
	$(status_td).html(status);
	$('.iphone-toggle').iphoneStyle();
	var action = $(children).last().html();
	var new_action = '<a class="btn btn-success" href="#" onclick="return as_save_range(this,'+num+')"><i class="icon-zoom-in icon-white"></i> 保存 </a>'+
	' <a class="btn btn-info" href="#" onclick="return as_cancel_range(this,'+num+')"><i class="icon-edit icon-white"></i> 取消 </a>';
	new_action = new_action+'<div style="display:none">'+action+'</div>';
	$(children).eq(0).html('<input type="text" class="edit" name="'+topicRangeName+'" value="'+topicRangeName+'"/>');
	$(children).eq(2).html('<input type="text" class="edit" name="'+sortNo+'" value="'+sortNo+'"/>');
	$(children).last().html(new_action);
	return false;
}
/**
 * 取消编辑
 */
function as_cancel_range(obj,num){
	var tr = $(obj).parent().parent();
	var children = $(tr).children();
	var status_td = $(children).eq(num==1?3:4);
	var status = $(status_td).find('div').eq(0).html();
	$(children).eq(0).html($(children).eq(0).find('input').attr('name'));
	$(children).eq(2).html($(children).eq(2).find('input').attr('name'));
	$(children).last().html($(children).last().find('div').html());
	$(status_td).html(status);
	return false;
}
/**
 * 保存考点分类信息
 */
function as_save_range(obj,num){
	var tr = $(obj).parent().parent();
	var children = $(tr).children();
	var topicRangeId = $(tr).attr('id');
	var topicRangeName = $(children).eq(0).find('input').val();
	var sortNo = $(children).eq(2).find('input').val();
	var status_td = $(children).eq(num==1?3:4);
	var width = $(status_td).find('label').filter('.iPhoneCheckLabelOn').width();
	var isInUse = width==54?1:0;
	BusinessPointAction.saveTopicRange(topicRangeId,topicRangeName,sortNo,isInUse,function(data){
		if(data=="success")
			$('#save_success').triggerHandler('click');
		else if(data=="error"){
			$('#save_error').triggerHandler('click');
			return false;
		}
		$(children).eq(0).html(topicRangeName);
		$(children).eq(2).html(sortNo);
		$(children).last().html($(children).last().find('div').html());
		if(isInUse==1) 
			$(status_td).html('<span class="label label-success">Active</span>');
		else 
			$(status_td).html('<span class="label">Inactive</span>');
	});
	return false;
}
/**
 * 删除考点大类
 */
function as_del_range(obj,num){
	var tr = obj.parentNode.parentNode;
	var topicRangeId = tr.id;
	if(num==1&&!confirm("您正在删除考点大类，其子类型会一同被删除，确定删除吗？"))
		return false;
	else if(num==2&&!confirm("您确定删除吗？"))
		return false;
	BusinessPointAction.delTopicRange(topicRangeId,function(data){
		if(data=="success"){
			$('#del_success').triggerHandler('click');
			if(num==1){
				$(tr).remove();
				if(topicRangeParentId==topicRangeId)
					updateView(num);
			}
			else{
				var oTable = $('#rangeTable02').dataTable();
				oTable.fnDeleteRow( $(tr)[0] );
			}
		}
		else if(data=="error")
			$('#action_error').triggerHandler('click');
	});
	return false;
}

$(window).keydown(function(event){
	if(event.keyCode==27){
		removePopWindow();
	}
});
function updateView(param){
	if(param==1){
		$('#businesspoint01').load('div_part/rangeTable01.jsp #rangeTable',{/*'id':id,'listNo':listNum*/},function(){
//			topicRangeParentId = $('#rangeTable').find('tr').eq(1).attr('id');
//			//更新子分类
//			$('#businesspoint02').load('div_part/rangeTable02.jsp #rangeTable02',{'topicRangeId':topicRangeParentId},function(){
//				$('#rangeTable02 tr').click( function(){
//			        $(this).toggleClass('row_selected');
//			    });
//			});
			$('#rangeTable tbody tr').click( function(event){
				var td = event.target.localName;
				if(td!='td') return;
				$(this).siblings().removeClass('row_selected');
		        $(this).toggleClass('row_selected');
		        topicRangeParentId = $(this).attr('id');
		        $('#businesspoint02').load('div_part/rangeTable02.jsp #rangeTable02',{'topicRangeId':topicRangeParentId},function(){
					$('#rangeTable02 tr').click( function(event){
						var td = event.target.localName;
						if(td!='td') return;
						$(this).siblings().removeClass('row_selected');
				        $(this).toggleClass('row_selected');
				    });
				});
		    });
		});
	}
	else{
		$('#businesspoint02').load('div_part/rangeTable02.jsp #rangeTable02',{'topicRangeId':topicRangeParentId},function(){
			$('#rangeTable02 tbody tr').click( function(event){
				var td = event.target.localName;
				if(td!='td') return;
				$(this).siblings().removeClass('row_selected');
		        $(this).toggleClass('row_selected');
		    });
			$('.datatable').dataTable({
				"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
				"sPaginationType": "bootstrap",
				"aaSorting" : [ [2, 'asc' ], [ 0, 'asc' ] ],
				"oLanguage": {/*汉化*/
					"sLengthMenu": "每页显示 _MENU_ 行",
					"sZeroRecords": "没有记录",
					"sInfo": "当前显示 _START_ ～ _END_ 条，共 _TOTAL_ 条记录",
					"sInfoEmpty": "当前显示 0 ～ 0 条，共 0 条记录",
					"sInfoFiltered": "(从 _MAX_ 条记录中搜索)"
				}
			});
		});
	}
}
/**
 * 关闭弹出窗口(view)
 */
function removePopWindow(){
	if($('#pop_info').length!=0){
		$('#pop_info').fadeOut(2000);
		$('#pop_info').remove();
		$('#div_lock').remove();
	}
}
//---------------------------------------------topicDesign-----------------------------------------------------
function toChar(i){
	return charSet.charAt(i);
}
function getOption(i){
	var index = toChar(i);
	var option = '<div class="control-group optionDiv">'+
					'<label class="control-label">选项&nbsp;'+index+'</label>'+
					'<div class="controls">'+
						'<textarea name="optionContent" class="option-content" placeholder="Just write here with option."></textarea>'+
				 '</div></div>';
	return option;
}
function getBlankOption(i){
	var option = '<div class="control-group optionDiv">'+
					'<label class="control-label">填空&nbsp;'+i+'&nbsp;答案</label>'+
					'<div class="controls">'+
						'<textarea name="optionContent" class="option-content" placeholder="Just write here with blank answer."></textarea>'+
				 '</div></div>';
	return option;
}
/**
 * 切换试题类型面板
 */
function switchTopicType(){
	var mainBoard = document.getElementById('topicDesignMain');
	var content = $(mainBoard).find('.box-content');
	var timestamp = new Date().getTime();
	var div = '<div style="display:none" id="'+timestamp+'"></div>';
	$(mainBoard).append(div);
	var topicType = document.getElementById("topicType").value;
	var file = 'div_part/';
	if(topicType=='SingleChoice'){
		file+='topicType01.jsp';
	}else if(topicType=='MultipleChoice'){
		file+='topicType02.jsp';
	}else if(topicType=='Blank'){
		file+='topicType03.jsp';
	}else if(topicType=='Judge'){
		file+='topicType04.jsp';
	}else{
		file+='topicType05.jsp';
	}
	$('div#'+timestamp).load(file,{},function(){
		var div = $('div#'+timestamp+'>div');
		$(content).fadeOut(500);
		$(div).fadeIn(500);
		$(div).unwrap();
		$(content).remove();
		$('[data-rel="chosen"],[rel="chosen"]').chosen();
		if(file=="div_part/topicType01.jsp"||file=="div_part/topicType02.jsp"){
			var select = $('#optionNum');
			var div = $(select).next();
			var li = $(div).find('li');
			$(li).bind('click',createOption);
		}
	});
}
/**
 * 保存试题
 */
function as_save(type){
	var topicType = document.getElementById("topicType").value;
	var topicRange = document.getElementById("topicRange").value;
	var topicName = document.getElementById("topicName").value;
	var topicContent = document.getElementById("topicContent").value;
	if(type!=5){
		var optionNum = "0";
		var optionContent = "";
		var option = new Array();
		var options = "";
		var topicAnswer="";
		if(type==1||type==2)
			optionNum = document.getElementById("optionNum").value;
		else if(type==3)
			optionNum = document.getElementById("optionNum").innerHTML;
		else if(type==4)
			optionNum = "0";
		if(type==1||type==2||type==3){
			optionContent = document.getElementsByName("optionContent");
			for(var i=0;i<optionNum;i++){
				option[i]= optionContent[i].value;
			}
			options = option.join("@@");
		}else if(type==4){
			optionContent="";
		}
		if(type==1){
			topicAnswer = document.getElementById("topicAnswer").value;
		}else if(type==2){
			topicAnswer = contentApp.getMultipleSelectValue("topicAnswer");
		}else if(type==3){
			topicAnswer="";
		}else if(type==4){
			topicAnswer = document.getElementById("topicAnswer").value;
		}
		param = "topicType="+topicType+" topicRange="+topicRange+" topicContent="+topicContent+" topicName="+topicName+
				" topicNum="+optionNum+" options="+options+" topicAnswer="+topicAnswer;
		alert(param);
		TopicDesignAction.addSingleChoice(topicType,topicRange,topicName,topicContent,optionNum,options,topicAnswer,function(data){
			if(data=="success")
				$('#save_success').triggerHandler('click');
			else if(data=="error")
				$('#save_error').triggerHandler('click');
		});
	}
	else{
		var topicAnswer = document.getElementById("topicAnswer").value;
		param = "topicType="+topicType+" topicRange="+topicRange+" topicContent="+topicContent+" topicName="+topicName+" topicAnswer="+topicAnswer;
		alert(param);
		TopicDesignAction.addSubjective(topicType,topicRange,topicName,topicContent,topicAnswer,function(data){
			if(data=="success")
				$('#save_success').triggerHandler('click');
			else if(data=="error")
				$('#save_error').triggerHandler('click');
		});
	}
	return true;
}
/**
 *	收集填空个数，并生成填空答案输入框
 */
function collectBlank(){
	var topicContent = document.getElementById("topicContent").value;
	var check = "([^_]__|^__)";
	var reg = new RegExp(check,"g");
	var str = topicContent.match(reg);
	var num = str?str.length:0;
	$('span#optionNum').html(num);
	var div = $('div.form-actions');
	var existOption = $('div.optionDiv');
	existOption.remove();
	for(var i=0;i<num;i++){
		var optionDemo = getBlankOption(i+1);
		$(div).before(optionDemo);
	}
	return false;
}
function createOption(){
	var optionNum = document.getElementById("optionNum").value;
	var div = $('div.answerDiv');
	var existOption = $('div.optionDiv');
	var optionNumCurrent = existOption.length;
	var topicAnswer = document.getElementById("topicAnswer");
//	var topicAnswerNext = $(topicAnswer).next().find('ul.chzn-results');
	if(optionNumCurrent<=optionNum){
		for(var i=optionNumCurrent;i<=optionNum-1;i++){
			//生成选项栏
			var optionDemo = getOption(i);
			$(div).before(optionDemo);
			//同步答案选项select			
			var name = toChar(i);
			topicAnswer.options.add(new Option(name));
			//同步答案选项			
//			var liNum = topicAnswerNext.find('li').length;
//			topicAnswerNext.find('li:last').clone(true).appendTo(topicAnswerNext);
//			var lastLi = topicAnswerNext.find('li:last');
//			var id =lastLi.attr('id');
//			lastLi.attr('id',id.substring(0,id.lastIndexOf('_')+1),liNum);
//			lastLi.html(name);
		}
		if(i==optionNum){//同步答案选项
			$(topicAnswer).attr('class','');
			$(topicAnswer).next().remove();
			$('#topicAnswer').chosen();
		}
	}else{
		for(var i=optionNum;i<=optionNumCurrent-1;i++){
			//去掉选项栏
			existOption[i].remove();
			//同步答案选项select
			topicAnswer.options.remove(topicAnswer.length-1);
			//同步答案选项
//			topicAnswerNext.find('li').last().remove();
		}
		if(i==optionNumCurrent){//同步答案选项
			$(topicAnswer).attr('class','');
			$(topicAnswer).next().remove();
			$('#topicAnswer').chosen();
		}
	}
//	existOption.remove();
//	
//	for(var i=0;i<optionNum;i++){
//		var optionDemo = getOption(i);
//		$(div).before(optionDemo);
//	}
	return false;
}
/**
 * 试题预览
 */
function topic_preview(type){
	var topicContent = document.getElementById("topicContent").value;
	var optionNum = "0";
	var optionContent = "";
	var option = new Array();
	var topicAnswer="";
	if(type!=5){
		if(type==1||type==2)
			optionNum = document.getElementById("optionNum").value;
		else if(type==3)
			optionNum = document.getElementById("optionNum").innerHTML;
		else if(type==4)
			optionNum = "0";
		if(type==1||type==2||type==3){
			optionContent = document.getElementsByName("optionContent");
			for(var i=0;i<optionNum;i++){
				option[i]= optionContent[i].value;
			}
		}else if(type==4){
			optionContent="";
		}
		if(type==1){
			topicAnswer = document.getElementById("topicAnswer").value;
		}else if(type==2){
			topicAnswer = contentApp.getMultipleSelectValue("topicAnswer");
		}else if(type==3){
			topicAnswer="";
		}else if(type==4){
			topicAnswer = document.getElementById("topicAnswer").value;
		}
	}
	else{
		topicAnswer = document.getElementById("topicAnswer").value;
	}
	document.getElementById("topicContent_pre").innerHTML = topicContent;
	if(type==1||type==2){
		var tbody = $("#topicOption_pre tbody");
		var part = "";
		for(var i=0;i<optionNum;i++){
			var index = toChar(i);
			part += '<tr><td '+(i==0?'class="small"':'')+'>'+index+'.</td><td>'+option[i]+' </td></tr>';
		}
		tbody.html(part);
	}
	else if(type==4){
		var tbody = $("#topicOption_pre tbody");
		var part = "";
		part += '<tr><td class="small">'+toChar(0)+'.</td><td>正确 </td></tr>';
		part += '<tr><td>'+toChar(1)+'.</td><td>错误 </td></tr>';
		tbody.html(part);
	}
}
//--------------------------------------------topicTypeManage--------------------------------------
/**
 * 试题类型(查看)
 */
function TopicTypeView(obj){
var tr = $(obj).parent().parent();
var children = $(tr).children();
var id = $(tr).attr('id');
var name = $(children).eq(0).html();
var inputdate = $(children).eq(1).html();
var sortNo = $(children).eq(2).html();
var status = $(children).eq(3).html();
var width = (document.body.clientWidth-700)/2;
var height = ($(window).height()-160)/2+$(window).scrollTop();
var div_lock = '<div id="div_lock" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; overflow: hidden; z-index: 1800;"></div>';
var pop_info = '<div id="pop_info" style="left: '+width+'px; top: '+height+'px; display: none; position: absolute; width: auto; z-index: 1802;">'+
		   '<table class="table table-bordered" style="width:700px;height:80px;background:white;margin-bottom:0px;"><thead>' +
		   '<tr><th>题型ID</th><th>题型名称</th><th>注册时间</th><th>排序号</th><th>状态</th><th>动作</th></tr></thead>' +
		   '<tbody><tr><td>'+id+'</td><td>'+name+'</td><td>'+inputdate+'</td><td>'+sortNo+'</td><td>'+status+'</td>' +
		   '<td class="center"><a class="btn btn-success" href="javascript:void(0)"onclick="removePopWindow()"><i class="icon-zoom-in icon-white"></i>返回 </a></td></tr></tbody></table></div>';
$(document.body).append(div_lock);
$(document.body).append(pop_info);
$('#pop_info').fadeIn(500);
return false;
}
/**
 * 编辑试题类型
 */
function as_edit_topicType(obj){
	var tr = $(obj).parent().parent();
	var children = $(tr).children();
	var id = $(tr).attr('id');
	var name = $(children).eq(0).html();
	var sortNo = $(children).eq(2).html();
	var status_td = $(children).eq(3);
	var status = $(status_td).find('span').html();
	var change = "";
	if(status=='Active')
		change = '<input data-no-uniform="true" checked type="checkbox" class="iphone-toggle">';
	else
		change = '<input data-no-uniform="true" type="checkbox" class="iphone-toggle">';
	status = '<div style="display:none">'+$(status_td).html()+'</div>'+change;
	$(status_td).html(status);
	$('.iphone-toggle').iphoneStyle();
	var action = $(children).last().html();
	var new_action = '<a class="btn btn-success" onclick="return as_save_topicType(this)"><i class="icon-zoom-in icon-white"></i> 保存 </a>'+
	' <a class="btn btn-info" onclick="return as_cancel_topicType(this)"><i class="icon-edit icon-white"></i> 取消 </a>';
	new_action = new_action+'<div style="display:none">'+action+'</div>';
	$(children).eq(0).html('<input type="text" class="edit" name="'+name+'" value="'+name+'"/>');
	$(children).eq(2).html('<input type="text" class="edit" name="'+sortNo+'" value="'+sortNo+'"/>');
	$(children).last().html(new_action);
	return false;
}
/**
 * 取消编辑
 */
function as_cancel_topicType(obj){
	var tr = $(obj).parent().parent();
	var children = $(tr).children();
	var status_td = $(children).eq(3);
	var status = $(status_td).find('div').eq(0).html();
	$(children).eq(0).html($(children).eq(0).find('input').attr('name'));
	$(children).eq(2).html($(children).eq(2).find('input').attr('name'));
	$(children).last().html($(children).last().find('div').html());
	$(status_td).html(status);
	return false;
}
/**
 * 保存试题类型
 */
function as_save_topicType(obj){
	var tr = $(obj).parent().parent();
	var children = $(tr).children();
	var id = $(tr).attr('id');
	var name = $(children).eq(0).find('input').val();
	var sortNo = $(children).eq(2).find('input').val();
	var status_td = $(children).eq(3);
	var width = $(status_td).find('label').filter('.iPhoneCheckLabelOn').width();
	var isInUse = width==54?1:0;
	TopicTypeAction.saveTopicType(id,name,sortNo,isInUse,function(data){
		if(data=="success")
			$('#save_success').triggerHandler('click');
		else if(data=="error"){
			$('#save_error').triggerHandler('click');
			return false;
		}
		$(children).eq(0).html(name);
		$(children).eq(2).html(sortNo);
		$(children).last().html($(children).last().find('div').html());
		if(isInUse==1) 
			$(status_td).html('<span class="label label-success">Active</span>');
		else 
			$(status_td).html('<span class="label">Inactive</span>');
	});
	return false;
}
/**
 * 删除试题类型
 */
function as_del_topicType(obj){
	var tr = obj.parentNode.parentNode;
	var id = tr.id;
	if(!confirm("您确定删除吗？"))
		return false;
	TopicTypeAction.delTopicType(id,function(data){
		if(data=="success"){
			$('#del_success').triggerHandler('click');
		}
		else if(data=="error")
			$('#action_error').triggerHandler('click');
	});
	return false;
}
//---------------------------------------topicBank-----------------------------------
/**
 * 试题类型(查看)
 */
function TopicView(obj){
var tr = $(obj).parent().parent();
var children = $(tr).children();
var id = $(tr).attr('id');
var name = $(children).eq(0).html();
var inputdate = $(children).eq(1).html();
var sortNo = $(children).eq(2).html();
var status = $(children).eq(3).html();
var width = (document.body.clientWidth-700)/2;
var height = ($(window).height()-160)/2+$(window).scrollTop();
var div_lock = '<div id="div_lock" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; overflow: hidden; z-index: 1800;"></div>';
var pop_info = '<div id="pop_info" style="left: '+width+'px; top: '+height+'px; display: none; position: absolute; width: auto; z-index: 1802;">'+
		   '<table class="table table-bordered" style="width:700px;height:80px;background:white;margin-bottom:0px;"><thead>' +
		   '<tr><th>题型ID</th><th>题型名称</th><th>注册时间</th><th>排序号</th><th>状态</th><th>动作</th></tr></thead>' +
		   '<tbody><tr><td>'+id+'</td><td>'+name+'</td><td>'+inputdate+'</td><td>'+sortNo+'</td><td>'+status+'</td>' +
		   '<td class="center"><a class="btn btn-success" href="javascript:void(0)"onclick="removePopWindow()"><i class="icon-zoom-in icon-white"></i>返回 </a></td></tr></tbody></table></div>';
$(document.body).append(div_lock);
$(document.body).append(pop_info);
$('#pop_info').fadeIn(500);
return false;
}
/**
 * 题库——查看试题
 */
function as_view_topic(obj){
	return false;
}
/**
 * 题库——编辑试题
 */
function as_edit_topic(obj){
	return false;
}
/**
 * 题库——编辑——保存试题
 */
function as_edit_save_topic(obj){
	return false;
}
/**
 * 题库——编辑——取消
 */
function as_edit_cancel_topic(obj){
	return false;
}
/**
 * 题库——删除试题
 */
function as_del_topic(obj){
	if(!confirm("您确定删除吗？"))
		return false;
	var tr = obj.parentNode.parentNode;
	var id = tr.id;
	TopicBankAction.delTopic(id,function(data){
		if(data=="success"){
			$('#del_success').triggerHandler('click');
			$(tr).remove();
		}
		else if(data=="error")
			$('#action_error').triggerHandler('click');
	});
}
//---------------------------------------testPaperGenerate-----------------------------------
/*一套编辑至少8个方法*/
/**
 * 添加试卷-新增
 */
function as_add_paper(userName){
	var tbody = $('#ungeneratePaper').find('tbody');
	var tr = document.createElement('tr');
	tbody[0].appendChild(tr);
	var td1 = document.createElement('td');
    tr.appendChild(td1);
//    td1.setAttribute("class","borderleft");
    td1.innerHTML = '<input type="text" class="edit"/>';
    var td2 = document.createElement('td');
    tr.appendChild(td2);
    td2.innerHTML='0';
    var td3 = document.createElement('td');
    tr.appendChild(td3);
    td3.innerHTML=contentApp.getDate();
    var td4 = document.createElement('td');
    tr.appendChild(td4);
    td4.innerHTML=userName;
    var td5 = document.createElement('td');
    tr.appendChild(td5);
    td5.innerHTML = '--';
    var td6 = document.createElement('td');
    tr.appendChild(td6);
    td6.innerHTML = '--';
    var td7 = document.createElement('td');
    tr.appendChild(td7);
    td7.innerHTML='--';
    var td8 = document.createElement('td');
    tr.appendChild(td8);
    td8.innerHTML='--';
    var td9 = document.createElement('td');
    tr.appendChild(td9);
    var action = '<a class="btn btn-success" href="#" onclick="return as_add_save_paper(this)"><i class="icon-zoom-in icon-white"></i> 保存 </a> '+  
	 '<a class="btn btn-info" href="#" onclick="return as_add_cancel_paper(this)"><i class="icon-edit icon-white"></i> 取消 </a> ';
    td9.innerHTML=action;
    return false;
}
/**
 * 添加试卷-保存
 */
function as_add_save_paper(obj){
	var tr = $(obj).parent().parent();
	var paperName = $(tr).find('td:first>input').val();
	if(paperName==""){
		alert("试卷名称不能为空");
		return false;
	}
	PaperAction.addPaper(paperName,function(data){
		if(data[0]=="success"){
			$('#save_success').triggerHandler('click');
			$(tr).attr("id",data[1]);
			$(tr).find('td:first').html(paperName);
			var action = '<a class="btn btn-success" href="#" onclick="return as_view_paper(this)"><i class="icon-zoom-in icon-white"></i> 查看 </a> '+  
			 '<a class="btn btn-info" href="#" onclick="return as_edit_paper(this)"><i class="icon-edit icon-white"></i> 编辑 </a> '+					
			 '<a class="btn btn-danger" href="#" onclick="return as_del_paper(this)"><i class="icon-trash icon-white"></i> 删除  </a>';	
			$(tr).find('td:last').html(action);
		}
		else if(data[0]=="error"){
			$('#save_error').triggerHandler('click');
		}
	});
	return false;
}
/**
 * 添加试卷-取消
 */
function as_add_cancel_paper(obj){
	var tr = $(obj).parent().parent();
	tr.remove();
	return false;
}
/**
 * 查看试卷
 */
function as_view_paper(obj,target){
	var tr = $(obj).parent().parent();
	var paperId = $(tr).attr('id');
	var paperName = $(tr).find('td:first').html();
	contentApp.switchMenu("testPaperGenerateList",paperId+";"+paperName+";"+target);
	return false;
}
/**
 * 编辑试卷
 */
function as_edit_paper(obj){
	return false;
}
/**
 * 编辑试卷-保存
 */
function as_edit_save_paper(obj){
	return false;
}
/**
 * 编辑试卷-取消
 */
function as_edit_cancel_paper(obj){
	return false;
}
/**
 * 删除试卷
 */
function as_del_paper(obj){
	if(!confirm("您确定删除吗？"))
		return false;
	var tr = obj.parentNode.parentNode;
	var id = tr.id;
	PaperAction.delPaper(id,function(data){
		if(data=="success"){
			$('#del_success').triggerHandler('click');
			$(tr).remove();
		}
		else if(data=="error")
			$('#action_error').triggerHandler('click');
	});
	
	return false;
}
/**
 * 发布试卷
 */
function as_publish_paper(obj){
	if(!confirm("您确定发布吗？"))
		return false;
	var tr = obj.parentNode.parentNode;
	var id = tr.id;
	PaperAction.publishPaper(id,function(data){
		if(data=="success"){
			$('#publish_success').triggerHandler('click');
			$(tr).remove();
		}
		else if(data=="error")
			$('#action_error').triggerHandler('click');
	});
	return false;
}
/**
 * 取消发布试卷
 */
function as_publish_cancel_paper(obj){
	if(!confirm("您确定取消发布吗？"))
		return false;
	var tr = obj.parentNode.parentNode;
	var id = tr.id;
	PaperAction.CancelPublishPaper(id,function(data){
		if(data=="success"){
//			$('#publish_success').triggerHandler('click');
			$(tr).remove();
		}
		else if(data=="error")
			$('#action_error').triggerHandler('click');
	});
	return false;
}
//-------------------------------------testPaperGenerateList-----------------------------
/**
 * 预览试卷
 */
function as_preview_paper(paperId){
	if(!confirm("您确定要预览试卷？"))
		return false;
	var paperId = $('#paperHeader').find('i').attr('id');
	var width = window.screen.availWidth;
	var height = window.screen.availHeight;
	window.open ('preview.jsp?paperId='+paperId,'previewWindow','fullscreen=1,width='+width+',height='+height+',top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no');
	return false;
}
/**
 * 获取试题详情
 */
function getTopicDetail(){
	alert('您好');
}
/**
 * 编辑试卷--编辑试题
 */
function as_paper_edit_topic(obj){
	if(!confirm("您确定要编辑该试题，编辑结果会同步题库中？"))
		return false;
	return false;
}
/**
 * 编辑试卷--删除试题
 */
function as_paper_del_topic(obj){
	if(!confirm("您确定删除吗？"))
		return false;
	var tr = obj.parentNode.parentNode;
	var id = tr.id;
	var paperId = $('#paperHeader').find('i').attr('id');
	PaperAction.delTopicForPaper(id,paperId,function(data){
		if(data=="success"){
			$('#del_success').triggerHandler('click');
			$(tr).remove();
		}
		else if(data=="error")
			$('#action_error').triggerHandler('click');
	});
	return false;
}
/**
 *	更新试卷--动态添加试题
 */
function updateTopicForPaper(tr){
	var questionId = tr.id;
	var tds = $(tr).find('td');
	if(tds.length==0) 
		return false;
	var questionName = $(tds[0]).html();
	var topicType = $(tds[1]).html();
	var topicRange = $(tds[2]).html();
	var accuracyRate = $(tds[3]).html();
	var table = $('#paperContent').find('table');
	var tbody = $(table).find('tbody');
	var tr_num = $(tbody).find('tr').length;
	var tr_first_td_num = $(tbody).find('tr:first td').length;
	var sortNo;
	if(tr_num==1&&tr_first_td_num==1)
		sortNo = "001";
	else
		sortNo = (Number($(tbody).find('tr:last td:first').html())+1001+'').substring(1);
	var action = '<a class="btn btn-success" onclick="return getTopicDetail(this)"><i class="icon-zoom-in icon-white"></i>	查看	</a> '+
				 '<a class="btn btn-info" href="#" onclick="return as_paper_edit_topic(this)"><i class="icon-edit icon-white"></i>	编辑	</a> '+
				 '<a class="btn btn-danger" href="#" onclick="return as_paper_del_topic(this)"><i class="icon-trash icon-white"></i>	删除	</a>';	                                            
	var text = '<tr id="'+questionId+'"><td>'+sortNo+'</td><td>'+questionName+'</td><td>'+topicType+'</td><td>'+topicRange+'</td><td>'+accuracyRate+'</td><td>'+action+'</td></tr>';
	if(tr_first_td_num==1)
		$(tbody).html(text);
	else
		$(tbody).append(text);
}
//--------------------------------------queryForTopic-----------------------------------
/**
 * 查询-checkbox切换
 */
function changeCheckbox(num){
	var checkbox;
	if(num==1){
		checkbox = $('#is-ajax2');
	}else{
		checkbox = $('#is-ajax1');
	}
	$(checkbox).removeAttr("checked");
	$(checkbox).parent().removeClass('checked');
}
/**
 * 手动录入
 */
function addTopicForPaper(){
	switchTopicType();
	$('#topicImport').hide();
	$('#topicDesignMain').show();
	return false;
}
/**
 * 获取需要查询的item
 */
function getQueryItems(){
	var queryUnitI = $('div.queryUnit').find('i:visible');
	var queryItem = "";
	for(var i=0;i<queryUnitI.length;i++){
		queryItem += $(queryUnitI[i]).attr('data')+",";
	}
	if(queryItem!="")
		queryItem = queryItem.substring(0,queryItem.length-1);
	else
		queryItem = "";
	return queryItem;
}
/**
 * 题库录入查询
 */
function queryForTopic(){
	var topicImportDiv = $('#topicImport');
	var content = $(topicImportDiv).find('.box-content');
	var timestamp = new Date().getTime();
	var div = '<div style="display:none" id="'+timestamp+'"></div>';
	$(topicImportDiv).append(div);
	var queryStyle = $(document.getElementById("is-ajax2").parentNode).hasClass('checked')?2:1;
	var queryItems = getQueryItems();
	var topicType = document.getElementById("topicType").value;
	var topicRange = document.getElementById("topicRange").value;
	var topicName = document.getElementById("topicName").value;
	var paperId = $('#paperHeader').find('i').attr('id');
	
	var file = 'div_part/queryList.jsp';
	$('div#'+timestamp).load(file,{'queryStyle':queryStyle,'queryItems':queryItems,'topicType':topicType,'topicRange':topicRange,'topicName':topicName,'paperId':paperId},function(){
		var div = $('div#'+timestamp+'>div');
		$(content).remove();
		$(div).unwrap();
	});
	
	//设置查询模块的标题------
	var title = "";
	if(queryStyle==1){
		if(queryItems=="topicName")
			title="普通查询——【"+$('#'+queryItems).val()+"】";
		else if(queryItems=="topicRange"||queryItems=="topicType")
			title="普通查询——"+$('#'+queryItems).find('option:selected').text();
		else
			title="普通查询——所有";
	}
	else{
		var itemValue = "";
		if(queryItems!=""){
			var queryItem = queryItems.split(',');
			for(var i=0;i<queryItem.length;i++){
				if(queryItem[i]=="topicName")
					itemValue+="——【"+$('#'+queryItem[i]).val()+"】";
				else
					itemValue+="——"+$('#'+queryItem[i]).find('option:selected').text();
			}
		}
		else
			itemValue="——所有";
		title="组合查询"+itemValue;
	}
	$('#topicImportTitle').html(title);
	//---------------------------
	$('#topicDesignMain').hide();
	$('#topicImport').show();
	return false;
}
//---------------------------------queryList----------------------------------
/**
 * 导入试题到试卷
 */
function as_import_TopicToPaper(obj){
	var tr = obj.parentNode.parentNode;
	var questionId = tr.id;
	var paperId = $('#paperHeader').find('i').attr('id');
	PaperAction.importTopicForPaper(questionId,paperId,function(data){
		if(data=="success"){
			$('#save_success').triggerHandler('click');
			updateTopicForPaper(tr);
			$(tr).remove();
		}
		else if(data=="error")
			$('#save_error').triggerHandler('click');
	});
	return false;
}