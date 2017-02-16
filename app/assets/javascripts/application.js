// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

function remove_fieldss (link) {
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest('.fields').hide();
  $(link).closest('.fields').remove();
}
function addFields() {
	var date = new Date();
	var mSec = date.getTime();
	idAttributtipo =
           "tutor_tel_tutors_attributes_0_tipo".replace("0", mSec);
    nameAttributtipo =
           "tutor[tel_tutors_attributes][0][tipo]".replace("0", mSec);
    idAttributnumero =
           "tutor_tel_tutors_attributes_0_numero".replace("0", mSec);
    nameAttributnumero =
           "tutor[tel_tutors_attributes][0][numero]".replace("0", mSec);
    idAttributhiden =
           "tutor_tel_tutors_attributes_0_destroy".replace("0", mSec);
    nameAttributhiden =
           "tutor[tel_tutors_attributes][0][destroy]".replace("0", mSec);
    option = document.createElement("option");
    option1 = document.createElement("option");
    option2 = document.createElement("option");
    option3 = document.createElement("option");
    option.text = "Claro"
    option1.text = "Convencional"
    option2.text = "Cootel"
    option3.text = "Movistar"
    var div = document.createElement("div");
    div.setAttribute("class","fields col-md-3");
  	var inputtipo = document.createElement("SELECT");
    inputtipo.add(option);
    inputtipo.add(option1);
    inputtipo.add(option2);
    inputtipo.add(option3);
  	inputtipo.setAttribute("type", "text");
    inputtipo.setAttribute("id", idAttributtipo);
    inputtipo.setAttribute("name", nameAttributtipo);
    inputtipo.setAttribute("class", "form-control");
    div.appendChild(inputtipo);
    var inputnum = document.createElement("INPUT");
  	inputnum.setAttribute("type", "text");
    inputnum.setAttribute("id", idAttributnumero);
    inputnum.setAttribute("name", nameAttributnumero);
    inputnum.setAttribute("class", "form-control");
    div.appendChild(inputnum);
    var inputhiden = document.createElement("INPUT");
  	inputhiden.setAttribute("type", "hidden");
    inputhiden.setAttribute("id", idAttributhiden);
    inputhiden.setAttribute("name", nameAttributhiden);
    inputhiden.setAttribute("value", "0");
    div.appendChild(inputhiden);
    var linkdele = document.createElement("a");
    tn = document.createTextNode('Eliminar');
  	linkdele.appendChild(tn);
    linkdele.setAttribute("class","btn-default btn col-md-12")
    linkdele.setAttribute("onclick", "remove_fieldss(this)");
    linkdele.setAttribute("href", "javascript:;");
    div.appendChild(linkdele);
    document.getElementById("tel").appendChild(div);
    $("#addressHeader").show();
};
function addFields1() {
  var date = new Date();
  var mSec = date.getTime();
  idAttributtipo =
           "teachers_tel_teachers_attributes_0_tipo".replace("0", mSec);
    nameAttributtipo =
           "teachers[tel_teachers_attributes][0][tipo]".replace("0", mSec);
    idAttributnumero =
           "teachers_tel_teachers_attributes_0_numero".replace("0", mSec);
    nameAttributnumero =
           "teachers[tel_teachers_attributes][0][numero]".replace("0", mSec);
    idAttributhiden =
           "teachers_tel_teachers_attributes_0_destroy".replace("0", mSec);
    nameAttributhiden =
           "tutor[tel_tutors_attributes][0][destroy]".replace("0", mSec);
    option = document.createElement("option");
    option1 = document.createElement("option");
    option2 = document.createElement("option");
    option3 = document.createElement("option");
    option.text = "Claro"
    option1.text = "Convencional"
    option2.text = "Cootel"
    option3.text = "Movistar"
    var div = document.createElement("div");
    div.setAttribute("class","fields col-md-3");
    var inputtipo = document.createElement("SELECT");
    inputtipo.add(option);
    inputtipo.add(option1);
    inputtipo.add(option2);
    inputtipo.add(option3);
    inputtipo.setAttribute("type", "text");
    inputtipo.setAttribute("id", idAttributtipo);
    inputtipo.setAttribute("name", nameAttributtipo);
    inputtipo.setAttribute("class", "form-control");
    div.appendChild(inputtipo);
    var inputnum = document.createElement("INPUT");
    inputnum.setAttribute("type", "text");
    inputnum.setAttribute("id", idAttributnumero);
    inputnum.setAttribute("name", nameAttributnumero);
    inputnum.setAttribute("class", "form-control");
    div.appendChild(inputnum);
    var inputhiden = document.createElement("INPUT");
    inputhiden.setAttribute("type", "hidden");
    inputhiden.setAttribute("id", idAttributhiden);
    inputhiden.setAttribute("name", nameAttributhiden);
    inputhiden.setAttribute("value", "0");
    div.appendChild(inputhiden);
    var linkdele = document.createElement("a");
    tn = document.createTextNode('Eliminar');
    linkdele.appendChild(tn);
    linkdele.setAttribute("class","btn-default btn col-md-12")
    linkdele.setAttribute("onclick", "remove_fieldss(this)");
    linkdele.setAttribute("href", "javascript:;");
    div.appendChild(linkdele);
    document.getElementById("tel").appendChild(div);
    $("#addressHeader").show();
};
function remove_fieldss_sub (link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest('.field').hide();
		$(link).closest('.field').remove();
}
function addFields_sub(tel) {
    var date = new Date();
    var mSec = date.getTime();
    idAttributtipo =
           "subject_schedule_days_attributes_0_schedule_blocks_attributes_0_name".replace("0", mSec).replace("_0", "_"+mSec);
    nameAttributtipo =
           "subject[schedule_days_attributes][0][schedule_blocks_attributes][0][name]".replace("0", mSec).replace("[0", "["+mSec);
    idAttributhiden =
           "subject_schedule_days_attributes_0_schedule_blocks_attributes_0_destroy".replace("0", mSec).replace("_0", "_"+mSec);
    nameAttributhiden =
           "subject[schedule_days_attributes][0][schedule_blocks_attributes][0][_destroy]".replace("0", mSec).replace("[0", "["+mSec);
    option = document.createElement("option");
    option1 = document.createElement("option");
    option2 = document.createElement("option");
    option3 = document.createElement("option");
    option4 = document.createElement("option");
    option5 = document.createElement("option");
    option6 = document.createElement("option");
    option7 = document.createElement("option");
    option.text = "1";
    option1.text = "2";
    option2.text = "3";
    option3.text = "4";
    option4.text = "5";
    option5.text = "6";
    option6.text = "7";
    option7.text = "8";
    option.value = "1";
    option1.value = "2";
    option2.value = "3";
    option3.value = "4";
    option4.value = "5";
    option5.value = "6";
    option6.value = "7";
    option7.value = "8";
    var div = document.createElement("div");
    div.setAttribute("class","fields col-md-3");
    var inputtipo = document.createElement("SELECT");
    inputtipo.add(option);
    inputtipo.add(option1);
    inputtipo.add(option2);
    inputtipo.add(option3);
    inputtipo.add(option4);
    inputtipo.add(option5);
    inputtipo.add(option6);
    inputtipo.add(option7);
    inputtipo.setAttribute("id", idAttributtipo);
    inputtipo.setAttribute("name", nameAttributtipo);
    inputtipo.setAttribute("class", "form-control");
    div.appendChild(inputtipo);
    var inputhiden = document.createElement("INPUT");
    inputhiden.setAttribute("type", "hidden");
    inputhiden.setAttribute("id", idAttributhiden);
    inputhiden.setAttribute("name", nameAttributhiden);
    inputhiden.setAttribute("value", "0");
    div.appendChild(inputhiden);
    var linkdele = document.createElement("a");
    tn = document.createTextNode('Eliminar');
    linkdele.appendChild(tn);
    linkdele.setAttribute("class","btn-default btn col-md-12")
    linkdele.setAttribute("onclick", "remove_fieldss_sub(this)");
    linkdele.setAttribute("href", "javascript:;");
    div.appendChild(linkdele);
    tel.closest(".campos").appendChild(div);
    $("#addressHeader").show();
};
