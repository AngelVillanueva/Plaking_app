$(document).ready(function(){
  // Hide not required fields depending on vehicle type
  	$('#quote_vehicle').bind('change', function(){
  		var selector = $(this).val();
  		switch (selector) {
  			case "Ciclomotor":
  			$('#engine, #cyls').hide();
  			break;
  			case "Motocicleta":
  			$('#engine').show();
  			$('#cyls').hide();
  			break;
  			default:
  			$('#engine, #cyls').show();
  		}
  	});
});