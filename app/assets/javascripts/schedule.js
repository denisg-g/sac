$( function() {
  var drg;
    $( ".draggable" ).draggable({
      drag: function(event, ui){
        drg = $(this);
        //console.log(  drg.text() );
      },
    });
    $( "ul, li" ).disableSelection();
    $( ".droppable" ).droppable({
      classes: {
        "ui-droppable-active": "ui-state-active",
        "ui-droppable-hover": "ui-state-hover"
      },
      drop: function( event, ui ) {
        $( this )
          .addClass( "ui-state-highlight" )
          .find( "p" )
            .html( drg.text() );
      }
    });
  } );