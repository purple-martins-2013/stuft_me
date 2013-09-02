$(document).on("page:load", function() {
  new EditAndDelete('#my-plates')
});

$(document).ready(function() {
  new EditAndDelete('#my-plates')
});

var plate_url, url, plate_price, ordered_tags;

function EditAndDelete(container) {
  $(container).on('click', '#edit-btn', 
    function() {
      url = $(this).closest(".small-photo").data("url");
      $.ajax({url: url+"/edit",
        type: 'GET',
        dataType: 'json',
        success: function(response) {
          $("#selected_plate").attr("src", response.url);
          plate_url = response.url
          $("#plate_description").val(response.description);
          $("#plate_location").val(response.location);
          plate_price = response.price;
        }
      });
      $.ajax({url: "/plates/tags",
        type: 'GET',
        data: "id="+url.split("/").slice(-1)[0],
        dataType: 'json',
        success: function(response) {
          ordered_tags = response;
          $("#dialog-edit").dialog("open");
          $("#star"+plate_price).prop("checked", true).button("refresh");
          $("#star"+plate_price).addClass("active_star");
          $("#tag_tokens").tokenInput('/tags.json', {
            theme: 'facebook', prePopulate: ordered_tags
          });
        }
      });
    });

    $( "#dialog-edit" ).dialog({
      dialogClass: "no-close",
      autoOpen: false,
      height: 825,
      width: 800,
      modal: true,
      buttons: {
        "Save My Plate!": function() {
          var plate_description = $("#plate_description").val(),
          plate_location = $("#plate_location").val();
          if (document.querySelector('input[name="plate_price"]:checked')) {
            plate_price = document.querySelector('input[name="plate_price"]:checked').value;
          } else {
            plate_price = "0";
          }
          var tag_tokens = $("#tag_tokens").val();
          var data = {
            plate_url: plate_url,
            plate_description: plate_description,
            plate_location: plate_location,
            plate_price: plate_price,
            tokens: tag_tokens
          }
          $.ajax({url: url,
            type: 'PUT',
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            data: data, 
            success: function() {
              $("#plate_description").val("");
              $("#plate_location").val("");
              $("input").removeClass("active_star");
              $("input").attr("checked", false);
              $("#change-description"+url.split("/").slice(-1)[0]).text(plate_description);
              $("li.token-input-token-facebook").remove();
              $("ul.token-input-list-facebook").remove();
              $("#dialog-edit").dialog("close");
            }
          });
        },
      Cancel: function() {
        $("#plate_description").val("");
        $("#plate_location").val("");
        $("input").removeClass("active_star");
        $("input").attr("checked", false);
        $("li.token-input-token-facebook").remove();
        $("ul.token-input-list-facebook").remove();
        $( this ).dialog( "close" );
      }
    }
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