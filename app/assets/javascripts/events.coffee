# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.start_date').pickadate()
  $('.end_date').pickadate()
  $('.start_time').pickatime()
  $('.end_time').pickatime()