$ ->

  $.each $('.slides'), ->
    $(this).slides
      next: $(this).prev().find('.next')
      prev: $(this).prev().find('.prev')
      counter: $(this).prev().find('.current-slide')
      history: false

  $('#news-grid').imagesLoaded ->
    $('#news-grid').masonry
        itemSelector: '.project'
        gutterWidth: 12

