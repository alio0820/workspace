var adjs = function(){
	var width = window.screen.availWidth;
	var height = window.screen.availHeight-50;
	var xad = Math.random()*width;
	var yad = Math.random()*height;
	var step = 1;
	var delay = 30; 
	var Hoffset = 0;
	var Woffset = 0;
	var yon = 0;
	var xon = 0;
	var pause = true;
	var interval;
	return{
		changead:function(){
			width = window.screen.availWidth;
			height = window.screen.availHeight-50;
			Hoffset = ad.offsetHeight;
			Woffset = ad.offsetWidth;
			$(ad).css('left',xad + document.body.scrollLeft);
			$(ad).css('top',yad + document.body.scrollTop);
			if (yon) 
				{yad = yad + step;}
			else 
				{yad = yad - step;}
			if (yad < 0) 
				{yon = 1;yad = 0;}
			if (yad >= (height - Hoffset)) 
				{yon = 0;yad = (height - Hoffset);}
			if (xon) 
				{xad = xad + step;}
			else 
				{xad = xad - step;}
			if (xad < 0) 
				{xon = 1;xad = 0;}
			if (xad >= (width - Woffset)) 
				{xon = 0;xad = (width - Woffset);}
		},
			
		start:function(){
			var ad = document.getElementById('ad');
			if(ad==null) return ;
			ad.style.top = yad;
		 	ad.style.visibility = "visible";
			interval = setInterval('adjs.changead()', delay);
			$(ad).hover(function(){
				adjs.pause_resume();
			},function(){
				adjs.pause_resume();
			});
		},
		pause_resume:function(){
			if(pause){
				clearInterval(interval);
				pause = false;
			}
			else{
				interval = setInterval('adjs.changead()',delay);
				pause = true;
			}
		},
	};
}();