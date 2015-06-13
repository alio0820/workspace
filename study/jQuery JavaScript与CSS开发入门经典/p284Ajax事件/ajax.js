$.ajaxSetup({//在Ajax请求发生时动态的将指示器显示出来，并在请求结束时将该指示器隐藏起来
	beforeSend:function(){
		$('div#hFinderActivity').show();
	},
	success:function(){
		$('div#hFinderActivity').hide();
	}
});
/*
 * Ajax请求的标志性事件如：当一个请求开始时，当一个请求结束时，当一个请求已经被发送时，当一个请求失败时，当一个请求
 * 已经完成或者完全执行成功时。
 */
