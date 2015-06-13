var zdialog = function (){
	return {
		init: function (){
			
		},
		notice : function(){							//公告
			$.dialog({
			    id: 'msg',
			    title: '公告',
			    content: '欢迎使用zdialog窗口!',
			    width: 200,
			    height: 100,
			    left: '100%',
			    top: '100%',
			    fixed: true,
			    drag: false,
			    resize: false
			});			
		},
		iframe : function(){							//iframe方式加载单独的内容页
			$.dialog({content: 'url:_demo/content/content.html'});
		},
		okAndcancel : function(){						//OK和cancel函数
			$.dialog({
			    content: '如果定义了回调函数才会出现相应的按钮',
			    ok: function(){
			        this.title('3秒后自动关闭').time(3);
			        return false;
			    },
			    cancelVal: '关闭',
			    cancel: true /*为true等价于function(){}*/
			});
		},
		nomaxAndmin : function(){							//禁止使用最大最小按钮
			$.dialog({
			    content: '不显示最大化和最小化按钮',
			    max: false,
			    min: false
			});
		},
		custombutton : function(){						//自定义按钮
			$.dialog({
			    id: 'testID',
			    content: 'hello world!',
			    button: [
			        {
			            name: '同意',
			            callback: function(){
			                this.content('你同意了')
			                .button({
			                    id:'disBtn',
			                    name:'我变成有效按钮了',
			                    disabled: false
			                });
			                return false;
			            },
			            focus: true
			        },
			        {
			            name: '不同意',
			            callback: function(){
			                alert('你不同意');
			            }
			        },
			        {
			            id: 'disBtn',
			            name: '无效按钮',
			            disabled: true
			        },
			        {
			            name: '关闭我'
			        }
			    ]
			});
		},
		setsize : function (){							//设置大小
			$.dialog({
			    width: '700px',
			    height: 500,
			    content: 'url:http://www.baidu.com'
			});
		},
		fixed : function(){								//相对屏幕固定
			$.dialog({
			    fixed: true,
			    content: '请拖动滚动条查看'
			});
		},
		locked : function(){							//锁屏
			$.dialog({
			    lock: true,
			    content: '中断用户在对话框以外的交互，展示重要操作与消息',
			    icon: 'error.gif',
			    ok: function () {
			        /* 这里要注意多层锁屏一定要加parent参数 */
			        $.dialog({content: '再来一个锁屏', lock: true, parent:this});
			        return false;
			    },
			    cancel: true
			});
		},
		nodrag : function(){							//禁止拖动和改变大小
			$.dialog({
			    drag: false,
			    resize: false,
			    content: '禁止拖拽'
			});
		},
		initAndclose : function(){						//打开和关闭之前自动调用的函数
			$.dialog({
			    content: '初始化函数执行前窗口的内容',
			    init: function(){
			        alert('正在执行初始化函数，此时你可看到窗口内容没有发生变化');
			        this.content('我是初始化函数执行后的窗口中的内容');
			    },
			    close: function(){
			        alert('我是窗口关闭前执行的函数，如果返回false将阻止窗口关闭');
			    }
			});
		},
		reload : function(){							//刷新主页面
			$.dialog({
			    content: '点确定按钮后将刷新窗口调用页面',
			    ok: function(){
			        this.reload();
			    }
			});
		},
		maxAndmin : function (){						//调用最大化，最小化
			$.dialog({
			    content: '我现在是最大化窗口，点确定按钮最小化窗口',
			    id: 'LHG78D',
			    ok: function(){
			        this.min(); /* 这里调用了最小化方法 */
			        return false;
			    }
			}).max();
		},
		dialogalert : function(){						//alert
			$.dialog.alert('您正在使用lhgDialog弹出窗口组件。',function(){
			    $.dialog.tips('谢谢您的使用！');
		});
		},
		dialogconfirm : function(){						//confirm
			$.dialog.confirm('你确定要删除这个消息吗？', function(){
			    $.dialog.tips('执行确定操作');
			}, function(){
			    $.dialog.tips('执行取消操作');
			});
		},
		dialogprompt : function (){						//prompt
			$.dialog.prompt('请输入图片网址',
				    function(val){
				        $.dialog.tips(val);
				    },
				    'http://'
				);
		},
		dialogtips : function (){						//提示
			/* 下面的只是演示代码，实际应用中一般这样写：
			 * $.dialog.tips('数据加载中...',600,'loading.gif');
			 * [这里是你要执行的代码]
			 * $.dialog.tips('数据加载完毕',1,'success.gif',function(){ 这里写完成后执行的其它代码 });
			 */
			$.dialog.tips('数据加载中...',600,'loading.gif');

			setTimeout(function(){
			    $.dialog.tips('数据加载完毕',1,'tips.gif',function(){alert('加载完成后你要做什么？');});
			}, 5000 );
		}
	};
	function other(){
		
	}
}();