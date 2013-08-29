$(document).ready(function() {
  $('.create_plate').on("click", function(e) {
    e.preventDefault();
    $("#dialog-form").dialog("open");
  });
});

$( "#dialog-form" ).dialog({
  autoOpen: false,
  height: 300,
  width: 350,
  modal: true,
  buttons: {
    "Save": function() {
      url = $(this).attr("href");
      data = {data_url: $(this).find("img").attr("href")}
      $.post(url, data, success)
    },
    Cancel: function() {
      $( this ).dialog( "close" );
    }
  },
  close: function() {
  }
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
