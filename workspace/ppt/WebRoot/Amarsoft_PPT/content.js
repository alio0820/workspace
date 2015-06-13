$(document).ready(function(){
	$(document).bind('keydown',function(e){
		if(e.keyCode==40){
			var currentObj = $('div.current').find('.hide:not(.show)').eq(0);
			currentObj.addClass('show');
//			if(!currentObj.hasClass('contentpart'))
//				writeContent(currentObj,true);
		}else if(e.keyCode==38){
			$('div.current').find('.show:last').removeClass('show');
		}
	});
	var tooltip1 = $('[rel="tooltip"],[data-rel="tooltip"]');
	$(tooltip1).tooltip({"placement":"bottom",delay: { show: 400, hide: 200 }});
	
	/**渐变背景*/
	$("#landing-slide h1").hover(function(){
		$(this).stop().animate({
			backgroundColor:"#FFA500"
		}, 1000);
	},function(){
		$(this).stop().animate({
			backgroundColor:"#EEEEF6"
		},600,function(){
			$(this).css('backgroundColor','');
		});
	});
	$('.contentpart .header').click(function(){
		$(this).next().slideToggle();
	});
});
/**js实现打字效果
var charIndex = -1;
var stringLength = 0;
var inputText;
function writeContent(obj,init){
    if(init){
    	inputText = $(obj).html();
    	$(obj).hide();
    	$(obj).html('');
    }
    if(charIndex==-1){
        charIndex = 0;
        stringLength = inputText.length;
    }
    var initString = inputText;
	initString = initString.replace(/<SPAN.*$/gi,"");
    
    var theChar = inputText.charAt(charIndex);
   	var nextFourChars = inputText.substr(charIndex,4);
   	if(nextFourChars=='<BR>' || nextFourChars=='<br>'){
   		theChar  = '<BR>';
   		charIndex+=3;
   	}
    initString = initString + theChar + "<SPAN id='blink'>_</SPAN>";
    $(obj).html(initString);

    charIndex = charIndex/1 +1;
    if(charIndex%2==1){
         document.getElementById('blink').style.display='none';
    }else{
         document.getElementById('blink').style.display='inline';
    }
    if(charIndex<=stringLength){
        setTimeout(function(){
        	writeContent(obj,false);
        },150);
    }else{
    	blinkSpan();
    }
    function setTime(){
    	
    }
}
var currentStyle = 'inline';
function blinkSpan(){
	if (currentStyle == 'inline') {
		currentStyle = 'none';
	} else {
		currentStyle = 'inline';
	}
	document.getElementById('blink').style.display = currentStyle;
	setTimeout('blinkSpan()', 500);
}*/