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
  if ($('#carnet').val().length < 8) {
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
