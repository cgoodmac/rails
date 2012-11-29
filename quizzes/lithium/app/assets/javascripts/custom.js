// this function lets code execute only when the DOM is ready
$(function(){

  $('#form').hide();
  $('#name-button').click(show_form);

});

function show_form() {
  $('#form').show();
  $('#name-button').hide();

}