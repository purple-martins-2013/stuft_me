var $container = $("#infinite-scroll");

$container.imagesLoaded(function() {
  $container.isotope({
    itemSelector : ".item",
    masonry: {
    }
  });
});

$container.infinitescroll({

  navSelector : '#page_nav',
  nextSelector : "#page_nav a",
  itemSelector : '.item',
},
function( newElements ) {
  var $newElems = $( newElements ).css({opacity: 0});
  $newElems.imagesLoaded(function() {
    $newElements.animate({opacity: 1});
    $container.isotope( 'appended', $newElements );
  });
});

$(document).on("inview", ".item", function(e) {
  var $this = $(this);
  if(!$this.hasClass('loaded')) {
    $this.addClass('loaded');
    $this.css('visibility', 'visible').hide().fadeIn('slow');
  }
});