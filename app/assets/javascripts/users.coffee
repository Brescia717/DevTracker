if gon
  $(".users.show").ready ->
    initMap = ->
    coord =
      lat: gon.profile.latitude
      lng: gon.profile.longitude
    map = new (google.maps.Map)(document.getElementById('map'),
      zoom: 4
      center: coord)
    contentString = '<div id="content">' + '<div id="siteNotice">' + '</div>' +
      '<h1 id="firstHeading" class="firstHeading">' + gon.user.name +
      '</h1>' + '<div id="bodyContent">' + gon.profile.summary +

      '</div>' + '</div>'
    infowindow = new (google.maps.InfoWindow)(content: contentString)
    marker = new (google.maps.Marker)(
      position: coord
      map: map
      title: gon.user.name )
    marker.addListener 'click', ->
      infowindow.open map, marker
      return
    return
