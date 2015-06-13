$(document).ready(
		function(){
			$('select#hLocationCountryID').click(
					function(){
						$.get(
							'Figure 7-1'+this.value+'.xml',
							function($xml){
								//Make the XML query-able with jQuery
								$xml = $($xml);
								//get the ISO2 value,that's used for the file name of the flag.
								var $iso2 = $xml.find('hLocationCountryISO2').text();
								//Swap out the flag image
								$('img[alt=Country]').attr(
										'src',
										'../../../Images/Flags/'+$iso2.toLowerCase()+'.png'
										);
								//Remove all of the options
								$('select#hLocationStateID').empty();
								//Set the states...
								$xml.find('hLocationState').each(
										function(){
											$('select#hLocationStateID').append(
													"<option value='"+$(this).attr('hLocationStateID')+"'>"+$(this).text()+"</option>"
													);
										}
										);
								//Change the label 
								$('label[for=hLocationStateID]').text(
										$xml.find('hLocationStateLabel').text()+":"  
										);
							},
							'xml'
							);
					}
					);
			}
);
