//有时候main.jsp需要这个变量来判断resize窗口的时候是否需要修改pageContent的大小
var resizePageContentFlag = false;

var AppUtils = function() {
	var _defaultGridOption = {
			datatype: "json",
			autowidth: true,
			shrinkToFit : false,
			rownumbers: true,
			viewrecords : true,
			mtype: "POST", 
			rowNum:50, 
			rowList:[10,20,30,50,100,500,1000],
			keyIndex : false, //使用jsonReader中设置的id作为主键
			multiselect: true, 
			jsonReader : {
				id : "id", //列表主键
				repeatitems : false,
				cell : null
			},
			gridComplete: function(){
				AppUtils.resizeGrid(this.id);
			},
			loadComplete: function(){
				var pager = jQuery("#" + this.id).getGridParam().pager;
				var exportExcelBtnId = this.id + "_exportExcelBtn";
				
				if (!jQuery(pager).find("#" + exportExcelBtnId).attr("id")) {
					jQuery(this).navButtonAdd(pager,{id:exportExcelBtnId, caption:"导出",title:"导出EXCEL",buttonicon:"ui-icon-calculator",
						onClickButton:function(){
							AppUtils.exportExcel(this.id);
						} 
					});
				}

			}
		};
	
	var loadObj = {};
	
	return {
		date2Url : function(url) {
			if(url.indexOf('?') >= 0) {
				return url + "&time=" + new Date().getTime();
			}else{
				return url + "?time=" + new Date().getTime();
			}
		},
		reloadGrid : function(list) {
			jQuery("#" + list).trigger("reloadGrid"); 
		},
		//根据自定义范围查询
		queryGridBySelfDefineScope : function(list, criteria, orderby) {
			var searchDataParam = {
				criteria : criteria,
				filters : null //清空快速查询里面的查询条件
			};
			if(orderby) {
				searchDataParam['orderby'] = orderby;
			}
			jQuery("#" + list).setGridParam({
				page: 1,
				search : false,
				searchdata : searchDataParam
			}).trigger("reloadGrid");
		},
		getGridCheckedIds : function(list) {
			return jQuery("#" + list).getGridParam('selarrrow');
		},
		changeDialogTitle : function(dialogId,title) {
			var titleId = jQuery.ui.dialog.getTitleId(jQuery('#' + dialogId));
			jQuery('#' + titleId).html(title);
		},
		sexyCombo : function(url, id, containerId, otherConfigs) {
			//先同步
			jQuery.ajaxSetup({async:false});
			var combo = null;
			var params = [];
			if(otherConfigs && otherConfigs.params) {
				params = otherConfigs.params;
			}
			jQuery.getJSON(url, params, function(data){
				var config = {name: id, id: id, container: containerId, data : data};
				if(otherConfigs) {
					config = jQuery.extend(true,otherConfigs,config);
				}
				combo = $sc.create(config);
			});
			//恢复异步调用
			jQuery.ajaxSetup({async:true});
			return combo;
		},
		loadGyDmcode : function(selectId, fatherId, emptyText) {
			configRemoteCallController.queryChildDmcode(fatherId, function(list){
				dwr.util.removeAllOptions(selectId);
				dwr.util.addOptions(selectId,{'' : emptyText});
				dwr.util.addOptions(selectId,list,'dmName','dmName');
			});
		},
		getDeptSelectHtml : function(deptName, deptId, deptValue, deptIdValue) {
			deptValue = deptValue || '';
			deptIdValue = deptIdValue || '';
			var eventHtml = 'AppSelect.getDepartSelectOption(event,\''+deptName+'\',\''+deptId+'\')';
			return '<input type="text" name="'+deptName+'" id="'+deptName+'" value="'+deptValue+'" onkeyup="'+eventHtml+'" onclick="'+eventHtml+'" style="display:block;float:left"/>' +
				   '<span class="ui-icon ui-icon-circle-zoomin alignleft query-icon" title="点击显示学院列表" onclick="'+eventHtml+'"></span>' +
				   '<input type="hidden" name="'+deptId+'" id="'+deptId+'" value="'+deptIdValue+'"/>';
		},
		getMajorSelectHtml : function(majorName, majorId, majorValue, majorIdValue, deptIdObjName) {
			majorValue = majorValue || '';
			majorIdValue = majorIdValue || '';
			var eventHtml = 'AppSelect.getMajorSelectOption(event,\''+majorName+'\',\''+majorId+'\',\''+deptIdObjName+'\')';
			return '<input type="text" name="'+majorName+'" id="'+majorName+'" value="'+majorValue+'" onkeyup="'+eventHtml+'" onclick="'+eventHtml+'" style="display:block;float:left"/>' +
				   '<span class="ui-icon ui-icon-circle-zoomin alignleft query-icon" title="点击显示专业列表" onclick="'+eventHtml+'"></span>' +
				   '<input type="hidden" name="'+majorId+'" id="'+majorId+'" value="'+majorIdValue+'"/>';
		},
		moveElement2First : function(eleid) {
			var c =  jQuery('#' + eleid).clone(true);
			var p = jQuery('#' + eleid).parent();
			jQuery('#' + eleid).remove();
			p.prepend(c);
		},
		moveElementLeft : function(eleid) {       /* 向左移一个位置 */
			var c =  jQuery('#' + eleid).clone(true);
			var p = jQuery('#' + eleid).prev();
			if (p) {
				jQuery('#' + eleid).remove();
				p.before(c);
			}

		},
		// 不要为grid设置默认高度，grid 默认是150
		// bodywidth为需要减去的宽度
		resizeGrid : function(gridid, bodyheight, bodywidth, fixed){
			var bh = jQuery(document.body).height();
			if(bodyheight && bodyheight > 0) {
				bh = bodyheight;
			}
			var defaultGridHeight = jQuery("#" + gridid).getGridParam( 'height' ) - 10; 
			
			if( !loadObj[ gridid + '_h'] ){
				
				//alert( gridid )
				//alert( jQuery(window).height() - bh + defaultGridHeight );
				//alert(  jQuery("#userListing").scrollTop() )
				//alert(  jQuery("#userListing").scrollLeft() )
				var gridheight = jQuery(window).height() - bh + defaultGridHeight;
				
				jQuery("#" + gridid).setGridHeight( gridheight );
				loadObj[ gridid + '_h'] = true;
				if (fixed !== true) {
					jQuery(window).resize( function() {
						jQuery("#" + gridid).setGridHeight( jQuery(window).height() - bh + defaultGridHeight);
					});
				}

			}
			var bw = 0;
			if( bodywidth ){
				bw = bodywidth;
			}
			var currentWidth = jQuery(window).width() - 5 - bw;
			jQuery("#" + gridid).setGridWidth( currentWidth ); 
			jQuery(".ui-jqgrid-wrap").css("width",currentWidth);
			//jQuery(".button_bar").width( currentWidth-10);// 10是padding
			//jQuery(".button_bar").css({"margin-left":"auto","margin-right":"auto"});
			
			if (fixed !== true) {
				jQuery(window).resize( function() {
					jQuery("#" + gridid).setGridWidth(jQuery(window).width() - 5 - bw);
					//jQuery(".button_bar").width( jQuery(window).width() - 15 - bw );
				});
			}

		},
		adjustFrameSize : function(height){
			if(typeof height == 'undefined') {
				height = (resizePageContentFlag === false? 0 : resizePageContentFlag);
			}
			if(height === false) {
				return;
			}
			resizePageContentFlag = height;
			if(typeof resizePageContentFlag == 'number') {
				if (parent.document.getElementById('pageContent')) {
					var headerHeight = jQuery(parent.document.getElementById('header')).height();
					var marginTop =(parseInt(jQuery(parent.document.getElementById('content_main')).css('margin-top'),10));
					var mainAreaHeight = jQuery(parent.window).height() - headerHeight - 1 - (marginTop || 0);
					parent.document.getElementById('pageContent').height = (height? Math.max(height, mainAreaHeight) : mainAreaHeight) + 'px';
				}
				else if (document.getElementById('pageContent')) {
					var headerHeight = jQuery(document.getElementById('header')).height();
					var marginTop =(parseInt(jQuery(document.getElementById('content_main')).css('margin-top'),10));
					var mainAreaHeight = jQuery(window).height() - headerHeight - 1 - (marginTop || 0);
					document.getElementById('pageContent').height = (height? Math.max(height, mainAreaHeight) : mainAreaHeight) + 'px';
				}
			}
		},
		adjustTreeWidth : function (layout,width,min,max){
			if(!min) min=200;
			if(!max) max=300;
			if(!width){
				width = jQuery("#VirtualRootNode").outerWidth()+25;
				width = width<min?min:width;
				width = width>max?max:width;
			}
			if(layout)layout.sizePane('west', width);
		},
		//对框架自带的查询添加敲回车触发查询事件
		initSearchKeydown : function(listing){
			jQuery('#gbox_'+listing).keydown(function(event){
				if(event.keyCode==13) {
					jQuery(this).find(".ui-search").click();
				}
			});
		},
		getScreenHeight : function(doc) {
			if(!doc) {
				doc = document;
			}
			var bdy = (doc.documentElement && doc.documentElement.clientWidth)?doc.documentElement:doc.body;
			return bdy.clientHeight;
		},
		qtip : function(ele, options) {
			options = options || {};
			if (jQuery(ele).offset().top < 28) {
				jQuery(ele).qtip($.extend({
					position: {
						corner: {
					    	target: 'bottomRight',
					        tooltip: 'topLeft'
					    }
					 },
					 style: {
					 	name: 'cream',
					    padding: '7px 13px',
					    width: {
					    	max: 310,
					        min: 0
					    },
					    tip: true
					}
				}, options));
			} else {
				jQuery(ele).qtip($.extend({
					position: {
						corner: {
					    	target: 'topRight',
					        tooltip: 'bottomLeft'
					    }
					 },
					 style: {
					 	name: 'cream',
					    padding: '7px 13px',
					    width: {
					            max: 310,
					            min: 0
					         },
					         tip: true
					      }
				},options));
			}

		},
		initDateFields : function(id){
			if (id) {
				jQuery(id).datepicker({
					changeMonth: true,
					changeYear: true,
					duration: 0,
					showButtonPanel: true,
					showOtherMonths: true,
					selectOtherMonths: true
				});
			}else {
				/*jQuery.datepicker.setDefaults({
					onClose : function(){
					    if(!AppUtils.checkDate(this, this.dateFormat)) {
					        Message.error(jQuery(this), "日期不正确");
					        jQuery(this).click();
					    }
						//jQuery(this).focus();
					    jQuery(this).focus();
					},
					showOn: 'click'
				});*/
			    var date = new Date();
				jQuery.each(jQuery('.Wdate'), function(index, obj){
				    var dateFormat = jQuery(obj).attr('dateFormat') || 'yy-mm-dd';
					var datepiker = jQuery(obj).datepicker({
						changeMonth: true,
						changeYear: true,
						duration: 0,
						yearRange:'1900:' + (parseInt(date.getFullYear()) + 10),
						dateFormat : dateFormat,
						showButtonPanel: true,
						showOtherMonths: true,
						selectOtherMonths: true
					});

					jQuery(obj).addClass("x-form-text x-form-field");
					jQuery(obj).wrap( '<span class="x-form-field-wrap " ></span>' );
					jQuery(obj).after( '<img class="x-form-trigger x-form-date-trigger " src="thirdparty/ext/resources/images/default/s.gif" >');
					jQuery(obj).next('img').bind( 'click', function(event){
						datepiker.datepicker( "show" )
				    });
					if(!jQuery(obj).val()){
						var value = jQuery.datepicker.formatDate(dateFormat, new Date());
						jQuery(obj).attr('title','例如：'+value);
						//AppUtils.qtip(obj);
					}
					jQuery(obj).blur(function(){
						if(!AppUtils.checkDate(this, this.dateFormat)) {
							Message.error(jQuery(this), "日期不正确");
					        jQuery(this).click();
					    }
					});
				});
			}
		},
		initNewDateField :function(id,dateFormat){
			var obj = jQuery('#'+id);
			if(!dateFormat){
				dateFormat = obj.attr('dateFormat') || 'yy-mm-dd';
			}
			var value = jQuery.datepicker.formatDate(dateFormat, new Date());
			obj.attr('title','例如：'+value);
			AppUtils.qtip(obj);
			
			obj.blur(function(){
				if(!AppUtils.checkDate(this,dateFormat)) {
			        Message.error(jQuery(this), "日期不正确");
			        jQuery(this).click();
			    }
			});
		},
		/**
		 * 检查文件名是否是合法的excel
		 * @param value
		 * @returns
		 */
		checkSelectedFile4ImportExcel: function(filename) {
			var suffixIndex = filename.lastIndexOf('.'),
			    suffix = '',
			    validSuffix = ['xls'];
			if(suffixIndex >= 0) {
				suffix = filename.substring(suffixIndex + 1).toLowerCase();
			}
			if(suffix == '' || validSuffix.indexOf(suffix) < 0) {
				alert('请选择正确的Excel文件（后缀为：' + validSuffix + '）');
				return false;
			}
			return true;
		},
		//objs
		checkDateValueBeforeSubmit : function(objs){
			if(!objs){
				objs = jQuery('.Wdate');
			}
			for(var i=0;i<objs.length;i++){
				var obj = objs[i];
				var dateFormat = jQuery(obj).attr('dateFormat') || 'yy-mm-dd';
				if(!AppUtils.checkDate(obj, dateFormat)) {
			        //Message.error(jQuery(obj), "日期不正确");
			        alert(jQuery(obj).val()+"不是有效的日期类型!");
			        return false;
			    }
				
				
			}
			return true;
		},
		checkDateValue : function(obj) {
		    var dateFormat = jQuery(obj).attr("dateFormat");
		    if (!dateFormat) {
		        dateFormat = "yy-mm-dd";
		    }
		    if(!AppUtils.checkDate(obj, dateFormat)) {
		        Message.error(jQuery(obj), "日期不正确");
		        obj.focus();
		    }
		},
		checkDate : function(obj, dateFormat) {
		    if (obj.value) {
		        var value = obj.value;
		        if ('yy' == dateFormat){
		        	if (value.match(/^(\d{4})$/)) {
		                var y = value;
		                if (isNaN(y)){
		                    return false;
		                }
		            }else {
		                return false;
		            }
		        }else if ('yy-mm' == dateFormat) {
		            
		            if (value.match(/^(\d{4})-(\d{1,2})$/) || value.match(/^(\d{5,6})$/)) {
		                if (value.match(/^(\d{5,6})$/)) {
		                    value = value.substring(0, 4) + "-" + value.substring(4, value.length);
		                }
		            	var temp = value.split("-");
		            	var y = temp[0];
		                var m = temp[1];
		                if (m.length == 2 && m.substring(0,1) == '0') {
		                    m = m.substring(1);
		                }
		                if (isNaN(y) || isNaN(m)) {
		                    return false;
		                }
		                if (parseInt(m) <= 12) {
		                    if (m.length == 1) {
		                        m = "0" + m;
		                    }
		                    obj.value = y + "-" + m;
		                    return true;
		                } else {
		                	return false;
		                }
		            }  else {
		                return false;
		            }
		        } else {//其他就认为是yy-mm-dd的形式
		            if (value.match(/^(\d{4})-(\d{1,2})-(\d{1,2})$/) || 
		                value.match(/^(\d{8})$/)) {
		                var stdValue;
		                if (value.match(/^(\d{8})$/)) {
		                    value = value.substring(0,4) + "-" + value.substring(4,6) + "-" + value.substring(6,8);
		                    stdValue = value;
		                }
		                var temp = value.split("-");
		                var y = temp[0];
		                var m = temp[1];
		                var d = temp[2];
		                if (m.length == 2 && m.substring(0,1) == '0') {
		                    m = m.substring(1);
		                }
		                if (d.length == 2 && d.substring(0,1) == '0') {
		                    d = d.substring(1);
		                }
		                var yi = parseInt(y);
		                var mi = parseInt(m);
		                var di = parseInt(d);
		       
		                if (m.length == 1) {
		                    m = '0' + m;
		                }
		                if (d.length == 1) {
		                    d = '0' + d;
		                }
                        stdValue = y + "-" + m + "-" + d;
                        
		                if (isNaN(yi) || isNaN(mi) || isNaN(di)) {
		                    return false;
		                }
		                var flag;
		                if (mi == 1 || mi == 3 || mi == 5 || mi == 7 || mi == 8 || mi == 10 || mi == 12) {
		                    if (di > 31) {
		                        flag = false;
		                    } else {
		                        flag = true;
		                    }
		                } else if (mi == 4 || mi == 6 || mi == 9 || mi == 11) {
		                    if (di > 30) {
		                        flag = false;
		                    } else {
		                        flag = true;
		                    }
		                } else if (mi == 2) {
		                    if (yi%400 == 0 || (yi%100 != 0 && yi%4 == 0)) {
		                        if (di > 29) {
		                            flag = false;
		                        } else {
		                            flag = true;
		                        }
		                    } else {
		                    	if (di > 28) {
		                            flag =  false;
		                        } else {
		                            flag = true;
		                        }
		                    }
		                }
		                if (flag === true) {
		                   obj.value = stdValue;
		                }
		                return flag;
		            } else {
		            
		                return false;
		            }
		        }
		    }
		    return true;
		},
	    timestamp2string : function(timestamp) {
			if (!timestamp) {
			    return '';
			}
			var date = timestamp["date"];
			var day = timestamp["day"];
			var hours = timestamp["hours"];
			var minutes = timestamp["minutes"];
			var month = timestamp["month"];
			var seconds = timestamp["seconds"];
			var year = timestamp["year"];
			var nanos = timestamp["nanos"];
			
			return (parseInt(year,10) + 1900)+ '-' + (parseInt(month) + 1) + '-' + date
			        + ' ' + hours + ':' + minutes + ':' + seconds;
		},
		exportExcel : function(jgridId) {
			jQuery("#exportExcelForm").remove();
			jQuery('body').append('<form name="exportExcelForm" id="exportExcelForm"></form>');
			
			var ids = AppUtils.getGridCheckedIds(jgridId);
			jQuery("#exportExcelForm").append('<input type="hidden" name="app_exportIds" value="' + ids + '">');
			
			var gridParam = jQuery("#" + jgridId).getGridParam();

			//表头和字段信息
			var colNameArray = String(gridParam.colNames).split(",");
			var colModel = gridParam.colModel;
			for (var i = 0; i < colModel.length; i++) {
				if (colModel[i].name == 'rn' || colModel[i].name == 'cb' || colModel[i].name == 'undefined' || !colModel[i].name) {
					continue;
				}
				jQuery("#exportExcelForm").append('<input type="hidden" name="app_exportHeaderName" value="' + colNameArray[i] + '">');
				jQuery("#exportExcelForm").append('<input type="hidden" name="app_exportColumnName" value="' + colModel[i].name + '">');
			}

			//查询参数
			var postData = jQuery.isFunction(gridParam.serializeGridData)? gridParam.serializeGridData.call(ts,ts.p.postData) : gridParam.postData;
			for (var i in postData) {
				if (i == "page") {
					jQuery("#exportExcelForm").append('<input type="hidden" name="' + i + '" value="' + 0 + '">');
				} else if (i == "rows") {
					jQuery("#exportExcelForm").append('<input type="hidden" name="' + i + '" value="' + 10000000 + '">');
				} else {
					if (postData[i] !== undefined) {
						var postStr = postData[i];
						if (typeof postStr == "string") {
							postStr = postStr.replace(/'/g, "\"");
						}
						jQuery("#exportExcelForm").append('<input type=\'hidden\' name=\'' + i + '\' value=\'' + postStr + '\'>');
					}
				}
			}
			
			//导出标记
			jQuery("#exportExcelForm").append('<input type="hidden" name="app_exportDataType" value="excel">');
			
			document.exportExcelForm.action = gridParam.url;
			document.exportExcelForm.target = '_top';
			document.exportExcelForm.method = 'post';
			document.exportExcelForm.submit();

		},
		//tableArray 的格式为List<List<TableCell>> 其中TableCell元素有3个属性 为 cellValue， cellValue， colSpan
		exportTable : function(tableArray) {
			if (!document.getElementById("app_export_table_div")) {
				jQuery('body').append('<div id="app_export_table_div" style="display:none"><form name="app_export_table_form" method="post" target="_top"><input type="hidden" name="tableArrayData"></form></div>');
			}
			var tableArrayData = "";
			for (var i = 0; i < tableArray.length; i++) {
				var tableInner1Array = tableArray[i];
				for (var j = 0; j < tableInner1Array.length; j++) {
					
					tableArrayData += tableInner1Array[j].cellValue + "$" + tableInner1Array[j].rowSpan + "$" + tableInner1Array[j].colSpan;
					
					if (j != tableInner1Array.length - 1) {
						tableArrayData += "#";
					}
				}
				if (i != tableArray.length - 1) {
					tableArrayData += "@";
				}
			}
			document.app_export_table_form.tableArrayData.value = tableArrayData;
			alert(tableArrayData);
			document.app_export_table_form.action =contextPath + "/excelUtils/exportTable.do";
			document.app_export_table_form.submit();
		},
		blockUI : function(option) {
			jQuery.blockUI(option); 
		},
			 /*  改用新的
		AlertBox : function(msg,type,confirmEvent, concelEvent){
			
			var option = {
					'keyboard' : true,
					'animation_speed' : 250,
					'overlay_close' : false,
					'title': "提示"
					};
			option.type = type;
			if(type=="question"){
				option.buttons = ["确定","取消"];
			}else{
				option.buttons = ["确定"];
			}
			option.onClose = function(option) {
				if ("确定" == option && confirmEvent) {
					confirmEvent();
				} else if ("取消" == option && concelEvent) {
					concelEvent();
				}
			};
			$.Zebra_Dialog(msg.toString(), option);
		},  */
		/**
		 * 
		 * @param {Object} msg  提示信息
		 * @param {Object} option   {'确定':function(){},'取消'：function(){}}
		 */
		AlertBox : function(msg,option){
			var tipId = 'alert_tip_div'+new Date().getTime();
			if(jQuery('#'+tipId).length<=0){
				jQuery('<div title="提示信息"></div>').attr({'id':tipId,style:'display:none;'}).appendTo('body');
			}
			var newOption = {};
			if(option){
				for(var item in option){
					newOption[item]=function(event){
						if(typeof option[jQuery(event.target).text()] == 'function')
						   option[jQuery(event.target).text()]();//执行
						jQuery("#"+tipId).dialog( "close" );
						jQuery('#'+tipId).remove();
					};
				}
			}else{
				newOption['确定']=function(){
					jQuery("#"+tipId).dialog( "close" );
					jQuery('#'+tipId).remove();
				}
			}
			
			jQuery("#"+tipId).html(msg).dialog({
					   modal: true,
					   buttons: newOption
			});
			
			jQuery('#ui-dialog-title-'+tipId).next().hide();
			return jQuery("#"+tipId);
		},
		//jqgrid设置信息，加入了从cookie中获取用户设置信息的功能
		gridSetting: function(options) {
			options = jQuery.extend({}, _defaultGridOption, options || {});
			if(options.url) {
				//用户自定义的设置信息
				var userSetting = AppUtils.getGridUserSetting(options.url);
				options = jQuery.extend(true, options, userSetting);
			}
			//每次请求前保存一下配置信息
			var beforeRequestFunc = options.beforeRequest;
			options.beforeRequest = function() {
				if(typeof beforeRequestFunc == 'function') {
					beforeRequestFunc.call(this);
				}
				AppUtils.saveGridSetting2Cookie(this);
			};
			return options;
		},
		//保存jqGrid的部分信息到cookie中，下次读取的时候将用到
		saveGridSetting2Cookie: function(jqGridObj) {
			jqGridObj = jQuery(jqGridObj);
			var rowNum = jqGridObj.jqGrid('getGridParam', 'rowNum');
			if(typeof rowNum == 'object' && rowNum.rowNum) {
				rowNum = rowNum.rowNum;
			}
			var gridSetting = {
				//排序字段
				scol: jqGridObj.jqGrid('getGridParam', 'sortname'),
				//排序方向
				sord: jqGridObj.jqGrid('getGridParam', 'sortorder'),
				//每页显示多少
				rows: rowNum
			};
			var gridNameInCookie = window.location.pathname + jqGridObj.jqGrid('getGridParam', 'url');
			var existGridSettings = jQuery.cookie('grid-user-setting');
			if(!existGridSettings) {
				existGridSettings = {};
			}else{
				existGridSettings = eval('('+ existGridSettings +')');
			}
			existGridSettings[encodeURIComponent(gridNameInCookie)] = gridSetting;
			//365天后过期
			jQuery.cookie('grid-user-setting', JSON2.stringify(existGridSettings), { expires: 365 });
		},
		//从cookie中读取jqGrid的配置信息
		getGridUserSetting: function(url) {
			var gridNameInCookie = window.location.pathname + url;
			var existGridSettings = jQuery.cookie('grid-user-setting');
			if(existGridSettings) {
				existGridSettings = eval('('+ existGridSettings +')');
				var oneGridSetting = existGridSettings[encodeURIComponent(gridNameInCookie)];
				if(oneGridSetting) {
					if(typeof oneGridSetting.rows == 'object') {
						return {
							sortname: oneGridSetting.scol,
							sortorder: oneGridSetting.sord
						};
					}
					return {
						sortname: oneGridSetting.scol,
						sortorder: oneGridSetting.sord,
						rowNum: oneGridSetting.rows
					};
				}
			}
			return {};
		}
	};
}();