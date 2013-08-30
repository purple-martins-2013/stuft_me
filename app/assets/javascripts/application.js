var plate_url, url;

$(document).ready(function() {
  $('.create_plate').on("click", function(e) {
    e.preventDefault();
    url = $(this).attr("href");
    plate_url = $(this).find("img").attr("src");
    $("#dialog-form").dialog("open");
    $("#selected_plate").attr("src", plate_url);
  });

  $('.index-photo').hover( 
    function() {
      $(this).addClass("show-votes");
      $(this).append("<h2 class='vote-text'>35 Votes</h2>");
    },
    function() {
      $(this).removeClass("show-votes");
      $(this).find(".vote-text").remove();
    });

  $( "#dialog-form" ).dialog({
    dialogClass: "no-close",
    autoOpen: false,
    height: 825,
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
        var data = {
          plate_url: plate_url,
          plate_description: plate_description,
          plate_location: plate_location,
          plate_price: plate_price
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
        $( this ).dialog( "close" );
      }
    }
  });
});


// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
