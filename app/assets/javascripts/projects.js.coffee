$ ->
  $('#grid').imagesLoaded ->
    $('#grid').masonry
        itemSelector: 'img'
        gutterWidth: 12

  $(document).scroll ->
    if $(document).scrollTop() >= 30
      $('#header').css
        height: 50
        position: 'fixed'
    else
      $('#header').css
        height: 80
        position: 'absolute'

  getParam = (name) ->
    match = RegExp("[?&]#{name}=([^&]*)").exec(window.location.search)
    match && decodeURIComponent(match[1].replace(/\+/g, ' '))

  $('#slides').slides
    next: $('#next')
    prev: $('#prev')
    counter: $('#current-slide')
    startingSlide: if getParam('slide')? then getParam 'slide' else 1
