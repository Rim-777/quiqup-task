fetch_data =  ->
  $.get '/requests/fetch_data', {}, (response)->
    console.log(response)


jQuery ->
  fetch_data()