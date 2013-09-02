$(document).on("page:load", function(){
  CreateComment();
});
$(document).ready(function(){
  CreateComment();
});

var url, plate_id;

function CreateComment() {
  $('#make-comment').on("click", function(e) {
    e.preventDefault();
    url = $(this).closest("form").attr("action");
    plate_id = url.split(".")[1];
    url = url.split(".")[0]
    $("#comment-form").dialog("open");
  });

  $( "#comment-form" ).dialog({
    dialogClass: "no-close",
    autoOpen: false,
    height: 425,
    width: 600,
    modal: true,
    buttons: {
      "Add my comment!": function() {
        var content = $("#comment-content").val();
        var data = {
          content: content,
          id: plate_id
        }
        $.ajax({url: url, 
          type: 'POST',
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          data: data, 
          success: function() {
            $("#comment-form").dialog("close");
            $("#comment-section").append("<p>"+content+"</p>");
          }
        });
      },
      Cancel: function() {
        $( this ).dialog( "close" );
      }
    }
  });
};
