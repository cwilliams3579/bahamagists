$(document).on "page:change", ->
  $('#comments-link').click (event) ->
    event.preventDefault()
    $('#comments-section').fadeToggle()
    $('.md-textarea').focus()

