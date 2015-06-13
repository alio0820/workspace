window.addEventListener(
   'load',
function()
{
	document.getElementById('tmpSearch').addEventListener(
			'focus',
	function (){
		if(this.value == 'Search'){
			this.value = '';
		}
	},false
	);
	document.getElementById('tmpSearch').addEventListener(
		'blur',
		function(){
		if(!this.value){
			this.value = 'Search';
		}
	},false
	);
},false
);