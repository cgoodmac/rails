$(function(){

$('#b1').click(b1);
$('#b2').click(b2);
$('#b3').click(b3);
$('#b4').click(b4);

});

function b1()
{

alertify.alert( "this is the message", function () {
    $('h1').text('we rule');
});

}

function b2() {
  
}

function b3() {
  
}

function b4() {
  
}
