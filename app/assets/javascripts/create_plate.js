var plate_url, url;

$(document).on("page:load", function(){
  CreatePlate();
});
$(document).ready(function(){
  CreatePlate();
});

function CreatePlate() {
  $('.create_plate').on("click", function(e) {
    e.preventDefault();
    url = $(this).attr("href");
    plate_url = $(this).find("img").attr("src");
    $("#dialog-form").dialog("open");
    $("#selected_plate").attr("src", plate_url);
    $('#tag_tokens').tokenInput('/tags.json', {
      theme: 'facebook'
    });
  });

  $( "#dialog-form" ).dialog({
    dialogClass: "no-close",
    autoOpen: false,
    height: 925,
    width: 800,
    modal: true,
    buttons: {
      "Create My Plate!": function() {
        var plate_description = $("#plate_description").val(),
        plate_location = $("#plate_location").val(),
        plate_price,
        mini_url = plate_url.split(".").slice(-2,-1)[0].split("/").slice(-1)[0];
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
          type: 'POST',
          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          data: data, 
          success: function() {
            $("#plate_description").val("");
            $("#plate_location").val("");
            if (document.querySelector('input[name="plate_price"]:checked')) {
              document.querySelector('input[name="plate_price"]:checked').checked = false;
            }
            $("li.token-input-token-facebook").remove();
            $("ul.token-input-list-facebook").remove();
            $("#dialog-form").dialog("close");
            $("#"+mini_url).find("img").addClass("plate-added");
            $("#"+mini_url).replaceWith($("#"+mini_url).find("img"));

          }
        });
      },
      Cancel: function() {
        $("#plate_description").val("");
        $("#plate_location").val("");
        if (document.querySelector('input[name="plate_price"]:checked')) {
          document.querySelector('input[name="plate_price"]:checked').checked = false;
        }
        $("li.token-input-token-facebook").remove();
        $("ul.token-input-list-facebook").remove();
        $( this ).dialog( "close" );
      }
    }
  });
};

