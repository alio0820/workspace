var addressbookjs= function(){
	return {
		jstreeData:function(){
			var curMenu = null, zTree_Menu = null;
			var setting = {
				view: {
//					addHoverDom: addHoverDom,
//					removeHoverDom: removeHoverDom,
					selectedMulti: false,
					dblClickExpand: false
				},
//				edit: {
//					enable: true,
//					editNameSelectAll: true
//				},
				data: {
					simpleData: {
						enable: true
					}
				},
				callback: {
//					beforeDrag: beforeDrag,
//					beforeEditName: beforeEditName,
//					beforeRemove: beforeRemove,
//					beforeRename: beforeRename,
//					onRemove: onRemove,
//					onRename: onRename,
					
					beforeClick:this.beforeClick,
					onClick:this.onClick
				}
			};
			var zNodes =[
				{ id:1, pId:0, name:"我的家人"},
				{ id:11, pId:1, name:"子菜单 1-1"},
				{ id:111, pId:11, name:"叶子节点 1-1-1"},
				{ id:112, pId:11, name:"叶子节点 1-1-2"},
				{ id:113, pId:11, name:"叶子节点 1-1-3"},
				{ id:114, pId:11, name:"叶子节点 1-1-4"},
				{ id:12, pId:1, name:"子菜单 1-2"},
				{ id:121, pId:12, name:"叶子节点 1-2-1"},
				{ id:122, pId:12, name:"叶子节点 1-2-2"},
				{ id:123, pId:12, name:"叶子节点 1-2-3"},
				{ id:124, pId:12, name:"叶子节点 1-2-4"},
				{ id:2, pId:0, name:"我的同学", open:true},
				{ id:21, pId:2, name:"小学同学"},
				{ id:211, pId:21, name:"叶子节点 2-1-1"},
				{ id:212, pId:21, name:"叶子节点 2-1-2"},
				{ id:213, pId:21, name:"叶子节点 2-1-3"},
				{ id:214, pId:21, name:"叶子节点 2-1-4"},
				{ id:22, pId:2, name:"初中同学"},
				{ id:221, pId:22, name:"叶子节点 2-2-1"},
				{ id:222, pId:22, name:"叶子节点 2-2-2"},
				{ id:223, pId:22, name:"叶子节点 2-2-3"},
				{ id:224, pId:22, name:"叶子节点 2-2-4"},
				{ id:23, pId:2, name:"高中同学"},
				{ id:231, pId:23, name:"叶子节点 2-3-1"},
				{ id:232, pId:23, name:"叶子节点 2-3-2"},
				{ id:233, pId:23, name:"叶子节点 2-3-3"},
				{ id:234, pId:23, name:"叶子节点 2-3-4"},
				{ id:24, pId:2, name:"大学同学"},
				{ id:241, pId:24, name:"本专业"},
				{ id:242, pId:24, name:"本学院"},
				{ id:243, pId:24, name:"其他学院"},
				{ id:244, pId:24, name:"校外同学"},
				{ id:25, pId:2, name:"研究生同学"},
				{ id:251, pId:25, name:"叶子节点 2-2-1"},
				{ id:252, pId:25, name:"叶子节点 2-2-2"},
				{ id:253, pId:25, name:"叶子节点 2-2-3"},
				{ id:254, pId:25, name:"叶子节点 2-2-4"},
				{ id:3, pId:0, name:"我的同事"},
				{ id:31, pId:3, name:"子菜单 3-1"},
				{ id:311, pId:31, name:"叶子节点 3-1-1"},
				{ id:312, pId:31, name:"叶子节点 3-1-2"},
				{ id:313, pId:31, name:"叶子节点 3-1-3"},
				{ id:314, pId:31, name:"叶子节点 3-1-4"},
				{ id:32, pId:3, name:"子菜单 3-2"},
				{ id:321, pId:32, name:"叶子节点 3-2-1"},
				{ id:322, pId:32, name:"叶子节点 3-2-2"},
				{ id:323, pId:32, name:"叶子节点 3-2-3"},
				{ id:324, pId:32, name:"叶子节点 3-2-4"}			
			];

			function beforeClick(treeId, node) {
				if (node.isParent) {
					if (node.level === 0) {
						var pNode = curMenu;
						while (pNode && pNode.level !==0) {
							pNode = pNode.getParentNode();
						}
						if (pNode !== node) {
							var a = $("#" + pNode.tId + "_a");
							a.removeClass("cur");
							zTree_Menu.expandNode(pNode, false);
						}
						a = $("#" + node.tId + "_a");
						a.addClass("cur");

						var isOpen = false;
						for (var i=0,l=node.children.length; i<l; i++) {
							if(node.children[i].open) {
								isOpen = true;
								break;
							}
						}
						if (isOpen) {
							zTree_Menu.expandNode(node, true);
							curMenu = node;
						} else {
							zTree_Menu.expandNode(node.children[0].isParent?node.children[0]:node, true);
							curMenu = node.children[0];
						}
					} else {
						zTree_Menu.expandNode(node);
					}
				}
				return !node.isParent;
			}
			function onClick(e, treeId, node) {
				alert("Do what you want to do!");
			}
			//----------------------------------------------
			var log, className = "dark";
			function beforeDrag(treeId, treeNodes) {
				return false;
			}
			function beforeEditName(treeId, treeNode) {
				className = (className === "dark" ? "":"dark");
				showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.selectNode(treeNode);
				return confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？");
			}
			function beforeRemove(treeId, treeNode) {
				className = (className === "dark" ? "":"dark");
				showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.selectNode(treeNode);
				return confirm("确认删除分组 -- " + treeNode.name + " 吗？");
			}
			function onRemove(e, treeId, treeNode) {
				showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			}
			function beforeRename(treeId, treeNode, newName) {
				className = (className === "dark" ? "":"dark");
				showLog("[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
				if (newName.length == 0) {
					alert("节点名称不能为空.");
					var zTree = $.fn.zTree.getZTreeObj("treeDemo");
					setTimeout(function(){zTree.editName(treeNode);}, 10);
					return false;
				}
				return true;
			}
			function onRename(e, treeId, treeNode) {
				showLog("[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			}
			function showLog(str) {
				if (!log) log = $("#log");
				log.append("<li class='"+className+"'>"+str+"</li>");
				if(log.children("li").length > 8) {
					log.get(0).removeChild(log.children("li")[0]);
				}
			}
			function getTime() {
				var now= new Date(),
				h=now.getHours(),
				m=now.getMinutes(),
				s=now.getSeconds(),
				ms=now.getMilliseconds();
				return (h+":"+m+":"+s+ " " +ms);
			}

			var newCount = 1;
			function addHoverDom(treeId, treeNode) {
				var sObj = $("#" + treeNode.tId + "_span");
				if (treeNode.editNameFlag || $("#addBtn_"+treeNode.id).length>0) return;
				var addStr = "<button type='button' class='add' id='addBtn_" + treeNode.id
					+ "' title='add node' onfocus='this.blur();'></button>";
				sObj.append(addStr);
				var btn = $("#addBtn_"+treeNode.id);
				if (btn) btn.bind("click", function(){
					var zTree = $.fn.zTree.getZTreeObj("treeDemo");
					zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
					return false;
				});
			};
			function removeHoverDom(treeId, treeNode) {
				$("#addBtn_"+treeNode.id).unbind().remove();
			};
			function selectAll() {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
			}
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$("#selectAll").bind("click", selectAll);
			
		},
		jqgridData:function(){
			var _defaultGridOption = {
				datatype: "json",
				autowidth: false,
				shrinkToFit : false,
				rownumbers: true,
				viewrecords : true,
				mtype: "GET", 
				rowNum:50, 
				rowList:[10,20,30,50,100,500,1000],
				keyIndex : false, //使用jsonReader中设置的id作为主键
				multiselect: true,
				prmNames:{search:"search"},
				jsonReader : {
					root:"mylist",
					id : "id", //列表主键
					repeatitems : false,
					cell : null
				},
				gridComplete: function(){
					//$("#list4").setGridWidth($(window).width()-229);
				},
				loadComplete: function(){
					var pager = jQuery("#" + this.id).getGridParam().pager;
					var exportExcelBtnId = this.id + "_exportExcelBtn";
					
					if (!jQuery(pager).find("#" + exportExcelBtnId).attr("id")) {
						jQuery(this).navButtonAdd(pager,{id:exportExcelBtnId, caption:"导出",title:"导出EXCEL",buttonicon:"ui-icon-calculator",
							onClickButton:function(){
								//AppUtils.exportExcel(this.id);
							} 
						});
					}	
				}
			};
			jQuery("#list4").jqGrid(jQuery.extend(true,_defaultGridOption,{
				url :"addressbook.action",	
				height: $(window).height()-160,
				width:	$(window).width()-212,
			   	colNames:['序号','姓名', '性别', '生日','手机','家庭电话','工作单位','工作地址','职业', '职务', '毕业院校','任期','爱好','家庭地址','邮编', '单位电话', '传真','单位网站','电子邮箱','QQ','MSN'],
			   	colModel:[
			   		{name:'id',index:'id', width:30, sorttype:"int",sortable:true},
			   		{name:'name',index:'name', width:60},
			   		{name:'sex',index:'sex', width:30},
			   		{name:'birthday',index:'birthday', width:90, sorttype:"date"},
			   		{name:'cellphone',index:'cellphone', width:100},
			   		{name:'homephone',index:'homephone', width:100},
			   		{name:'companyName',index:'companyName', width:100},
			   		{name:'companyAddress',index:'companyAddress', width:100},
			   		{name:'profession',index:'profession', width:100},
			   		{name:'position',index:'position', width:100},
			   		{name:'graduateSchool',index:'graduateSchool', width:100},
			   		{name:'grade',index:'grade', width:60},
			   		{name:'hobby',index:'hobby', width:100},
			   		{name:'homeAddress',index:'homeAddress', width:100},
			   		{name:'postcode',index:'postcode', width:60},
			   		{name:'companyPhone',index:'companyPhone', width:100},
			   		{name:'fax',index:'fax', width:60},
			   		{name:'companyWebsite',index:'companyWebsite', width:100},
			   		{name:'email',index:'email', width:100},
			   		{name:'QQ',index:'QQ', width:85},
			   		{name:'MSN',index:'MSN', width:85}
			   	],
			   	pager:"#s4pager",
			   	caption: "Address Book List"
			})).navGrid("#s4pager",
				{view:false, add:false, edit:false, search:false, del:false, refreshtext:"刷新"},
				{},
				{},
				{},
				{}
			);
		},
		start:function(){
			var body = $(document);
			var height = $(window).height()-72;
			var width = $(window).width();
			width = width<212?"212":width;
			$('div.content_wrap').css("height",height);
			$('div.content_wrap').css("width",width);
			$('div.right').css('width',width-210);
			$('div.right').css("height",height);
			$(window).resize(function(){
				var width = $(window).width();
				var height = $(window).height();
				width = width-212>0?width:0;
				height = height-160>0?height:0;
				var clientHeight = document.documentElement.clientHeight;
				$('div.content_wrap').css("width",width);				
				$('div.content_wrap').css("height",height-72);
				$('div.right').css('width',width-210);
				$('div.right').css("height",height-72);
				$("#list4").setGridHeight(height-160);
				$("#list4").setGridWidth(width-212);
//				offsetHeight = document.body.offsetHeight;
//				alert("body:"+$(body).height()+"||||window:"+$(window).height()+"clientHeight:"+clientHeight+
//						"offsetHeight:"+document.body.offsetHeight+
//						"scrollHeight"+document.body.scrollHeight
//				);
//				var aa = height - offsetHeight;
//				alert(aa);
//				if(aa!=4){
//					$('div.content_wrap').css("height",height-72+aa);			
//					$("#list4").setGridHeight(height-157+aa);
//					alert(11);
//				}
			});
			
			//alert("body:"+$(body).height()+"||||window:"+$(window).height()+"clientWidth:"+clientWidth);
		}
	};
}();
$(document).ready(addressbookjs.start);