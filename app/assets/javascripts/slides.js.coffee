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

    $social = $('.social').children()
    $currentSocial = $('.social').children(":nth-child(#{settings.startingSlide})")
    $currentSocial.show()
    $currentSlide.show()

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
          $currentSocial.hide()

          # Reset vimeo if it's a video
          if $currentSlide.children().first().is('iframe')
            src = $currentSlide.children().first().attr('src')
            $currentSlide.children().first().attr('src', '')
            $currentSlide.children().first().attr('src', src)

          # Check direction
          if direction is 'next'
            $nextSlide = $currentSlide.next()
            $nextSocial = $currentSocial.next()
          else
            $nextSlide = $currentSlide.prev()
            $nextSocial = $currentSocial.prev()

          # If there's another slide
          if $nextSlide.length
            $currentSlide = $nextSlide
            $currentSocial = $nextSocial
            if direction is 'next' then slideIndex++ else slideIndex--

          else # Last slide, go to beginning
            if direction is 'next'
              $currentSlide = $images.first()
              $currentSocial = $social.first()
              slideIndex = 1
            else
              $currentSlide = $images.last()
              $currentSocial = $social.last()
              slideIndex = $images.length
          $counter.html(slideIndex)
          history.replaceState({},'',"?slide=#{slideIndex}") if history.replaceState? and options.history
          $currentSocial.show()
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

