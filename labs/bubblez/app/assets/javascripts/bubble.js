var temp;

function bubble()
{
  var spans = $('span');
  


    temp = $('#text').children().first();
    for (var i=1; i < spans.length; i++) {
      
      if (temp.text() > temp.next().text()) {
        
        a = temp.text();
        b = temp.next().text();
        temp.next().text(a);
        temp.text(b);

        // nxt = temp.next.text();
        // myself = temp.text();
        // temp.text(nxt);
        // temp.next().text(myself);
        

        // temp.next().remove();

        // temp.next().remove();
        // temp.insertBefore(next);
      } 

      
      temp = temp.next();
      
    
}
}

function timerBubble() {
  setInterval(bubble,100);
}