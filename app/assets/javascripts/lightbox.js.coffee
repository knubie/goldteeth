$ ->
  $('#lightbox-grid').imagesLoaded ->
    $('#lightbox-grid').masonry
        itemSelector: '.project'
        gutterWidth: 12

  $('#lightbox-nav').hover ->
    $(this).find('img').attr('src', $(this).find('img').attr('src').replace("_up","_down"))
  , ->
    $(this).find('img').attr('src', $(this).find('img').attr('src').replace("_down","_up"))
  $('#download-pdf').hover ->
    $(this).find('img').attr('src', $(this).find('img').attr('src').replace("_up","_down"))
  , ->
    $(this).find('img').attr('src', $(this).find('img').attr('src').replace("_down","_up"))
