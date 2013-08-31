$(document).ready(function() {
  $('.index-photo').hover( 
    function() {
      $(this).addClass("show-votes");
      $(this).append("<h2 class='vote-text'>35 Votes</h2>");
    },
    function() {
      $(this).removeClass("show-votes");
      $(this).find(".vote-text").remove();
    }
  );
});
