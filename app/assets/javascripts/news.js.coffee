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


  # Infinite scrolling
  page = 1
  loading = false

  nearBottomOfPage = ->
    $(window).scrollTop() > $(document).height() - $(window).height() - 200

  $(window).scroll ->
    if loading
      return
    if nearBottomOfPage()
      loading = true
      page++
      $.ajax
        url: "/news?page=#{page}"
        type: 'get'
        dataType: 'script'
        success: ->
          loading = false
