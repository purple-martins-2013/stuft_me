$(document).on("page:load", function() {
  new HoverButtons('#my-plates')
});

$(document).ready(function() {
  new HoverButtons('#my-plates')
});

function HoverButtons(container) {
  $(container).on('mouseenter', '.small-photo', 
    function() {
      $(this).addClass("show-votes");
      $(this).append("<button type='button' id='edit-btn' class='btn btn-primary'>Edit</button><button type='button' id='delete-btn' class='btn btn-danger'>Delete</button>");
    }).on("mouseleave", ".small-photo", function() {
      $(this).removeClass("show-votes");
      $("#edit-btn").remove();
      $("#delete-btn").remove();
    });
}
