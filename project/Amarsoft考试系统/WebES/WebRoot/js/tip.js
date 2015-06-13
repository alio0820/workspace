var tip = (function(){
	var $tip,
		hideTimer;
	return {
		showFollowTip:function(event,msg){
			if(msg=='') return;
			var x = event.pageX+12;
			var y = event.pageY+2;
			if(x>window.availWidth) x = window.availWidth;
			if(y<0) y=0;
			$tip = $('.tip');
			if ($tip.length==0)
				$tip = $('<div class="tip">'+msg+'</div>').appendTo($('body'));
			else{
				$tip = $($tip[0]);
				$tip.html(msg);
			}
			$tip.css({left:x+'px',top:y+'px',opacity:0});
			$tip.show();
			clearTimeout(hideTimer);
			$tip.stop().animate({
				opacity: 1
			},200);
			hideTimer = setTimeout(function() {
				$tip.stop().animate({
					opacity: 0
				},500);
			}, 2000);
		},
		showPageTip:function(status,msg,width,time){
			if(msg==null||msg=='') msg = '提示';
			if(width==null||width=='') width = msg.length*14;
			var $tip = $('<div class="tip pageTip"><span class="tip-content">'+msg+'</span></div>').appendTo($('body'));
			$tip.css({'width':width,'margin-left':-width/2});
			if(status=='success') $tip.css('color','#212121');
			else if(status=='failure') $tip.css('color','#BB3115');
			else $tip.css('color','#666666');
			$tip.show();
			setTimeout(function(){$tip.fadeOut('slow',function(){$tip.remove();});},time?time:1000);
		},
		show:function(){
			var _arguments = [].slice.call(arguments, 1);
			if(arguments[0]=='page')
				this.showPageTip.apply(this,_arguments);
		}
	}
})();