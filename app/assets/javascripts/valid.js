var email = new RegExp(/^([a-zA-Z0-9ñÑ_\-\.]+)@((\[[0-9]{1,20}\.[0-9]{1,20}\.[0-9]{1,20}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,10}|[0-9]{1,10})(\]?)*$/)

//termina de definir expresion regular de solo letras
function justNumbers(e)
        {
        var keynum = window.event ? window.event.keyCode : e.which;
        if ((keynum == 8) || (keynum == 46))
        return true;

        return /(\d)/.test(String.fromCharCode(keynum));
        }

function validastudent() {
  if ($('#carnet').val().length < 2) {
      // Si no se cumple la condicion...
      $("#carnet").focus().after("<span class='error'>Ingrese el carnet </span>");
      $(".error").delay(3200).fadeOut(300);
      return false;
    }
    if ($('#nombre').val().length < 4) {
      // Si no se cumple la condicion...
      //alert('[ERROR] Debe ingresar un nombre');
      $("#nombre").focus().after("<span class='error'>Ingrese el nombre </span>");
      $(".error").delay(3200).fadeOut(300);
      return false;
    }
    if ($('#nombre1').val().length < 4) {
     // Si no se cumple la condicion...
     $(".error").delay(3200).fadeOut(300);
     $("#nombre1").focus().after("<span class='error'>Ingrese el nombre </span>");
      return false;
   }
   if ($('#email').val().length < 4) {
     // Si no se cumple la condicion...
     $(".error").delay(3200).fadeOut(300);
     $("#email").focus().after("<span class='error'>Ingrese el email </span>");
    return false;
  }
     if (!($('#email').val().match(email)) ){
    $("#email").focus().after("<span class='error'>Formato Incorrecto</span>");
    $(".error").delay(3200).fadeOut(300);
      return false;
   }


   // Si el script ha llegado a este punto, todas las condiciones
   // se han cumplido, por lo que se devuelve el valor true
   $("#new_student").submit();
}


function valida_teacher() {
  if ($('#teacher_name').val().length < 4) {
      // Si no se cumple la condicion...
      $("#teacher_name").focus().after("<span class='error'>Ingrese el nombre</span>");
      $(".error").delay(3200).fadeOut(300);
      return false;
    }
    if ($('#teacher_name1').val().length < 4) {
      // Si no se cumple la condicion...
      //alert('[ERROR] Debe ingresar un nombre');
      $("#teacher_name1").focus().after("<span style='right:-100px;' class='error'>Ingrese el nombre </span>");
      $(".error").delay(3200).fadeOut(300);
      return false;
    }
    if ($('#teacher_lastname').val().length < 4) {
     // Si no se cumple la condicion...
     $("#teacher_lastname").focus().after("<span style='right:-30px;' class='error'>Ingrese el Apellido </span>");
     $(".error").delay(3200).fadeOut(300);
      return false;
   }
   if ($('#teacher_lastname1').val().length < 4) {
     // Si no se cumple la condicion...
     $("#teacher_lastname1").focus().after("<span style='right:-30px;' class='error'>Ingrese el Apellido </span>");
     $(".error").delay(3200).fadeOut(300);
    return false;
  }
  if ($('#teacher_cedula').val().length < 16) {
     // Si no se cumple la condicion...
     $("#teacher_cedula").focus().after("<span style='right:-100px;' class='error'>Ingrese numero de cédula </span>");
     $(".error").delay(3200).fadeOut(300);
     return false;
  }
     if (!($('#teacher_email').val().match(email)) ){
    $("#teacher_email").focus().after("<span class='error'>Formato de correo incorrecto</span>");
    $(".error").delay(3200).fadeOut(300);
      return false;
   }
   if ($('#teacher_direction').val().length < 20) {
     // Si no se cumple la condicion...
     $("#teacher_direction").focus().after("<span style='right:-30px;' class='error'>Ingrese la dirección </span>");
     $(".error").delay(3200).fadeOut(300);
     return false;
  }
  if ($('.telefonos_teacher').val().length < 8) {
     // Si no se cumple la condicion...
     $(".boton_tele").after("<span class='error'>Ingrese telefonos </span>");
     $(".error").delay(3200).fadeOut(300);
     return false;
  }

   // Si el script ha llegado a este punto, todas las condiciones
   // se han cumplido, por lo que se devuelve el valor true
   $("#new_teacher").submit();
}
