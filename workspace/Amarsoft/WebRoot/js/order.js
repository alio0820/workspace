var orderjs = function(){
	return{
		start:function(){
			
		},
		init:function(){
			$("span.member input:checkbox").click(function(e){$(this).parent().parent().trigger('click');e.stopPropagation();});
			$('p.radio').click(function(){
				$(this).find('input').attr('checked',true);
			});
			$('p.radio').hover(function(){
				$(this).find('label:last').show();
			},function(){
				$(this).find('label:last').hide();
			});
			$('p.check').click(function(){
				if($(this).find('input').attr('checked')){
					$(this).find('input').attr('checked',false);
				}else{
					$(this).find('input').attr('checked',true);
				}
			});
			$('span.member').click(function(){
				var _this = this;
				var checkbox = $(this).find('input');			
				var memberId = $(checkbox).attr('name');
				dwr.engine.setAsync(false);
				if($(checkbox).filter('input:checked').length){
					$(checkbox).attr('checked',false);
					alert("confirmcancel");
					OrderAction.confirmCancel(memberId,function(data){
						showConfirmTip(data,_this);
					});
				}else{
					$(checkbox).attr('checked',true);
					alert("confirm");
					OrderAction.confirm(memberId,function(data){
						showConfirmTip(data,_this);
					});
				}
				dwr.engine.setAsync(true);
			});
			$('div.s-pk-col').attr("tabindex",0);//div默认没有keydown事件，可以通过为其添加tabindex，使其能够获得焦点，从而拥有keydown事件
			$('div.s-pk-col').keydown(function(event){
				if(event.keyCode=='13')
					$('div.pk-submit span:visible').trigger('click');
			});		
			$('span#buttonSubmit').click(function(){
				var userId = $('span#userId').html();
				var price = $("input[type='radio']:checked").val();
				var addRice= $("input[type='checkbox']:checked").length;
				var param = 'userId='+userId+'&price='+price+"&addRice="+addRice;
				if(price==null) {alert('请选择套餐类型');return false;}
				OrderAction.mealOrder(userId,price,addRice,showOrderTip);
			});
			$('span#buttonCancel').click(function(){
				var userId = $('span#userId').html();
				OrderAction.mealOrderCancel(userId,showOrderTip);
			});
			$(document).keydown(function(event){
				if(event.keyCode=='37')
					$('div#slider-nav a.prev').trigger('click');
				else if(event.keyCode=='39')
					$('div#slider-nav a.next').trigger('click');
			});
//			$('div.today').click(function(){
//				$('div.content').hide();
//				$('div#content1').show();
//			});
//			$('div.tomorow').click(function(){
//				$('div.content').hide();
//				$('div#content2').show();
//			});
//			$('div.record').click(function(){
//				$('div.content').hide();
//				$('div#content3').show();
//			});
		
	}
	};
	function showOrderTip(data){
		$('span.orderStatus').hide();		
		if(data=='success'){
			$('span#orderSuccess').show();
			$('span.nui-btn-text').hide();
			$('span#buttonCancel').show();
		}
		else if(data=='already'){
			$('span#orderAlready').show();
			$('span.nui-btn-text').hide();
			$('span#buttonCancel').show();
		}
		else if(data='cancel'){
			$('span#orderCancel').show();
			$('span.nui-btn-text').hide();
			$('span#buttonSubmit').show();
		}
		else{
			$('span#orderFailure').show();
		}
	}
	function showConfirmTip(data,_this){
		var label = $(_this).find('label.confirm_label');
		if(data=='confirm'){
			$(label).css('color','#5FB44C');
			$(label).html('已确认');
			$(label).show();
		}
		else if(data=='cancel'){
			$(label).css('color','#999999');
			$(label).html('未确认');
			$(label).show();
		}
		else if(data=='noOrder'){
			$(_this).find('input').attr('checked',false);
			$(label).css('color','#999999');
			$(label).html('尚无订单');
			$(label).show();
		}
		else{
			$(_this).find('input').attr('checked',false);
			$(label).css('color','red');
			$(label).html('...');
			$(label).show();
		}
	}
}();
$(document).ready(orderjs.init);