$(document).ready(function(){
	$("#teacher_cedula").mask('000-000000-0000Z',{
			translation: {
				'Z': {
					pattern: /[A-Z]/,optional: true
				}
			}
		});
	$(".telefonos_teacher").mask('0000-0000');
});
function change_select_teacher() {
 	console.log("hola");
 	document.getElementById('teacher_cedula').value = "";
    if ( document.getElementById('teacher_tipo_id').value == 'Cedula'){
		$("#teacher_cedula").mask('000-000000-0000Z',{
			translation: {
				'Z': {
					pattern: /[A-Z]/,optional: true
				}
			}
		});
	}else {
		console.log("kpex");
		$("#teacher_cedula").mask('Z00000000',{
			translation: {
				'Z': {
					pattern: /[A-Z]/,optional: true
				}
			}
		});
	}
 };