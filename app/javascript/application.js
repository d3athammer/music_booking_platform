// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"
const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

// import Flatpickr
import Flatpickr from "stimulus-flatpickr";
// Manually register Flatpickr as a stimulus controller
application.register("flatpickr", Flatpickr);

//= require turbolinks
//= require jquery3
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets


//for equipment
// $(document).on('turbolinks:load', function() {

// $('form').on('click', '.remove_record', function (event) {
//   // console.log($(this).prev('input[type=hidden]').val('1'))
//   // $(this).prev('input[type=hidden]').val('1');
//   $(this).closest('tr').hide();
//   return event.preventDefault();
// });

  // $('form').on('click', '.add_fields', function(event) {
  //   var regexp, time;
  //   time = new Date().getTime();
  //   regexp = new RegExp($(this).data('id'), 'g');
  //   $('.fields').append($(this).data('fields').replace(regexp, time));
  //   return event.preventDefault();
  // });

// });

//-----multidropdown-----//
// const selectBtn = document.querySelector(".multiselect-btn"),
//       items = document.querySelectorAll(".item-multi");

//       console.log(selectBtn,items)
// modal //
