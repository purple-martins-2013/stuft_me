$(document).on("page:load", function() {
  new HoverVoteable('#plates-index')
});

$(document).ready(function() {
  new HoverVoteable('#plates-index')
});

function HoverVoteable(container) {
  $(container).on('mouseover', '.index-photo', 
    function() {
      var drool_count = $(this).data('drools');
      $(this).addClass("show-votes");
      if (drool_count == 1) {
        $(this).append("<h2 class='vote-text'>"+drool_count+" Drool</h2>");
      } 
      else{
        $(this).append("<h2 class='vote-text'>"+drool_count+" Drools</h2>");
      }

  }).on("mouseleave", ".index-photo", function() {
    $(this).removeClass("show-votes");
    $(this).find(".vote-text").remove();
    });

}
