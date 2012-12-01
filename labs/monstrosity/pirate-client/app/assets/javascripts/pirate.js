$(function(){

$('#pirate_button').click(get_all_pirates);
$('#pirate_create').click(create_pirate);
setInterval(get_all_pirates, 1000);

});

function create_pirate() 
{
  var pirate_name = $('#pirate_text').val();

  $.ajax({
  type: "POST",
  url: "http://4eac.localtunnel.com/pirates",
  data: { name: pirate_name }
}).done(function( msg ) {
  $('#pirates').empty();

  for(var i = 0; i < msg.length; i++)
  {
    $('#pirates').prepend('<h1>' + msg[i].name + '</h1>');
  }

  });
}

function get_all_pirates() 
{
  $.ajax({
  type: "GET",
  url: "http://4eac.localtunnel.com/pirates.json"
}).done(function( msg ) {
  $('#pirates').empty();

  for(var i = 0; i < msg.length; i++)
  {
    $('#pirates').prepend('<h1>' + msg[i].name + '</h1>');
  }

  });
}

