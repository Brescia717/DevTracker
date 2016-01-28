if gon
  $(".welcome.index").ready ->
    allProfiles = gon.allProfiles
    sidebar = ""
    window.gmarkers = []
    initMap = ->
      coord =
        lat: 42.3725019
        lng: -71.1159379
      map = new (google.maps.Map)(document.getElementById('map'),
        zoom: 8
        center: coord)
      jQuery.each allProfiles, ->
        userCoord =
          lat: this.latitude
          lng: this.longitude
          # The anchor tag will be changed before production
        contentString = '<div id="content">' + '<div id="siteNotice">' + '</div>' +
          '<h1 id="firstHeading" class="firstHeading">' +
          '<a href="/users/' + this.user_id + '">' + this.name + '</a>' +
          '</h1>' + '<div id="bodyContent">' + this.summary +
          '</div>' + '</div>'
        infowindow = new (google.maps.InfoWindow)(content: contentString)
        if ((this.framework == null) || (this.framework == "Unspecified"))
          customIcon = 'assets/jobs.png'
        else
          customIcon = 'assets/' + this.framework + '.png'
        marker = new (google.maps.Marker)(
          position: userCoord
          map: map
          icon: customIcon
          animation: google.maps.Animation.DROP
          title: this.name )
        window.gmarkers.push marker
        $('#pf-uid-'+this.user_id).prepend '<a href="javascript:myclick(' + (window.gmarkers.length-1) + ')">' +
        marker.title + '<\/a>'
        marker.addListener 'click', ->
          infowindow.open map, marker
          return
        return
      # document.getElementById('profiles-list').innerHTML = sidebar
      return

    setTimeout initMap, 500
