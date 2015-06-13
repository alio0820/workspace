function validateEmail(email) { 
  var re = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i 
  return email.match(re)
}

$(document).ready(function() {
	$("#reserve_form").submit(function() {
		var email_val = $("#reserve_email").val();
		if (validateEmail(email_val)) {
  	  $("#reserve_status").removeClass("wimm-reserve-status-error").addClass("wimm-reserve-status").html("Submitting...");
  		$.post("reserve_wimm_one.json", { email: email_val }, function(response) {
  		  if (response.result == "invalid" || response.result == "error") {
  		    $("#reserve_status").removeClass("wimm-reserve-status").addClass("wimm-reserve-status-error");
  		  };
    	  $("#reserve_status").html(response.message);
  		});
  	} else {
  	  $("#reserve_status").removeClass("wimm-reserve-status").addClass("wimm-reserve-status-error").html("Invalid Email Address.");
  	};
		return false;
	});
});
