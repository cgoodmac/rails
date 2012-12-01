// this function lets code execute only when the DOM is ready
$(function(){

  $('#creature_form').hide();
  $('#new_creature').click(show_form);

});

function show_form() {
  $('#creature_form').show();
  $('#new_creature').hide();
}