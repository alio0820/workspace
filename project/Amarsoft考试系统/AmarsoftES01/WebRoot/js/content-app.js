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
		switchMenu : function(target){
			var content = $('div#content');
			var timestamp = new Date().getTime();
			var div = '<div id="'+timestamp+'" style="display:none;"></div>';
			$(div).appendTo('#main');
			var contentParent = $('div#'+timestamp);
			$(contentParent).load(target+'.jsp #content',{/*'id':id,'listNo':listNum*/},ready4pageinfo);
			function ready4pageinfo(){
				//$('div#uniform-is-ajax').unbind();
				$.getScript('js/charisma.js');
//				$.getScript('js/content-plug.js');
				if(target=='topicDesign'){
					$.getScript('dwr/interface/TopicDesignAction.js');
				}else if(target=='businessPoint'){
					$.getScript('dwr/interface/BusinessPointAction.js');
					tr = $('#rangeTable').find('tr');
					if(tr.length>1){
						topicRangeParentId = $(tr).eq(1).attr('id');
						topicRangeParentName = $(tr).eq(1).find('td').eq(0).html();
					}
					$('#rangeTable tr,#rangeTable02 tr').click( function() {
				        $(this).toggleClass('row_selected');
				        switch(this.id){
				        case "rangeTable":	topicRangeParentId = $(this).attr('id');
				        					topicRangeParentName = $(this).find('td').eq(0).html();
				        					break;
				        case "rangeTable02":break;
				        }
				    });
				}
//				$('#file_upload').uploadify({
//					'swf'      : 'misc/uploadify.swf',
//					'uploader' : 'misc/uploadify.php'
//					// Put your options here
//				});
				if($(content).length!=0){
					$(content).fadeOut(500);
					$(content).remove();
				}
				$(contentParent).fadeIn(500);
				$(contentParent).find('#content').unwrap();
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
		}
	};
}();
$(document).ready(contentApp.init);