$('#choose').click(function (e) {
    e.stopPropagation();
    $(this).siblings('select').css('width', $(this).outerWidth(true)).toggle();
});

$('#options').change(function (e) {
    e.stopPropagation();
    var val = this.value || 'Select options';
    $(this).siblings('#choose').text(val);
    $(this).hide();
});