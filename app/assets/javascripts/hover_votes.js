$(document).ready(function() {
  new HoverVoteable('#plates-index')
});

function HoverVoteable(container) {
  $(container).on('mouseover', '.index-photo', 
    function() {
      $(this).addClass("show-votes");
      $(this).append("<h2 class='vote-text'>35 Votes</h2>");
    }).on("mouseleave", ".index-photo", function() {
      $(this).removeClass("show-votes");
      $(this).find(".vote-text").remove();
    });
}
