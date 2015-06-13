$(document).ready(
		function(){
			$('img#pp').click(
					function(){
							$('div#ps111').load(
									'pup2.jsp',		//获取属性src的值
									function(){
										test();
									}
							);
							
					}
			);
		}
);