var tmpExample= {
	ready : function() {
	   
	   $('ul#tmpFavorites li a').click(
	        function($e) {
	            $e? $e.preventDefault():(window.event.returnValue=false);
	
	            window.open(this.href,'FavoriteLink','');
            }
	   );
    }
};
$(document).ready(tmpExample.ready);