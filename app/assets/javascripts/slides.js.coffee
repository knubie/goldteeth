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

          # Reset vimeo if it's a video
          console.log $currentSlide.children().first()
          if $currentSlide.children().first().is('iframe')
            src = $currentSlide.children().first().attr('src')
            $currentSlide.children().first().attr('src', '')
            $currentSlide.children().first().attr('src', src)

          # Check direction
          if direction is 'next' then $nextSlide = $currentSlide.next() else $nextSlide = $currentSlide.prev()

          # If there's another slide
          if $nextSlide.length
            $currentSlide = $nextSlide
            if direction is 'next' then slideIndex++ else slideIndex--

          else # Last slide, go to beginning
            if direction is 'next'
              $currentSlide = $images.first()
              slideIndex = 1
            else
              $currentSlide = $images.last()
              slideIndex = $images.length
          $counter.html(slideIndex)
          history.replaceState({},'',"?slide=#{slideIndex}") if history.replaceState? and options.history
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

