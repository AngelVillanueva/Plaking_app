$(document).ready(function(){
  
  // Hide not required fields depending on owner type
  	$('#order_owner').bind('change', function(){
  		var selector = $(this).val();
  		switch (selector) {
  			case "Personal":
  			$('#company_data').hide();
  			break;
  			case "Business":
  			$('#company_data').show();
  			break;
  			default:
  			$('#company_data').show();
  		}
  	});
  // end of script to hide fields
  
  // just in case of rendering the form with errors and Personal type
  if($('#order_owner').val() == 'Personal') {
    $('#company_data').hide();
  }
  	
});