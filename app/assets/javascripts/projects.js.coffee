$ ->
  #$('#container').masonry
  #    itemSelector: '#slides-grid > img'
  getParam = (name) ->
    match = RegExp("[?&]#{name}=([^&]*)").exec(window.location.search)
    match && decodeURIComponent(match[1].replace(/\+/g, ' '))

  $('#slides').slides
    next: '#next'
    prev: '#prev'
    counter: '#counter'
    startingSlide: if getParam('slide')? then getParam 'slide' else 1
