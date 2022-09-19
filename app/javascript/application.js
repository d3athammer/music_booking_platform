// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
//= require turbolinks
//= require jquery3
//= require jquery_ujs
//= require_tree .
//= require bootstrap-datepicker

//For equipment

// $(document).on('turbolinks:load', function() {

  $('form').on('click', '.remove_record', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('tr').hide();
    return event.preventDefault();
  });

  $('form').on('click', '.add_fields', function(event) {
    console.log("clicked")
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.fields').append($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });

// });
