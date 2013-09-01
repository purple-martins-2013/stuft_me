$(document).on("page:load", function() {
  new EditAndDelete('#my-plates')
});

$(document).ready(function() {
  new EditAndDelete('#my-plates')
});

function EditAndDelete(container) {
  $(container).on('click', '#edit-btn', 
    function() {
      
    });
  $(container).on('click', '#delete-btn', 
    function() {
      var url = $(this).closest(".small-photo").data("url");
      $.ajax({url: url, 
        type: 'DELETE',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        success: function(response) {
          current_plates = $(response).find("#my-plates").html();
          $("#my-plates").html(current_plates);
        }
      });
    });
}
