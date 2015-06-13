var createLinkList = function(val){	//前向链表
    var _this = {};
    _this.first = null;
    _this.length = 0;
    _this.maxlength = val;
    _this.add = function(val) {
    	if(_this.first!=null && _this.first.data == val) return;					//如果数据重复则不添加
        _this.first = {data:val, next: _this.first || null};
        _this.length++;
        if(_this.length>_this.maxlength){
        	_this.dellast();
        	_this.length--;
        }
    };
    // --- del
    _this.del = function(val){								//删除该节点的所有记录
        if (_this.first.data == val){						//first节点单独处理,此时不会引入相邻数据相同的问题
            _this.first = _this.first.next;
            _this.length--;
        } 
        var temp = _this.first;
        for(var temp=_this.first;temp&&temp.next!=null;temp=temp.next){//删除该节点的所有记录，可能引入相邻数据相同的问题(没有数据或只有一条数据时不进来)           
            if(temp.next.data == val){
                temp.next = temp.next.next;
                _this.length--;
            }
            if(temp.next!=null&& temp.data == temp.next.data){					//如果相邻数据相同，则去掉重复数据
            	 temp.next = temp.next.next;
                 _this.length--;
            }
        }
    };
    _this.dellast = function (){
    	var ptemp = temp = _this.first;
    	for(;temp.next!=null;ptemp = temp,temp = temp.next){}
    	ptemp.next = null;
    };
    // --- get    
    _this.get = function(val){
        for( var temp = _this.first ; temp; temp= temp.next){
            if(temp.data == val){
                return temp;
            }
        }        
    };  
    // --- show
    _this.show = function() {
    	var data  = '';
        for(temp=_this.first;temp;temp=temp.next) {
        	data = temp.data+";"+data;
        }
        return data;
    };
    return _this;
};
var linksClick = createLinkList(20);
var mailjs= {
	ready : function() {
		listNo = -1;		//菜单栏的序号
		listToTabRead = new Array();
		currentpage = 1;
		stop = false;
		stop2 = true;
		/**搜索框获得焦点*/
		var _mail_search= $('div#_mail_input_search');
		var _mail_input = $(_mail_search).find('input');
		$(_mail_search).hover(function(){
			$(this).addClass('nui-ipt-hover');
		});
		$(_mail_search).click(function(){
			$(this).addClass('nui-ipt-focus');
			$(this).find('label').hide();
			$(_mail_input).focus();
			if($.trim($(_mail_input).val())!='')
				$('div#_mail_menu_search').show();
		});
		/**搜索框失去焦点*/
		$(_mail_input).blur(function(event){								//失去焦点事件不能向上冒泡
			$(this).parent().removeClass('nui-ipt-focus');
			if($(this).val()=='')
				$(this).prev().show();
			else if(stop2)
				$('div#_mail_menu_search').hide();
		});
		/**搜索框动态关联*/
		$(_mail_input).keyup(function(){
			var data = $(this).val();
			data = $.trim(data);
			if($('div#_mail_menu_search').length==0&&data!=''){
				var timestamp = new Date().getTime();
				var div = '<div id="'+timestamp+'"></div>';
				$('body').append(div);
				$('div#'+timestamp).load('maildivpart.jsp #_mail_menu_search',{'data':data},function(){
					//为新的div添加事件监听
					$('div#_mail_menu_search').hover(function(){
						stop2 = false;
					},function(){
						stop2 = true;
					});
					$('div#_mail_menu_search').click(function(){
						$(this).hide();
						$.dialog.tips('正在搜索  '+$(_mail_input).val(),1,'loading.gif');
					});
				});			
			}
			else{
				if(data!=''){
					$('span.nui-txt-suc').html(data);
					$('div#_mail_menu_search').show();
				}
				else
					$('div#_mail_menu_search').hide();
			}
		});
		/**收件箱*/
		$('li#_mail_tree_1_33,li#_mail_component_90_90,li#_mail_tabitem_6_196').click(function(){
    		//修改css样式
    		$('li#_mail_tree_1_33').siblings().find('div').filter('.nui-tree-item-label-selected').removeClass('nui-tree-item-label-selected');
    		$('li#_mail_tree_1_33>div').addClass('nui-tree-item-label-selected');
    		$('div#dvContainer').children().hide();
    		var listmodule = document.getElementById("_dvModuleContainer_mbox.ListModule_1");
    		listmodule.style.display="";
    		if($('li#_mail_tabitem_6_196').attr('aria-selected')=='false'){
	    		$('ul#_mail_tab_0_95 li').filter('.nui-tabs-item-selected').removeClass('nui-tabs-item-selected').attr('aria-selected','false');
	    		$('li#_mail_tabitem_6_196').addClass('nui-tabs-item-selected').attr('aria-selected','true');
	    		//------------------------------------存放click记录
	    		linksClick.add('_mail_tabitem_6_196');
    		}
    		if(listmodule.innerHTML!='') return;
    		//------------------------------------第一次click收件箱记录
    		linksClick.add('_mail_tabitem_6_196');
//    		dwr.engine.setAsync(false);
//    		MailAction.getMailList(showMailList);
//    		dwr.engine.setAsync(true);
//    		list.ready();
    		$(listmodule).append('<div id="ListModule_0"></div>');
    		$('div#ListModule_0').load('maillist.jsp',{'currentpage':1},maillist.ready);
    		return false;
    	});
		/**写信*/
		$('li#_mail_component_92_92').click(function(){
			var composeModule = $('div#_dvModuleContainer_compose_ComposeModule_0');
			if($(composeModule).length!=0){
				$('div#dvContainer').children().hide();
    			$(composeModule).show();
				return false;
			}
			var timestamp = new Date().getTime();
			var div = '<div id="'+timestamp+'"></div>';
			$('div#dvContainer').append(div);
			$('div#'+timestamp).load('compose.jsp #_dvModuleContainer_compose_ComposeModule_0',{'currentpage':1},function(){
				composeModule = $('div#_dvModuleContainer_compose_ComposeModule_0');
				$(composeModule).unwrap();
				$('div#dvContainer').children().hide();
				$(composeModule).show();
			});
		});
    	$('div#navtree').hover(function(){
    		$(this).addClass('lX');
    	},function(){
    		$(this).removeClass('lX');
    	});
    	$('div#navtree>ul ul').hide();
    	$('li#_mail_tree_11_65,li#_mail_tree_14_84').click(function(){
    		$('li#'+this.id+'>div>span:first-child').find('b').toggle();
    		$(this).find('ul').toggle();
    	});
//    	dhtmlHistory.initialize();
//    	dhtmlHistory.addListener(historyChange);
//    	function historyChange(newLocation,historyData) {
//    		debug("A history change has occurred: "+ "newLocation="+newLocation+ ", historyData="+historyData,true);
//    	}
    }
};
var maillist = {
	ready : function(){
		/**选中checkbox事件  */
		var span_cs= $('span.cs');
		$(span_cs).unbind('click');
    	$(span_cs).click(function(event){
			var b = $(this).find('b');
			if(b.hasClass('nui-ico-checkbox-checked')){					//取消选中
				b.removeClass('nui-ico-checkbox-checked');
				$(this).attr('aria-checked','false');
				$(this).parent().parent().parent().removeClass('gu');
				var b = $('span#_mail_checkbox_'+currentpage).find('b');
				if(b.hasClass('nui-ico-checkbox-checked'))
					b.removeClass('nui-ico-checkbox-checked');
			}
			else{														//选中
				b.addClass('nui-ico-checkbox-checked');
				$(this).attr('aria-checked','true');
				$(this).parent().parent().parent().addClass('gu');
				var div = $('div#list_letter_'+currentpage+':visible>div:not(.gu)');
				if(div.length==0){
					$('span#_mail_checkbox_'+currentpage).find('b').addClass('nui-ico-checkbox-checked');
				}
			}
			event.stopPropagation();			//阻止事件冒泡
    	});
    	
    	/**全选-click*/
		$('div#tool_checkall_'+currentpage).click(function(event){
			if(event.target.id == '_mail_icon_60_364'){									//点击方框
				var div = $('div#list_letter_'+currentpage+':visible>div:not(.gu)');
				if(div.length!=0){														//全选
					div.addClass('gu');
					var span = $('span.cs:visible[aria-checked="false"]');
					$(span).attr('aria-checked',true);
					$(span).find('b').addClass('nui-ico-checkbox-checked');
					$('span#_mail_checkbox_'+currentpage).find('b').addClass('nui-ico-checkbox-checked');
				}
				else{																	//全不选
					var span = $('span.cs:visible');
					$(span).attr('aria-checked',false);
					$(span).find('b').removeClass('nui-ico-checkbox-checked');
					$(span).parent().parent().parent().removeClass('gu');
					$('span#_mail_checkbox_'+currentpage).find('b').removeClass('nui-ico-checkbox-checked');
				}
			}
			else{																		//点击下拉框
				var _mail_menu_checkall = $('div#_mail_menu_checkall');
				if($(_mail_menu_checkall).length==0){
					var timestamp = new Date().getTime();
					var div = '<div id="'+timestamp+'"></div>';
					$('body').append(div);
					$('div#'+timestamp).load('maildivpart.jsp #_mail_menu_checkall',{'currentpage':1},function(){
						var _mail_menu_checkall = $('div#_mail_menu_checkall');
						$(_mail_menu_checkall).unwrap();
						$(_mail_menu_checkall).click(function(){
							$(this).hide('fast');
						}).blur(function(){
							$(this).hide('fast');
						}).hover(function(){								
							$(this).addClass('on-menu');
						},function(){
							$(this).removeClass('on-menu');
						});
					});
				}
				else{
					$(_mail_menu_checkall).toggle('fast');
				}
			}
		}).blur(function(){												
			if(!$('div#_mail_menu_checkall').hasClass('on-menu'))
				$('div#_mail_menu_checkall:visible').hide('fast');
		});
    	/**删除-click*/
		$('div#tool_delete_'+currentpage).click(function(){
			var _currentpage = currentpage;
			var _ids = new Array();
			//获取选中的id
			var _id = $('div#list_letter_'+currentpage+':visible>div').filter('.gu');
			if(_id.length==0){
				$.dialog.tips('您未选中任何邮件！');
				return false;
			}
			else if(_id.length>=3){
				var isdelete = confirm('您确定要删除这些邮件吗？');
				if(!isdelete)
					return false;
			}
			//分离出listno
			//将listno存入ids中
			for(var i=0;i<_id.length;i++){
				_ids[i]=_id[i].id.substring(_id[i].id.indexOf('_')+1);
			}
			//附属操作：进入独立子页前，清除选中状态----
			MailAction.deleteMail(_currentpage,_ids,function(data){
				$.dialog.tips('您的邮件删除成功！');
//				var tabItemId = '_mail_tabitem_'+listNum;
//				$('li#'+tabItemId).remove();										//删除tab页				
//				var ReadModuleId = '_dvModuleContainer_read_ReadModule_'+listNum;
//				$('div#'+ReadModuleId).remove();									//删除read div
				dwr.engine.setAsync(false);
				MailAction.refreshMail(function(){
					var listmodule = document.getElementById("_dvModuleContainer_mbox.ListModule_1");
					listmodule.innerHTML='';				
				});
				dwr.engine.setAsync(true);
				$('li#_mail_tree_1_33').trigger('click');
			});
			
		});
		/**标记为-click*/
		$('div#tool_markas_'+currentpage).click(function(){
			var _mail_menu_markas = $('div#_mail_menu_markas');
			if($(_mail_menu_markas).length==0){
				var timestamp = new Date().getTime();
				var div = '<div id="'+timestamp+'"></div>';
				$('body').append(div);
				$('div#'+timestamp).load('maildivpart.jsp #_mail_menu_markas',{'currentpage':1},function(){
					var _mail_menu_markas = $('div#_mail_menu_markas');
					$(_mail_menu_markas).unwrap();
					$(_mail_menu_markas).click(function(){
						$(this).hide('fast');
					}).blur(function(){
						$(this).hide('fast');
					}).hover(function(){								
						$(this).addClass('on-menu');
					},function(){
						$(this).removeClass('on-menu');
					});
				});
			}
			else{
				$(_mail_menu_markas).toggle('fast');
			}
		}).blur(function(){												
			if(!$('div#_mail_menu_markas').hasClass('on-menu'))
				$('div#_mail_menu_markas').hide('fast');
		});
		/**移动到-click*/
		$('div#tool_moveto_'+currentpage).click(function(){
			var _this = this;
			var _mail_menu_moveto = $('div#_mail_menu_moveto');
			if($(_mail_menu_moveto).length==0){
				var timestamp = new Date().getTime();
				var div = '<div id="'+timestamp+'"></div>';
				$('body').append(div);
				$('div#'+timestamp).load('maildivpart.jsp #_mail_menu_moveto',{'currentpage':1},function(){
					var _mail_menu_moveto = $('div#_mail_menu_moveto');
					$(_mail_menu_moveto).unwrap();
					$(_mail_menu_moveto).click(function(){
						$(this).hide('fast');
					}).blur(function(){
						$(this).hide('fast');
					}).hover(function(){								
						$(this).addClass('on-menu');
					},function(){
						$(this).removeClass('on-menu');
					});
				});
			}
			else{
				$(_mail_menu_moveto).toggle('fast');
			}
		}).blur(function(){												
			if(!$('div#_mail_menu_moveto').hasClass('on-menu'))
				$('div#_mail_menu_moveto').hide('fast');
		});
		/**查看-click*/
		$('div#tool_view_'+currentpage).click(function(){
			var _this = this;
			var _mail_menu_view = $('div#_mail_menu_view');
			if($(_mail_menu_view).length==0){
				var timestamp = new Date().getTime();
				var div = '<div id="'+timestamp+'"></div>';
				$('body').append(div);
				$('div#'+timestamp).load('maildivpart.jsp #_mail_menu_view',{'currentpage':1},function(){
					var _mail_menu_view = $('div#_mail_menu_view');
					$(_mail_menu_view).unwrap();
					$(_mail_menu_view).click(function(){
						$(this).hide('fast');
					}).blur(function(){
						$(this).hide('fast');
					}).hover(function(){								//添加hover事件，关联class，为后面"查看"按钮失去焦点事件做准备
						$(this).addClass('on-menu');
					},function(){
						$(this).removeClass('on-menu');
					});
				});
			}
			else{
				$(_mail_menu_view).toggle('fast');
			}
		}).blur(function(){												//如果鼠标不在menu上触发该按钮失去焦点事件，则隐藏menu
			if(!$('div#_mail_menu_view').hasClass('on-menu'))
				$('div#_mail_menu_view').hide('fast');
		});
		/**更多-click*/
		$('div#tool_more_'+currentpage).click(function(){		//主要解决了blur事件与click事件的冲突
			var _this = this;
			var _mail_menu_more = $('div#_mail_menu_more');
			if($(_mail_menu_more).length==0){					//第一次触发"更多"按钮的click事件
				$('body').append('<div hidefocus="hidefocus" class="js-component-menu nui-menu " tabindex="0" '+
						'id="_mail_menu_more" style="opacity: 1; left: 572px; top: 126px; visibility: visible; transform: translate(0px, 0px);">'+
						'<div class="js-component-menuitem nui-menu-item" tabindex="-1" id="_mail_menuitem_export">'+
						'<div class="nui-menu-item-link"><span class="nui-menu-item-text">导出选中邮件</span></div></div>'+
						'<div class="js-component-menuitem nui-menu-item" tabindex="-1" id="_mail_menuitem_forward">'+
						'<div class="nui-menu-item-link"><span class="nui-menu-item-text">转发选中邮件</span></div></div></div>');
				_mail_menu_more = $('div#_mail_menu_more');
				$(_mail_menu_more).click(function(){
					$(this).hide();
				});
				$(_mail_menu_more).blur(function(event){
					var obj = event.srcElement ? event.srcElement : event.target;
					var browser = navigator.userAgent;
				    if (browser.indexOf('MSIE') != -1){  						//如果触发此事件的是"更多"按钮，且是IE浏览器，则阻止该按钮的click事件
				        if('_mail_menu_more' == document.activeElement.id ){  
				        	$(this).hide('fast');
				        	stop = true;
				            return false;
				        }  
				    }else if(browser.indexOf('Firefox') != -1){					//如果触发此事件的是"更多"按钮，且是Firefox浏览器，则阻止该按钮的click事件
				    	var sourceEvent = event.originalEvent.explicitOriginalTarget;
				    	if(sourceEvent.localName=='span'){
				    		if(sourceEvent.offsetParent.id == _this.id){
				    			$(this).hide('fast');
				    			stop = true;
					            return false;
				    		}
				    	}else if(sourceEvent.parentNode.offsetParent.id == _this.id){
				    		$(this).hide('fast');
				    		stop = true;
				            return false;
				    	}
				    }
				    else{														////如果触发此事件的是"更多"按钮，且是其它浏览器，则阻止该按钮的click事件
				        $(_this).mousedown(function(){
				        	$(this).hide('fast');
				        	stop = true;
				            return false;
				        });      
				    }
					$(this).hide('fast');
				});
				$(_mail_menu_more).show();
				$(_mail_menu_more).focus();
			}
			else{												//第二次及以上次数触发"更多"按钮的click事件
				if(stop==false){
					$(_mail_menu_more).toggle('fast');
					if($('div#_mail_menu_more:visible').length!=0)
						$(_mail_menu_more).focus();				
				}
				stop=false;
			}
		});
		/**刷新-click*/
		$('div#tool_refresh_'+currentpage).click(function(){
			MailAction.refreshMail(function(){
				var listmodule = document.getElementById("_dvModuleContainer_mbox.ListModule_1");
				listmodule.innerHTML='';
				$('li#_mail_tree_1_33').trigger('click');
			});
		});
    	/**上一页*/
    	var prepage= $('div#_mail_button_prepage').not('.nui-btn-disabled');
		$(prepage).unbind('click');
    	$(prepage).click(function(){
    		if(currentpage>1){
	    		var listmodule = document.getElementById("_dvModuleContainer_mbox.ListModule_1");
	    		$('div#ListModule_'+(currentpage-1)).hide();
	    		if($('div#ListModule_'+(currentpage-2)).length==0){
		    		$(listmodule).append('<div id="ListModule_'+(currentpage-2)+'"></div>');
		    		$('div#ListModule_'+(currentpage-2)).load('maillist.jsp',{'currentpage':currentpage-1},maillist.ready);
		    		currentpage--;
	    		}
	    		else{
	    			$('div#ListModule_'+(currentpage-2)).show();
	    			//清除该页选中状态
	    			var div = $('div#list_letter_'+(currentpage-1)+':visible>div').filter('.gu');
	    			div.removeClass('gu');
	    			var b = $('span.cs').find('b');
	    			if(b.hasClass('nui-ico-checkbox-checked')){
	    				b.removeClass('nui-ico-checkbox-checked');
	    				$(b).parent().parent().attr('aria-checked','false');
	    			}
	    			currentpage--;
	    		}
    		}
    	});
    	/**下一页*/
    	var nextpage= $('div#_mail_button_nextpage').not('.nui-btn-disabled');
		$(nextpage).unbind('click');
    	$(nextpage).click(function(){
    		
    		var listmodule = document.getElementById("_dvModuleContainer_mbox.ListModule_1");
    		$('div#ListModule_'+(currentpage-1)).hide();
    		if($('div#ListModule_'+currentpage).length==0){
	    		$(listmodule).append('<div id="ListModule_'+currentpage+'"></div>');
	    		$('div#ListModule_'+currentpage).load('maillist.jsp',{'currentpage':currentpage+1},maillist.ready);
	    		currentpage++;
    		}
    		else{
    			$('div#ListModule_'+currentpage).show();
    			//清除该页选中状态
    			var div = $('div#list_letter_'+(currentpage+1)+':visible>div').filter('.gu');
    			div.removeClass('gu');
    			var b = $('span.cs').find('b');
    			if(b.hasClass('nui-ico-checkbox-checked')){
    				b.removeClass('nui-ico-checkbox-checked');
    				$(b).parent().parent().attr('aria-checked','false');
    			}
    			currentpage++;
    		}
    	});
    	/**提示栏-关闭*/
    	$('a#_mail_link_close_'+currentpage).click(function(){
    		$('div.qi').hide();
    	});
    	/**滚动条-移动*/   	
    	$('div#ListModule_'+(currentpage-1)+' header').next().scroll(function(){
    		if($(this).scrollTop()!=0)
    			$(this).prev().addClass('frame-main-cont-head-shadow');
    		else
    			$(this).prev().removeClass('frame-main-cont-head-shadow');
    	});
    	/**邮件列表点击事件*/
    	var div_oe= $('div.oe');
		$(div_oe).unbind('click');
    	$(div_oe).click(function(event,tabItemId){
    		if(!$(this).hasClass('gt')){			//修改css样式
    			//查找兄弟节点是否拥有类gt
    			var brotherDiv = $(this).siblings('.gt');
    			if(brotherDiv.length!=0){
    				$(brotherDiv).find('div.cP').attr('title','');
	    			var brotherB = $(brotherDiv).find('b.nui-ico-drag2');
	    			$(brotherDiv).removeClass('gt');
	    			$(brotherB).addClass('nui-ico-drag');
	    			$(brotherB).removeClass('nui-ico-drag2');	    			
    			}
	    		$(this).addClass('gt');
	    		$(this).find('div.cP').attr('title','最近阅读邮件');
	    		$(this).find('b.nui-ico-drag').addClass('nui-ico-drag2');
	    		$(this).find('b.nui-ico-drag').removeClass('nui-ico-drag');    
    		}
    		var _this = this;
    		var id = this.id;
    		var time = $(this).attr('aria-time');
    		var ReadModule = document.getElementById('_dvModuleContainer_read_ReadModule_'+listToTabRead[time]);
    		if($(ReadModule).length!=0){							//如果已经打开，则直接显示    			
    	    	$('li#_mail_tabitem_6_196').removeClass('nui-tabs-item-selected').attr('aria-selected','false');
    	    	var li_mail_tabitem = $('li#_mail_tabitem_'+listToTabRead[time]);
    	    	$(li_mail_tabitem).addClass('nui-tabs-item-selected').attr('aria-selected','true');
    	    	//------------------------------------存放click记录
    	    	linksClick.add($(li_mail_tabitem).attr('id'));
    	    	if($(li_mail_tabitem).is(':hidden')){				//如果该Tab页已经关闭，则重新打开
    	    		if(typeof tabItemId!='string')
    					$(li_mail_tabitem).insertBefore('#_mail_tabitem_4_100');						//添加Tab页到默认位置
    				else
    					$(li_mail_tabitem).insertBefore('#'+tabItemId);									//添加Tab页到指定位置
    	    		$(li_mail_tabitem).show();
    	    	}
    	    	$('div#dvContainer').children().hide();
    			$(ReadModule).show();
    			return false;
    		}
//			MailAction.getMail(id,showMail);
    		listNo = listNo+1;											//前置分配listNo，防止出现相同的listNo
    		var listNum = listNo;
    		var subject = $('#'+id+' div').filter('.cq').html();
    		var ReadModuleId = '_dvModuleContainer_read_ReadModule_'+listNum;
    		listToTabRead[time] = listNum;								//将id关联保存到数组中
    		var div = '<div id="'+ReadModuleId+'"></div>';    		
    		$('div#dvContainer').append(div);
    		var readmodule =document.getElementById(ReadModuleId); //$('div#dvContainer').children().eq(-1);这种方法也可
			$(readmodule).load('mailinfo.jsp',{'id':id,'listNo':listNum},ready4pageinfo);		//载入邮件正文，断点时获取会有问题
			var li = '<li title="'+subject+'" tabindex="0" aria-selected="true" role="tab" '+
				'class="js-component-tabitem qa nui-tabs-item nui-tabs-item-selected" id="_mail_tabitem_'+listNum+'" style="display:none">'+
				'<span id="_mail_tabitem_'+listNum+'text" unselectable="on" class="nui-tabs-item-text nui-fNoSelect">'+subject+'</span>'+
				'<a hidefocus="hidefocus" class="nui-tabs-item-close js-component-link " href="javascript:void(0)" id="_mail_link_'+listNum+'" title="点击关闭标签">'+
				'<span class="js-component-component nui-tabs-item-close-transarea" id="_mail_component_'+listNum+'"></span>'+
				'<b class="js-component-icon nui-ico nui-ico-close " id="_mail_icon_'+listNum+'">x</b></a></li>';
			$('ul#_mail_tab_0_95 li').filter('.nui-tabs-item-selected').removeClass('nui-tabs-item-selected').attr('aria-selected','false');
			//指定Tab页的位置，如果nodeId为null，则插入到默认位置之前，否则插入到nodeId之前
			if(typeof tabItemId!='string')
				$(li).insertBefore('#_mail_tabitem_4_100');							//添加Tab页到默认位置
			else
				$(li).insertBefore('#'+tabItemId);									//添加Tab页到指定位置			
			//------------------------------------存放click记录
			linksClick.add('_mail_tabitem_'+listNum);
			$('li#_mail_tabitem_'+listNum).click(function(){						//点击Tab页
				if($(this).attr('aria-selected')=='false'){
					var tabid = this.id;
					var ReadModuleId = tabid.substring(tabid.lastIndexOf('_')+1);
					$('ul#_mail_tab_0_95 li').filter('.nui-tabs-item-selected').removeClass('nui-tabs-item-selected').attr('aria-selected','false');
					$(this).addClass('nui-tabs-item-selected').attr('aria-selected','true');
					//------------------------------------存放click记录
					linksClick.add(this.id);
					$('div#dvContainer').children().hide();							//优待改进
					document.getElementById('_dvModuleContainer_read_ReadModule_'+ReadModuleId).style.display='';
				}
			});
			$('a#_mail_link_'+listNum).click(function(event){						//关闭Tab页按钮
				linksClick.del($(this).parent().attr('id'));						//删除本次记录
				$(this).parent().hide();
				$('li#'+linksClick.first.data).click();
				event.stopPropagation();										//return false;可以阻止事件冒泡，同时也阻止自身事件；
			});
			function ready4pageinfo(){
				$('li#_mail_tabitem_'+listNum).show();
				$('div#dvContainer').children().hide();
				$('div#'+ReadModuleId).show();
				var isRead = $('div#'+ReadModuleId).find('.isRead');
				var isRead = $(isRead).val();
				if(isRead==0){
					$(_this).removeClass('ib');							//去掉加粗样式
					var b = $(_this).find('b.nui-ico-unread');			//去掉未读邮件标志
	    			$(b).removeClass('nui-ico-unread');
	    			$(b).addClass('nui-ico-read');
					var unReadCount = $('a.unRead strong').html();		//获取之前未读的邮件数量
					unReadCount = unReadCount -1;
					if(unReadCount>0){
						$('a.unRead strong').html(unReadCount);
						$('strong#_mail_tree_1_33count').html('('+unReadCount+')');
					}
					else{
						$('a.unRead').parent().parent().parent().hide();
						$('strong#_mail_tree_1_33count').html('');
					}
				}
				mailInfo.ready(time, listNum, _this);
			};
    		return false;
    	});
    	var div_cP= $('div.cP');
		$(div_cP).unbind('click');
    	$(div_cP).click(function(event){
    		event.stopPropagation();
    	});
	}
};
var mailInfo = {
	ready : function(time,listNum,_this){
		/**返回-click*/
		$('div#_mail_button_return_'+listNum).click(function(){
			$('li#_mail_tabitem_6_196').trigger('click');
		});		
		/**删除-click*/
		$('div#_mail_button_delete_'+listNum).click(function(){
			var _currentpage = document.getElementById('currentpage_'+listNum).value;
			var _id = document.getElementById('id_'+listNum).value;
			var _ids = new Array();
			_ids[0] = _id;
			MailAction.deleteMail(_currentpage,_ids,function(data){
				$.dialog.tips('您的邮件删除成功！');
				var tabItemId = '_mail_tabitem_'+listNum;
				$('li#'+tabItemId).remove();										//删除tab页				
				var ReadModuleId = '_dvModuleContainer_read_ReadModule_'+listNum;
				$('div#'+ReadModuleId).remove();									//删除read div
				MailAction.refreshMail(function(){
					var listmodule = document.getElementById("_dvModuleContainer_mbox.ListModule_1");
					listmodule.innerHTML='';									
					$('li#_mail_tree_1_33').trigger('click');
				});
			});			
		});		
		/**上一封-click*/
		$('div#_mail_button_preEmail_'+listNum).click(function(){
			if($(this).hasClass('nui-btn-disabled')) return ;
			$('li#_mail_tabitem_'+listToTabRead[time]).hide();				//隐藏本身			
			linksClick.del('_mail_tabitem_'+listNum);						//删除本次记录			
			$(_this).prev().trigger('click','_mail_tabitem_'+listNum);		//载入上一封
		});
		/**下一封-click*/
		$('div#_mail_button_nextEmail_'+listNum).click(function(){
			if($(this).hasClass('nui-btn-disabled')) return ;			
			$('li#_mail_tabitem_'+listToTabRead[time]).hide();				//隐藏本身			
			linksClick.del('_mail_tabitem_'+listNum);						//删除本次记录		
			$(_this).next().trigger('click','_mail_tabitem_'+listNum);		//载如下一封
		});
		/**滚动条-移动*/   	
    	$('div#_dvModuleContainer_read_ReadModule_'+listNum+' header').next().scroll(function(){
    		if($(this).scrollTop()!=0)
    			$(this).prev().addClass('frame-main-cont-head-shadow');
    		else
    			$(this).prev().removeClass('frame-main-cont-head-shadow');
    	});
    	//$('div#_dvModuleContainer_read_ReadModule_'+listNum+' header').next().scroolTop=0;
		/**精简信息-click*/
		var a_mail_link_23_333= $('a#_mail_link_23_333');
		$(a_mail_link_23_333).unbind('click');
		$(a_mail_link_23_333).click(function(){
			$(this).css('display','none');
			$('a#_mail_link_24_334').css('display','');
			$('ul#ulFull').css('display','none');
			$('ul#ulCompact').css('display','');
		});
		/**完整信息-click*/
		var a_mail_link_24_334= $('a#_mail_link_24_334');
		$(a_mail_link_24_334).unbind('click');
		$(a_mail_link_24_334).click(function(){
			$(this).css('display','none');
			$('a#_mail_link_23_333').css('display','');
			$('ul#ulCompact').css('display','none');
			$('ul#ulFull').css('display','');
		});		
		/**快捷回复框获得焦点*/
		var div_mail_input_2_365_textarea= $('div#_mail_input_2_365 textarea');
		var div_mailInfo_dvReplyInputs = $('div#mailInfo_dvReplyInputs');
		$(div_mailInfo_dvReplyInputs).unbind('click');
		$(div_mailInfo_dvReplyInputs).click(function(){	
			$('div#_mail_input_2_365').addClass('ev').addClass('nui-ipt-focus').addClass('nui-ipt-hover');
			$(this).find('label').css('display','none');
			$('div#_dvReplyBts').css('display','');
			$(div_mail_input_2_365_textarea).focus();
		});
		/**快捷回复框失去焦点*/
		$(div_mail_input_2_365_textarea).unbind('blur');
		$(div_mail_input_2_365_textarea).blur(function(){								//失去焦点事件不能向上冒泡
			$('div#_mail_input_2_365').removeClass('nui-ipt-focus').removeClass('nui-ipt-hover');
			if($(this).val()=='')
				$('div#_mail_input_2_365').find('label').css('display','');
		});
		/**快捷回复框绑定发送快捷键*/
		$(div_mail_input_2_365_textarea).unbind('keyup');
		$(div_mail_input_2_365_textarea).keyup(function(event){
			if(event.keyCode==13&&event.ctrlKey)
				$(div_mail_button_211_876).trigger('click');
			if(event.keyCode==27)
				$(div_mail_button_212_877).trigger('click');
		});
		/**点击取消（回复）按钮*/
		var div_mail_button_212_877= $('div#_mail_button_212_877');
		$(div_mail_button_212_877).unbind('click');
		$(div_mail_button_212_877).click(function(){
			$('div#_mail_input_2_365').removeClass('ev');
			$('div#_mail_input_2_365 textarea').val('');
			$('div#_mail_input_2_365').find('label').css('display','');
			$('div#_dvReplyBts').css('display','none');
		});
		/**点击发送按钮*/
		var div_mail_button_211_876= $('div#_mail_button_211_876');
		$(div_mail_button_211_876).unbind('click');
		$(div_mail_button_211_876).click(function(){			
			if($(div_mail_input_2_365_textarea).val()==''){
				$.dialog.alert('请输入回复内容。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',function(){
					$(div_mailInfo_dvReplyInputs).trigger('click');
				});
				return false;
			}
			var stmphost = "smtp.163.com";
			var mailreply = "wangjiuyingzui@163.com";
			var mailto = "450383731@qq.com";
			var subject = "回复："+$('h1#mailInfo_Subject').html();
			var msgcontent = $('div#_mail_input_2_365 textarea').val();
			$.dialog.tips('您的邮件正在发送...',100,'loading.gif');
			SendMailAction.sendMailMethod(stmphost,mailreply,mailto,subject,msgcontent,function(){
				$.dialog.tips('您的邮件发送成功！');
				$('div#_mail_input_2_365').css('display','none');
				$('div#_dvReplyBts').children().css('display','none');
				if($('span#_mail_label_status').length==0){
					$('div#_dvReplyBts').append('<span id="_mail_label_status" class="js-component-label nui-txt nui-txt-suc " tabindex="0">邮件发送成功！</span>'+
					'<a id="_mail_link_replay" class="js-component-link jI nui-txt-link" hidefocus="hidefocus" href="javascript:void(0)">再回一封邮件</a>');
					var a_mail_link_replay= $('a#_mail_link_replay');
					$(a_mail_link_replay).unbind('click');
					$(a_mail_link_replay).click(function(){
						$('div#_mail_input_2_365 textarea').val('');
						$('div#_mail_input_2_365').css('display','');
						$('div#_dvReplyBts').children().toggle();
					});
				}else{
					$('a#_mail_link_replay').css('display','');
					$('span#_mail_label_status').css('display','');
				}
			});
		});
//		var readmoduleddd=$('#'+ReadModuleId+' div').length;
////		alert(readmoduleddd);
//		var download_div = $('#'+ReadModuleId+' div').filter('.netease-attDown');
//		if($(download_div).length!=0){
//			$(download_div).css({position:"absolute",left:"10px",bottom:"0"});
//			var download_divtit = $('#'+download_div.id+' div').filter('.netease-attDown-tit');
//			$(download_divtit).html($(download_divtit).html().replace('attachments','个附件'));
//			var a = $(download_div).find('a');
//			$(a[0]).html('下载');
//			$(a[1]).html('在线预览');
//		}
	if($('div.netease-attDown').length!=0){
		$('div.netease-attDown').css({position:"absolute",left:"10px",bottom:"0"});
		$('div.netease-attDown-tit').html($('div.netease-attDown-tit').html().replace('attachments','个附件'));
		var a = $('div.netease-attDown-tit').find('a');
		for(var i=0;i<a.length;i++){					//没运行
			if(i%2==0)
				$(a[i]).html('下载');
			else
				$(a[i]).html('在线预览');
		}
	}
	}
};
$(document).ready(mailjs.ready);
	/**获取邮件  */
//	function getMail(){
//		MailAction.initMail();
//		MailAction.getMail(3,showMail);
//		MailAction.getMailList(showMailList);
//	}
	/**显示邮件  */
	function showMail(data){
		var mailBody = document.getElementById("mailBody");
		mailBody.innerHTML = data.content;
	}
	/**显示邮件列表  */
	function showMailList(data){
		var mailContent = document.getElementById("list_mailContent");
		var mailHead = document.getElementById("list_mailHead");
		var length = data.length;
		var i =length;
		var content=null;
		if(length>20) i =20;
		for(;i>=0;i--){
			var subject = data[i].subject;
			var sentDate = data[i].sentDate;
			var showDate = sentDate.substring(0,4)+'-'+sentDate.substring(5,7)+'-'+sentDate.substring(8,10);
			var from = data[i].from.split('"');
			var send = from[1].trim();
			var address = from[2].trim();
			content = content+
				'<div sign="letter" id="'+i+'" aria-label="'+sentDate+'&nbsp;'+send+'&nbsp;发来一封邮件，主题为：&nbsp;'+subject+'" tabindex="0" class="oe nui-txt-flag0">'+
				'<div class="kd fF bH">'+					
				'<div sign="start" class="eT">'+
					'<div class="cP" title="">'+
						'<b class="nui-ico nui-ico-drag"></b>'+
					'</div>'+
					'<span aria-label="选中此邮件" tabindex="0" role="checkbox" title="选中此邮件" class="nui-chk cs" sign="checkbox" aria-checked="false">'+
						'<span class="nui-chk-symbol">'+
							'<b class="nui-ico nui-ico-checkbox"></b>'+
						'</span>'+
					'</span>'+
					'<b sign="logo" title="已读" class="cQ nui-ico nui-ico-read"></b>'+
					'<div sign="start-from" class="cM">'+
						'<span title="" class="nui-user bE">'+send+'</span>'+
					'</div>'+
					'<b sign="flag" title="设为红旗" class="cR nui-ico nui-ico-flag  nui-ico-flag-0 "></b>'+
				'</div>'+
				'<div class="gp">'+
					'<div class="cq">'+subject+'</div>'+
				'</div>'+
				'<div class="gq">'+
					'<div title="'+sentDate+'" class="dw">'+showDate+'</div>'+
					'<div style="visibility: hidden" title="" class="nui-ico  cN"></div>'+
					'<div tabindex="0" role="button" title="选择邮件标签" class="js-component-button nui-miniBtn nui-btn nui-btn-hasIcon nui-miniBtn-hasIcon cO">'+
						'<span class="nui-btn-icon">'+
							'<b class="nui-ico nui-ico-dArr"></b>'+
						'</span>'+
						'<span class="nui-btn-text"></span>'+
					'</div>'+
				'</div>'+
				'<div class="gr"></div>'+
				'</div>'+
			'</div>';		
		}
		$(content).insertAfter("#list_mailHead");
	}
	/**页面加载完成的时候运行  */
//	window.onload=function(){
//		getMail();
//	};