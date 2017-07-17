fetch_data = (notification) ->
  $('#map').append(notification)
  $.get '/requests/fetch_data', {}, (response)->
    set_disruptions(response)
    console.log(response)

jQuery ->
  fetch_data()
  $(".refresh-button").on "click", (e) =>
    e.preventDefault()
    fetch_data('<div class="mdl-spinner mdl-js-spinner s-active">Loading....</div>')



