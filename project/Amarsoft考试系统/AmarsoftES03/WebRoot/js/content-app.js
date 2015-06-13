var contentApp = function(){
	return{
		init : function(){
			//showtip
			$('.noty').click(function(e){
				e.preventDefault();
				var options = $.parseJSON($(this).attr('data-noty-options'));
				noty(options);
			});
			//ajax menu checkbox
			$('#is-ajax').click(function(e){
				$.cookie('is-ajax',$(this).prop('checked'),{expires:365});
			});
			$('#is-ajax').prop('checked',$.cookie('is-ajax')==='true' ? true : false);
			$('a.ajax-link').click(function(e){
				if($.browser.msie) e.which=1;
				if(e.which!=1 || !$('#is-ajax').prop('checked') || $(this).parent().hasClass('active')) return;
				e.preventDefault();
				if($('.btn-navbar').is(':visible'))
				{
					$('.btn-navbar').click();
				}
				$('#loading').remove();
				$('#content').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
				var $clink=$(this);
				History.pushState(null, null, $clink.attr('href'));
				$('ul.main-menu li.active').removeClass('active');
				$clink.parent('li').addClass('active');	
			});
			
			$('ul.main-menu li:not(.nav-header)').hover(function(){
				$(this).animate({'margin-left':'+=5'},300);
			},
			function(){
				$(this).animate({'margin-left':'-=5'},300);
			});
			$('div.main-menu-span').find('a').click(function(){
				$('ul.main-menu li').filter('.active').removeClass('active');
				$(this).parent().addClass('active');
				if(this.href.indexOf('#')<0) {
					var next = $(this).parent().next();
					while($(next).hasClass('sub-menu')){
						$(next).toggle();
						next = $(next).next();
					}
					return ;
				}
				var target = $(this).attr('tar');
				contentApp.switchMenu(target);
			});
		},
		initSelect : function(param,methodName){
			var select="";
			if(param!=null) select = $(param);
			else select = $('[data-rel="chosen"]');
			if(select.length==0) select = $()
			var div = $(select).next();
			var li = $(div).find('li');
			$(li).bind('click',eval(methodName));
		},
		initTable : function(){
			tr = $('#rangeTable').find('tr');
			if(tr.length>1){
				topicRangeParentId = $(tr).eq(1).attr('id');
				topicRangeParentName = $(tr).eq(1).find('td').eq(0).html();
			}
			$('#rangeTable tbody tr,#rangeTable02 tbody tr').bind('click',function(event){
				var td = event.target.localName;
				if(td!='td') return;
				$(this).siblings().removeClass('row_selected');
		        $(this).toggleClass('row_selected');
		        switch($(this).parent().parent().attr('id')){
		        case "rangeTable":	topicRangeParentId = $(this).attr('id');
		        					topicRangeParentName = $(this).find('td').eq(0).html();
		        					updateView(2);
		        					break;
		        case "rangeTable02":break;
		        }
		        return false;
		    });
		},
		initDataTable : function (){
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
		},
		initTabs : function(){
			//tabs
			$('#myTab a:first').tab('show');
			$('#myTab a').click(function (e) {
			  e.preventDefault();
			  $(this).tab('show');
			});
			//扩展Tabs
			$('ul#myTab a').eq(0).bind("click",function(){
				$('div.tabs-other').removeClass('tabs-hide');
				$('#addTopic').hide();
				$('#topicDesignMainParent').hide();
				if($('#topicImport').find('.box-content').length!=0)
					$('#topicImport').show();
			});
			$('ul#myTab a').eq(1).bind("click",function(){
				$('div.tabs-other').addClass('tabs-hide');
				$('#addTopic').attr('style','display:inline-block;float:left;margin-top:-7px;');
				$('#topicImport').hide();
				if($('#topicDesignMain').find('.box-content').length!=0)
					$('#topicDesignMainParent').show();
			});
		},
		switchMenu : function(target,param){
			var content = $('div#content');
			var timestamp = new Date().getTime();
			var div = '<div id="'+timestamp+'" style="display:none;"></div>';
			$(div).appendTo('#main');
			var contentParent = $('div#'+timestamp);
			$(contentParent).load(target+'.jsp #content',{'param':param},ready4pageinfo);
			function ready4pageinfo(){
				//$('div#uniform-is-ajax').unbind();
//				$.getScript('js/charisma.js');
				$.getScript('js/content-run.js');
				if($(content).length!=0){
//					$(content).fadeOut(500);
					$(content).remove();
				}
//				$(contentParent).fadeIn(500);
				$(contentParent).find('#content').unwrap();
				if(target=='topicDesign'){
					$.getScript('dwr/interface/TopicDesignAction.js');
					$('[data-rel="chosen"],[rel="chosen"]').chosen();
					contentApp.initSelect('#topicType','switchTopicType');
					contentApp.initSelect('#optionNum','createOption');
					$('textarea.autogrow').autogrow();
				}else if(target=='businessPoint'){
					$.getScript('dwr/interface/BusinessPointAction.js');
					contentApp.initTable();
				}else if(target=='topicTypeManage'){
					$.getScript('dwr/interface/TopicTypeAction.js');
					$('#TypeTable tbody tr').bind('click',function(event){
						var td = event.target.localName;
						if(td!='td') return;
						$(this).siblings().removeClass('row_selected');
				        $(this).toggleClass('row_selected');
				        return false;
				    });
				}else if(target=='topicBank'){
					$.getScript('dwr/interface/TopicBankAction.js');
					$('[data-rel="chosen"],[rel="chosen"]').chosen();
//					contentApp.initSelect('#optionNum','alert(1)');
					$("input:checkbox").uniform();
				}
				else if(target=='testPaperGenerate'){
					$.getScript('dwr/interface/PaperAction.js');
					$('[data-rel="chosen"],[rel="chosen"]').chosen();
					$("input:checkbox").uniform();
				}
				else if(target=='testPaperGenerateList'){
					$.getScript('dwr/interface/TopicBankAction.js');
					$('[data-rel="chosen"],[rel="chosen"]').chosen();
					$("input:checkbox").uniform();
					contentApp.initTabs();
				}
//				$('#file_upload').uploadify({
//					'swf'      : 'misc/uploadify.swf',
//					'uploader' : 'misc/uploadify.php'
//					// Put your options here
//				});
				
			}
		},
		getDate : function(){
			var date = new Date();
			var year = date.getFullYear();
			var month= date.getMonth()+1;
			var day = date.getDate();
			if(month<10) month="0"+month;
			if(day<10) day="0"+day;
			return year+'-'+month+'-'+date.getDate();
		},
		getSelectValue : function(selectId){//select可以直接获取值，暂不适用
			var select = document.getElementById(selectId);
			var div = $(select).next();
			var li = $(div).find('li');
			var i=0;
			for(;i<li.length;i++){
				if($(li[i]).hasClass('result-selected'))
					break;
			}
			var value = select.options[i].value;
			return value;
		},
		getMultipleSelectValue : function(selectId){
			var select = document.getElementById(selectId);
			var div = $(select).next();
			var li = $(div).find('li.search-choice');
			if(li.length==0)
				return "";
			else{
				var array = "";
				for(var i=0;i<li.length;i++){
					var id = $(li[i]).attr('id');
					var index = id.substring(id.length-1);//最后一位数在0-9之间
					var value = select.options[index].value;
					array+= value+"@";
				}
				array = array.substring(0,array.length-1);
				return array;
			}
		}
	};
}();
$(document).ready(contentApp.init);