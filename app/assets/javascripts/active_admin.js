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

});
