$(document).on("page:load", function() {
  new DroolUpdate('#drool-bar')
});

$(document).ready(function() {
  new DroolUpdate('#drool-bar')
});

function DroolUpdate(container) {
  $(container).on('click', 'input', function() {
    $(container).on("ajax:success", function(e, data, status, xhr) {
      $('#drool-bar').empty()
      $('#drool-bar').append(data)
    });
  });
}
