(($) ->
  jQuery.fn.slides = (options) ->

    # Default options
    settings = $.extend
      startingSlide: 1
    , options

    # Initial variables
    $images = this.children()
    $currentSlide = this.children(":nth-child(#{settings.startingSlide})")
    $images.not($currentSlide).hide()
    slideIndex = settings.startingSlide

    $next = $(options.next)
    $prev = $(options.prev)
    $counter = $(options.counter)

    transitioning = false

    transition = (direction) ->
      unless transitioning
        transitioning = true
        $currentSlide.fadeOut ->
          if direction is 'next' then $next = $currentSlide.next() else $next = $currentSlide.prev()
          if $next.length
            $currentSlide = $next
            if direction is 'next' then slideIndex++ else slideIndex--
            $counter.html(slideIndex)
            $currentSlide.fadeIn ->
              transitioning = false
          else
            if direction is 'next'
              $currentSlide = $images.first()
              slideIndex = 1
            else
              $currentSlide = $images.last()
              slideIndex = $images.length
            $counter.html(slideIndex)
            $currentSlide.fadeIn ->
              transitioning = false

    # Set up DOM elements
    $next.click ->
      transition 'next'

    $prev.click ->
      transition 'prev'

    $counter.html(slideIndex)


)(jQuery)

