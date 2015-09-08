if gon
  $(".users.show").ready ->
    jQuery.each gon.profile, ->
      initMap = ->
      coord =
        lat: this.latitude
        lng: this.longitude
      map = new (google.maps.Map)(document.getElementById('map'),
        zoom: 4
        center: coord)
      contentString = '<div id="content">' + '<div id="siteNotice">' + '</div>' +
        '<h1 id="firstHeading" class="firstHeading">' + this.name +
        '</h1>' + '<div id="bodyContent">' + this.summary +
        '</div>' + '</div>'
      infowindow = new (google.maps.InfoWindow)(content: contentString)
      marker = new (google.maps.Marker)(
        position: coord
        map: map
        title: this.name )
      marker.addListener 'click', ->
        infowindow.open map, marker
        return
      return
    return
