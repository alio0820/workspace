window.addEventListener(
   'load',
function()
{
	document.getElementById('tmpSearch').addEventListener(
			'focus',
	function ($e){
		this.className = 'tmpInputFocused';
	},false
	);
	document.getElementById('tmpSearch').addEventListener(
		'blur',
		function($e){
		 this.className = '';
	},false
	);
	document.getElementsByTagName('a')[0].addEventListener(
			'click',
			function($event){
				window.open(this.href, 'p2p', 'width=500, height=500');
				$event.preventDefault();
		},false
		);
},false
);