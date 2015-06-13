window.onload = function()
{
	document.getElementById('tmpSearch').onfocus = function(){
		if(this.value == 'Search'){
			this.value = '';
		}
	};
	document.getElementById('tmpSearch').onblur = function(){
		if(!this.value){
			this.value = 'Search';
		}
	};
};