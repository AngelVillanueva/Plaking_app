$(document).ready(function(){
  
  // Hide not required fields depending on owner type
  	$('#order_owner').bind('change', function(){
  		var selector = $(this).val();
  		switch (selector) {
  			case "Personal":
  			$('#company_data, span.rep').hide();
  			break;
  			case "Business":
  			$('#company_data, span.rep').show();
  			break;
  			default:
  			$('#company_data, span.rep').show();
  		}
  	});
  // end of script to hide fields
  
  // just in case of rendering the form with errors and Personal type
  if($('#order_owner').val() == 'Personal') {
    $('#company_data').hide();
  }
  	
});