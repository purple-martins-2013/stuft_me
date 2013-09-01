$(document).on("page:load", function(){
  ShowTags();
  $(".token-input-list-facebook").on("mouseover", UpdateTags());
});
$(document).ready(function(){
  ShowTags();
  $(".token-input-list-facebook").on("mouseover", UpdateTags());
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