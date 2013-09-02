$(document).on("page:load", function() {
  e.preventDefault();
  new DroolUpdate('#drool-bar')
});

$(document).ready(function() {
  e.preventDefault();
  new DroolUpdate('#drool-bar')
});

function DroolUpdate(container) {
  $(container).on('click', 'input', function() {
    console.log("hello");
  });
}
