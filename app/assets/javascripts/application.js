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
//= require turbolinks
//= require_tree .
function remove_fields (link) {
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest('#lit').hide();
}
function remove_fieldss (link) {
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest('.fields').hide();
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
    var li = document.createElement("li");
    li.setAttribute("id","lit")
  	var inputtipo = document.createElement("INPUT");
  	inputtipo.setAttribute("type", "text");
    inputtipo.setAttribute("id", idAttributtipo);
    inputtipo.setAttribute("name", nameAttributtipo);
    li.appendChild(inputtipo);
    var inputnum = document.createElement("INPUT");
  	inputnum.setAttribute("type", "text");
    inputnum.setAttribute("id", idAttributnumero);
    inputnum.setAttribute("name", nameAttributnumero);
    li.appendChild(inputnum);
    var inputhiden = document.createElement("INPUT");
  	inputhiden.setAttribute("type", "hidden");
    inputhiden.setAttribute("id", idAttributhiden);
    inputhiden.setAttribute("name", nameAttributhiden);
    inputhiden.setAttribute("value", "0");
    li.appendChild(inputhiden);
    var linkdele = document.createElement("a");
    tn = document.createTextNode('borrar');
  	linkdele.appendChild(tn);
    linkdele.setAttribute("onclick", "remove_fields(this)");
    linkdele.setAttribute("data-turbolinks", false);
    linkdele.setAttribute("href", "javascript:void(0);");
    li.appendChild(linkdele);
    document.getElementById("myList").appendChild(li);
    $("#addressHeader").show(); 
};
    