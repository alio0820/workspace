var adjs = function(){
	var width = document.body.clientWidth;
	var height = document.body.clientHeight;
	var xad = Math.random()*width;
	var yad = Math.random()*height;
	var step = 1;
	var delay = 30; 
	var height = 0;
	var Hoffset = 0;
	var Woffset = 0;
	var yon = 0;
	var xon = 0;
	var pause = true;
	var interval;
	ad.style.top = yad;
	return{
		changead:function(){
			width = document.body.clientWidth;
			height = document.body.clientHeight;
			Hoffset = ad.offsetHeight;
			Woffset = ad.offsetWidth;
			ad.style.left = xad + document.body.scrollLeft;
			ad.style.top = yad + document.body.scrollTop;
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
		 	ad.visibility = "visible";
			interval = setInterval('adjs.changead()', delay);
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
adjs.start();