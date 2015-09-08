if gon
  $(".welcome.index").ready ->
    initMap = ->
    coord =
      lat: 42.3725019
      lng: -71.1159379
    map = new (google.maps.Map)(document.getElementById('map'),
      zoom: 8
      center: coord)
    jQuery.each gon.allProfiles, ->
        userCoord =
          lat: this.latitude
          lng: this.longitude
          # The anchor tag will be changed before production
        contentString = '<div id="content">' + '<div id="siteNotice">' + '</div>' +
          '<h1 id="firstHeading" class="firstHeading">' +
          '<a href="http://localhost:3000/users/' + this.user_id + '">' + this.name + '</a>' +
          '</h1>' + '<div id="bodyContent">' + this.summary +

          '</div>' + '</div>'
        infowindow = new (google.maps.InfoWindow)(content: contentString)
        marker = new (google.maps.Marker)(
          position: userCoord
          map: map
          icon: 'assets/computers.png'
          title: this.name )
        marker.addListener 'click', ->
          infowindow.open map, marker
          return
        return
