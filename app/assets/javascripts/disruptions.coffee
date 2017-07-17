@set_disruptions = (disruptions) ->
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: new google.maps.LatLng(51.509865, -0.118092),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  })

  markers = []
  for disruption in disruptions
    marker =  new google.maps.Marker({
      position: {lat: disruption.coords.lat, lng: disruption.coords.lng},
      map: map,
      html: disruption.location,
      id: disruption.id
    });
    markers.push(marker)

    google.maps.event.addListener(marker, 'click', ()->
      infowindow = new google.maps.InfoWindow({
        id: this.id,
        content: this.html,
        position: this.getPosition()
      });

      google.maps.event.addListenerOnce(infowindow, 'closeclick',  () ->
        markers[this.id].setVisible(true)
      )
      this.setVisible(false)
      infowindow.open(map)
    )
