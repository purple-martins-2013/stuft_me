$(document).on("page:load", function() {
  new EditAndDelete('#my-plates')
});

$(document).ready(function() {
  new EditAndDelete('#my-plates')
});

var plate_url, url;

function EditPlate() {
  $('.edit_plate').on("click", function(e) {
    e.preventDefault();
  });
};

function EditAndDelete(container) {
  $(container).on('click', '#edit-btn', 
    function() {
      var url = $(this).closest(".small-photo").data("url");
      $.ajax({url: url+"/edit",
        type: 'GET',
        dataType: 'json',
        success: function(response) {
          $("#selected_plate").attr("src", response.url);
          $("#plate_description").val(response.description);
          $("#plate_location").val(response.location);
          $("#star"+response.price).attr("checked", true);
          $("#star"+response.price).addClass("active_star");
        }
      });
      $("#dialog-edit").dialog("open");
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
          plate_location = $("#plate_location").val(),
          plate_price,
          mini_url = plate_url.split(".").slice(-2,-1)[0].split("/").slice(-1)[0];
          if (document.querySelector('input[name="plate_price"]:checked')) {
            plate_price = document.querySelector('input[name="plate_price"]:checked').value;
          } else {
            plate_price = "0";
          }
          var data = {
            plate_url: plate_url,
            plate_description: plate_description,
            plate_location: plate_location,
            plate_price: plate_price
          }
          $.ajax({url: url, 
            type: 'PUT',
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            data: data, 
            success: function() {
              $("#plate_description").val("");
              $("#plate_location").val("");
              if (document.querySelector('input[name="plate_price"]:checked')) {
                document.querySelector('input[name="plate_price"]:checked').checked = false;
              }
              $("#dialog-form").dialog("close");
              $("#"+mini_url).find("img").addClass("plate-added");
              $("#"+mini_url).replaceWith($("#"+mini_url).find("img"));
            }
          });
        });
      },
      Cancel: function() {
        $("#plate_description").val("");
        $("#plate_location").val("");
        if (document.querySelector('input[name="plate_price"]:checked')) {
          document.querySelector('input[name="plate_price"]:checked').checked = false;
        }
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