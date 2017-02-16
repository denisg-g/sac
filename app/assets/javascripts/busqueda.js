function buscarPorTutor(){
   $("#boton_buscar").click(function(){
     var tutor = $("#tutor").val();
     $.ajax({
        url: "/tutors/buscar_por_tutor/" + tutor,
        dataType: "JSON",
        timeout: 3000,
        beforeSend: function(){
           $("#student_tutor_ids").html("<option>Cargando...</option>");
        },
        error: function(){
           $("#student_tutor_ids").html("<option>Error al intentar buscar el tutor.</option>");
        },
        success: function(res){
          if(res){
            $("#student_tutor_ids").html("<option>Tutor</option>");
            for(var i =0;i < res.length-1;i++)
            {
              var item = res[i];
              $("#student_tutor_ids").append("<option value='"+item.id+"'>"+item.first+" "+item.second+" "+item.apellido+" "+item.apellido1+"</option>");

            }
           }else{
              $("#student_tutor_ids").html("<option>No se encuentra el tutor. </option>");
           }
        }
     })
  });
};
$(document).ready(function(){
   buscarPorTutor();
   buscarPorStudent();
 });
 
function eliminaDiv(that) {
    $(that).closest('#paced').animate({
      "right": "300px"
    }, 2000, "swing");
    $(that).closest("#paced").remove();
    return false;
}
function buscarPorStudent(){
   $("#buscarstudent").click(function(){
     var student = $("#student").val();
     $.ajax({
        url: "/students/buscar_por_student/" + student,
        dataType: "JSON",
        timeout: 3000,
        beforeSend: function(){
           $("#studinfo").html("<p>Cargando...</p>");
        },
        error: function(){
           $("#studinfo").html("<p>Error al intentar buscar el estudiante.</p>");
        },
        success: function(res){
          if(res){
            $("#studinfo").html("<p>Estudiante</p>");
            for(var i =0;i < res.length-1;i++)
            {
              var item = res[i];
              var div = document.createElement("div");
              var form = document.createElement("form");
              form.setAttribute("class","edit_student");
              form.setAttribute("id","edit_student_"+item.id);
              form.setAttribute("enctype","multipart/form-data");
              form.setAttribute("action","/students/"+item.id);
              form.setAttribute("style","background-color:#fff;");
              form.setAttribute("accept-charset","utf8");
              form.setAttribute("method","PATCH");
              var hid = document.createElement("input");
              hid.setAttribute("name","utf8");
              hid.setAttribute("type","hidden");
              hid.setAttribute("value","✓");
              var pos = document.createElement("input");
              pos.setAttribute("type","hidden");
              pos.setAttribute("name","method");
              pos.setAttribute("value","patch");
              div.setAttribute("id","paced");
              div.setAttribute("class","panel panel-default");
              div.setAttribute("style","height:100px;");
              var nam = document.createElement("div");
              nam.setAttribute("class","panel-heading");
              nam.innerHTML = item.nombre +" "+ item.nombre1 +" "+ item.apellido +" "+ item.apellido1;
              var del = document.createElement("button");
              del.setAttribute("onClick","eliminaDiv(this);");
              del.setAttribute("style","position:relative;float:right;");
              var spn = document.createElement("span");
              spn.setAttribute("class","fa fa-times");
              spn.setAttribute("style","")
              var mail = document.createElement("input");
              mail.setAttribute("value",item.email);
              mail.setAttribute("class","form-control");
              mail.setAttribute("style","width:30%;float:left;");
              mail.setAttribute("name","student[email]");
              mail.setAttribute("id","student_email");
              var tel = document.createElement("input");
              tel.setAttribute("value",item.tel);
              tel.setAttribute("class","form-control");
              tel.setAttribute("style","width:30%;float:left;");
              tel.setAttribute("name","student[tel]");
              tel.setAttribute("id","student_tel");
              var id = document.createElement("input");
              id.setAttribute("id","iden");
              id.setAttribute("value",item.id);
              id.setAttribute("class","form-control hidden");
              id.setAttribute("style","width:30%;float:left;");
              var dir = document.createElement("input");
              dir.setAttribute("value",item.direction);
              dir.setAttribute("class","form-control");
              dir.setAttribute("style","width:30%;float:left;");
              dir.setAttribute("name","student[direction]");
              dir.setAttribute("id","student_direction");
              div.appendChild(nam);
              form.appendChild(hid);
              form.appendChild(pos);
              form.appendChild(mail);
              form.appendChild(dir);
              form.appendChild(tel);
              form.appendChild(spn);
              form.appendChild(id);
              div.appendChild(form);
              nam.appendChild(del);
              $("#studinfo").append(div);
              $("#studinfo").animate({left: '250px'});
              var id_st =document.createElement("input");
              id_st.setAttribute("value",item.id);
              id_st.setAttribute("name","register[student_id]");
              id_st.setAttribute("type","text");
              id_st.setAttribute("class","hidden");
              id_st.setAttribute("id","register_student_id");
              div.appendChild(id_st);

             }
           }else{
              $("#studinfo").html("<a>No se encuentra el tutor. </p>");
           }
        }
     })
  });
};
