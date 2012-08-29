(($) ->
  jQuery.fn.slides = (options) ->

    # In order to pass this to options hash
    if typeof options is 'function'
      options = options(this)

    # Default options
    settings = $.extend
      startingSlide: 1
    , options

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
        $currentSlide.fadeOut ->
          if direction is 'next' then $next = $currentSlide.next() else $next = $currentSlide.prev()
          if $next.length # If there's another slide
            $currentSlide = $next
            if direction is 'next' then slideIndex++ else slideIndex--

          else # Last slide, go to beginning
            if direction is 'next'
              $currentSlide = $images.first()
              slideIndex = 1
            else
              $currentSlide = $images.last()
              slideIndex = $images.length
          $counter.html(slideIndex)
          history.replaceState({},'',"?slide=#{slideIndex}") if history.replaceState?
          $currentSlide.fadeIn ->
            transitioning = false
            $lightbox.attr('href', "/add/#{$('#slides > img:visible').attr('data-id')}")

    # Set up DOM elements
    $next.click ->
      transition 'next'

    $prev.click ->
      transition 'prev'

    $counter.html(slideIndex)
    $lightbox.attr('href', "/add/#{$('#slides > img:visible').attr('data-id')}")

    return this # Maintain jQuery chainability

)(jQuery)

