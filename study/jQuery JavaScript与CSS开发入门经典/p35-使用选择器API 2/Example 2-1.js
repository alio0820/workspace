var tmpExample = {
		ready : function() {
			$('input#tmpDialogueOpen').click(
					function($e) {
						$e.preventDefault();
						$('div#tmpDialogue').addClass('tmpDialogueOn');
					}
			);
			$('input#tmpDialogueClose').click(
					function($e) {
						$e.preventDefault();
						$('div#tmpDialogue').removeClass('tmpDialogueOn');
					}
			);
		}
};
$(document).ready(tmpExample.ready);