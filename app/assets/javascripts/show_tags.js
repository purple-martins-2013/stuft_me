$(document).on("page:load", function(){
  ShowTags();
});
$(document).ready(function(){
  ShowTags();
});

function ShowTags() {
  $('#tag_tokens').tokenInput('/tags.json', 
    {theme: 'facebook', prePopulate: $('#tag_tokens').data('load')
  });
}