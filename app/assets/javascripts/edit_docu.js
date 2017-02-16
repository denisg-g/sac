$(document).ready(function(){
	$('#number').change(function (e) {
		var date = new Date();
		var mSec = date.getTime();
		var max = $("#number").val();
		
		$("#pro").find("*").remove();
		for (var  i=0; i <  max -1 ;  i++) {
			row = document.createElement("div");
			row.setAttribute("class","row");
			fil = document.createElement("div");
			fil.setAttribute("class","field col-md-3");
			la = document.createElement("label");
			la.innerHTML = "Nombre";
			tf = document.createElement("INPUT");
			tf.setAttribute("class","form-control");

			row.appendChild(fil);
			fil.appendChild(la);
			fil.appendChild(tf);
			document.getElementById("pro").appendChild(row);
		}
	});
	$("#save").on("click", function() {
    $("form").submit(); // we'll have to define the form to submit
});
});

