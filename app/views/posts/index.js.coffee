$("#news").append("<%= escape_javascript(render(@posts)) %>")

$.each $('.slides'), ->
  $(this).slides
    next: $(this).prev().find('.next')
    prev: $(this).prev().find('.prev')
    counter: $(this).prev().find('.current-slide')
    history: false
