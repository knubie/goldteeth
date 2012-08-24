//= require active_admin/base
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-button
//= require bootstrap-wysihtml5-all
//= require jquery_nested_form

$(document).ready(function() {
  $('.wysiwyg').wysihtml5({
    "image": false
  });
  $('#sortable-slides').sortable({
    axis: 'y',
    update: function() {
      $.post("update_sort", $(this).sortable('serialize'))
    }
  });

});
