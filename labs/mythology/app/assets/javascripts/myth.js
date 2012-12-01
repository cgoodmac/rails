$(function(){

  $('body').keypress(pressed_key); //creates a keypress function
  $('#searchform').hide();
});

function pressed_key(key) 
{
  //you can do console.log to see which key is which
  // ctrl-f
  if(key.keyCode == 6)
  {
    $('#searchform').slideToggle();
    $('#searchform input').val('');
    $('#searchform input').focus();
  }

  //ctrl-h
  if(key.keyCode == 8)
  {
    $('#searchform').hide();
  }

  }