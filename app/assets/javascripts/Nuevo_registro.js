function NuevoRegistro(){
	opc = $(".nav-tabs .active a");
	var elementos = $("#paced");
	var conveniancecount = $("div[class*='panel panel-default']").length;
	var sum = 0;
	var size = document.getElementById("paced");
	if (opc.text() == "Nuevo Ingreso") {
	var element = document.getElementById("stuCont");
	var child=document.getElementById("student");
	element.removeChild(child);
		datt1 = $('#new_register');
	  $.ajax({
			type: 'POST',
      dataType: "JSON",
			url: '/registers/nuevoIng',
			data: datt1.serialize(),
			beforeSend: function(xhr) {
				$("#target").html("<h3>Cargando(</h3>");
				},
			error: function() {
						$("#target").html("<h3>Algo salió mal :(</h3>");
				},
			success: function(res){
				 $("#target").html("<h3>Éxito</h3>");
				 location.href="http://localhost:3000/students/new";
				 flash="Matrícula creada con éxito";
			}
		})
	}
	else if (opc.text() == "Re-ingreso")
	{
		alert(opc.text() + conveniancecount);
		if (conveniancecount > 1 || conveniancecount == 0) {
			alert("Por favor Seleccione uno");
		}else{
			//patching student
			var sel = document.getElementById("selstus");
			var datt = $('.edit_student');
			datt.append(sel);
			var id =document.getElementById("iden").value;
			$.ajax({
					type : 'post',
	        url: '/students/actu/'+id,
	        dataType: "JSON",
					data: datt.serialize(),
					beforeSend: function(){
	           $("#target").html("<h3>Cargando...</h3>");
	        },
	        error: function() {
                $("#target").html("<h3>Algo salió mal :(</h3>");
            },
	        success: function(res){
						 $("#target").html("<h3>Éxito</h3>");
					}
	    })

			//posting document
			document.getElementById("register_colegio_precedencia").value = "Calasanz Reingreso";
			document.getElementById("register_repitente").value = "No";
			document.getElementById("register_pago").value = "true";
			datt1 = $('#new_register');
			$.ajax({
				type: 'post',
				url: '/registers/niewe',
				dataType: "JSON",
				data: datt1.serialize(),
				beforeSend: function() {
					$("#target").html("<h3>Cargando...</h3>");
				},
				error: function() {
							$("#target").html("<h3>Algo salió mal :(</h3>");
					},
				success: function(res){
					 $("#target").html("<h3>Éxito</h3>");
					 location.href="http://localhost:3000";
					 flash="Creado Con Exito";
				}
			})
		}
	}
};
