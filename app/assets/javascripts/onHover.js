$(document).ready(function(){
  $(".icon").hover(
    function() {
      $(this).addClass( "fa-3x" );
      $(this).css( "color", "#540045" );
    }, function() {
      $(this).removeClass( "fa-3x" );
      $(this).css( "color", "black" );
    }
  );
});

$(document).ready(function(){
  $(".footer-link").hover(
    function() {
      $(this).css( "color", "#540045" );
    }, function() {
      $(this).css( "color", "black" );
    }
  );
});
