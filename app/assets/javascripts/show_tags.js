$(document).on("page:load", function(){
  if ($("#show-plate").length > 0) {
    ShowTags();
    $(".token-input-list-facebook").on("keyup", function(e) {
      if (e.which == 13) {
        UpdateTags();
      }
    });
    $(".token-input-delete-token-facebook").on("click", UpdateTags);
    $(".token-input-dropdown-facebook").on("click", function() {
      UpdateTags();
    });
  }
});

$(document).ready(function(){
  if ($("#show-plate").length > 0) {
    ShowTags();
    $(".token-input-list-facebook").on("keyup", function(e) {
      if (e.which == 13) {
        UpdateTags();
      }
    });
    $(".token-input-delete-token-facebook").on("click", UpdateTags);
    $(".token-input-dropdown-facebook").on("click", function() {
      UpdateTags();
    });
  }
});

function ShowTags() {
  $('#tag_tokens').tokenInput('/tags.json', 
    {theme: 'facebook', prePopulate: $('#tag_tokens').data('load')
  });
}

function UpdateTags() {
  var tag_tokens = $("#tag_tokens").val();
  var plate_id = $("#tag-form #plate_id").val();
  var data = {
    tokens: tag_tokens,
    plate_id: plate_id
  }
  $.ajax({url: "/tags", 
    type: 'POST',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: data
  });
}