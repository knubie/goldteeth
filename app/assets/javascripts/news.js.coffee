$ ->
  $('.slides').slides (that) ->
    next: that.prev().find('.next')
    prev: that.prev().find('.prev')
    counter: that.prev().find('.current-slide')
