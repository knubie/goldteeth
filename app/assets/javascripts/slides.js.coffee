(($) ->
  jQuery.fn.slides = (options) ->

    # Default options
    settings = $.extend
      next: $('#next')
      prev: $('#prev')
      counter: $('#counter')
      startingSlide: 1
      history: true
    , options

    console.log this

    # Initial variables
    $images = this.children()
    $currentSlide = this.children(":nth-child(#{settings.startingSlide})")

    $pins = $('#pin-it').children()
    $shares = $('#facebook').children()
    $tweets = $('#twitter').children()
    $tumblr = $('#tumblr').children()
    $currentPin = $('#pin-it').children(":nth-child(#{settings.startingSlide})")
    $currentShare = $('#facebook').children(":nth-child(#{settings.startingSlide})")
    $currentTweet = $('#twitter').children(":nth-child(#{settings.startingSlide})")
    $currentTumblr = $('#tumblr').children(":nth-child(#{settings.startingSlide})")
    $pins.not($currentPin).hide()
    $shares.not($currentShare).hide()
    $tweets.not($currentTweet).hide()
    $tumblr.not($currentTumblr).hide()
    $images.not($currentSlide).hide()

    slideIndex = settings.startingSlide

    $next = options.next
    $prev = options.prev
    $counter = options.counter
    $lightbox = $("#lightbox")

    transitioning = false

    transition = (direction) ->
      unless transitioning
        transitioning = true
        $currentSlide.fadeOut -> #TODO: page jumps when image hides itself
          $currentPin.hide()
          $currentShare.hide()
          $currentTweet.hide()
          $currentTumblr.hide()

          # Reset vimeo if it's a video
          if $currentSlide.children().first().is('iframe')
            src = $currentSlide.children().first().attr('src')
            $currentSlide.children().first().attr('src', '')
            $currentSlide.children().first().attr('src', src)

          # Check direction
          if direction is 'next'
            $nextSlide = $currentSlide.next()
            $nextPin = $currentPin.next()
            $nextShare = $currentShare.next()
            $nextTweet = $currentTweet.next()
            $nextTumblr = $currentTumblr.next()
          else
            $nextSlide = $currentSlide.prev()
            $nextPin = $currentPin.prev()
            $nextShare = $currentShare.prev()
            $nextTweet = $currentTweet.prev()
            $nextTumblr = $currentTumblr.prev()

          # If there's another slide
          if $nextSlide.length
            $currentSlide = $nextSlide
            $currentPin = $nextPin
            $currentShare = $nextShare
            $currentTweet = $nextTweet
            $currentTumblr = $nextTumblr
            if direction is 'next' then slideIndex++ else slideIndex--

          else # Last slide, go to beginning
            if direction is 'next'
              $currentSlide = $images.first()
              $currentPin = $pins.first()
              $currentShare = $shares.first()
              $currentTweet = $tweets.first()
              $currentTumblr = $tumblr.first()
              slideIndex = 1
            else
              $currentSlide = $images.last()
              $currentPin = $pins.last()
              $currentShare = $shares.last()
              $currentTweet = $tweets.last()
              $currentTumblr = $tumblr.last()
              slideIndex = $images.length
          $counter.html(slideIndex)
          history.replaceState({},'',"?slide=#{slideIndex}") if history.replaceState? and options.history
          $currentPin.show()
          $currentShare.show()
          $currentTweet.show()
          $currentTumblr.show()
          $currentSlide.fadeIn ->
            transitioning = false
            $lightbox.attr('href', "/lightbox/add/#{$('#slides > .slide:visible > img').attr('data-id')}") if $lightbox.length

    # Set up DOM elements
    $next.click ->
      transition 'next'

    $prev.click ->
      transition 'prev'

    $counter.html(slideIndex)
    $lightbox.attr('href', "/lightbox/add/#{$images.eq(slideIndex-1).children().first().attr('data-id')}")

    return this # Maintain jQuery chainability

)(jQuery)

