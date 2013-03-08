//= require active_admin/base
//= require jquery
//= require jquery_ujs
//= require bootstrap-button
//= require bootstrap-modal
//= require wysihtml5
//= require bootstrap-wysihtml5
//= require jquery_nested_form

$(document).ready(function() {
  $('.wysiwyg').wysihtml5({
    "image": false
  });
  $('#sortable-slides').sortable({
    update: function() {
      $.post($(this).data('update_url'), $(this).sortable('serialize'))
    }
  });
    // Change text in button to indicate working
  $('.sort .action_item > a').click(function() {
    $(this).text('Saving...');
    $.post($('#sortable-slides').data('update_url'), $('#sortable-slides').sortable('serialize'), function(data){
      // Put text back into button
      $('.action_item > a').text('Save');
      // Add success flash
      $('#title_bar').after('<div class="flashes"><div class="flash flash_notice">Sort order was successfully updated.</div></div>');
      $('.flash_notice').hide().slideToggle(300);
      // Remove success flash
      setTimeout(function() {
        $('.flashes').fadeOut(function(){$(this).remove()});
      }, 5000);
    });
  });

});
