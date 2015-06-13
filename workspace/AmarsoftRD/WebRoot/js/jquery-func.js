(function($) {
	$.fn.slide = function(settings){
		var _link = $(this);
		var _parent = _link.parent();
		var _slide_selector = settings.slide_selector;
		var _auto = settings.auto || false;
		var _time = settings.time || 100;
		
		var _index = 0;
		var _max_index = $(this).length;
		var _interval;
		
		_link.click(function(){
			_index = _link.parent().find('a').index(this);
			
			if( _auto ) {
				_clear_interval();
				_set_interval();
			}
			
			_set_index();
	
			return false;
		});
		
		function _set_index(){
			_link.removeClass('active');
			_link.eq(_index).addClass('active');
			
			
			$(_slide_selector).hide();
			$(_slide_selector).eq(_index).fadeIn();
			
			
		}
		
		function _set_interval() {
			_interval = window.setInterval(_next, _time);
		}
		
		function _clear_interval(){
			window.clearInterval(_interval);
		}
		
		function _next(){
			_index++;
			if( _index == _max_index ) {
				_index = 0;
			}
			
			_set_index();
		}
		
		_set_index();
		
		if( _auto ) {
			_set_interval();
		}
	}
})(jQuery);

$( document ).ready( function(){
	$('.blink')
		.focus(function(){
			if( $(this).attr('value') == $(this).attr('title') ) {
				$(this).attr({ 'value': '' });
			}
		})
		.blur(function(){
			if( $(this).attr('value') == '' || typeof($(this).attr('value')) == 'undefined') {
				$(this).attr({ 'value': $(this).attr('title') })
			}
		});
		
	$('#slider-holder ul').jcarousel({
		scroll: 1,
		size:	5,
		visible: 1,
		wrap: 'both',
		initCallback: _init_carousel,
		buttonNextHTML: null,
		buttonPrevHTML: null
	});
	
	$('.tabs a').slide({
		'slide_selector' : '.tab-content'
	})
});
function _init_carousel(carousel) {
	$('#slider-nav .next').bind('click', function() {
		carousel.next();
		return false;
	});
	
	$('#slider-nav .prev').bind('click', function() {
		carousel.prev();
		return false;
	});
};