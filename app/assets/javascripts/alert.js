$(document).ready(function(){
   if ($("#alert").text().length > 0) {
   	$("#alert").css({"right":"-2000px"}).animate({"right":"20px"}, "slow");
     $('#alert').show();
     setTimeout(function(){
     	$("#alert").animate({"margin-right": '+=200px'},'slow');
    	$('#alert').hide();
	}, 5000);
     
   }                                           
 });