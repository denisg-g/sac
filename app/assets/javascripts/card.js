$(document).ready(function($) {

    $('.card__share > a').on('click', function(e){ 
        e.preventDefault() // prevent default action - hash doesn't appear in url
        $(this).parent().find( 'div' ).toggleClass( 'card__social--active' );
        $(this).toggleClass('share-expanded');
    });
  
});
$(function($) {
    $("#TutorBusca").change(function(e) {
    	var value = $("#TutorBusca").val();
	    $.ajax({ 
	    url: "/tutors/search", 
	    data: $("#TutorBusca").serialize(), 
	    dataType: 'json',
	    success: function (data) { 
	        $.each(data, function(index, element) {
	        	alert(element.name);
	            $('#selectionTut').append($('<option>', {
	                text: element.name
	            }));
	        });
	    }
		});
    });
});