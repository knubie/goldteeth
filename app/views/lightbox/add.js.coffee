$('.count').html('(<%= session[:slides].length %>)')
$('.count').css('color', 'red')
$('.count').animate
  color: '#808080'
, 1000
