$(document).ready(function(){
  
  // Hide not required fields depending on vehicle type
  	$('#order_status_id').bind('change', function(){
  		var selector = $(this).val();
  		switch (selector) {
  			case '4':
  			$('.attachment, #order_clip').show();
  			break;
  			default:
  			$('.attachment, #order_clip').hide();
  		}
  	});
  // end of script to hide fields
  	
});