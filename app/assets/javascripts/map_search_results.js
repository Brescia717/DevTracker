$('#map').ready(function () {
  // Load gmaps with search results
  $('#search-button').on('click', function() {
    setTimeout(function(){
      updatedResults = $('#results').data('results');
      if (updatedResults === false) {
        updatedResults = gon.allProfiles;
      }
      console.log(updatedResults);
      initMap(); // Initialize map using updatedResults
    }, 500);
  });

  function initMap() {
    window.gmarkers = updatedResults;
    var coord, map;
    coord = {
      lat: 42.3725019,
      lng: -71.1159379
      };
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 8,
      center: coord
    });
    jQuery.each(updatedResults, function() {
      var contentString, customIcon, infoWindow, marker, userCoord;
      userCoord = {
        lat: this.latitude,
        lng: this.longitude
      };
      contentString = '<div id="content">' + '<div id="siteNotice">' + '</div>' +
        '<h1 id="firstHeading" class="firstHeading">' +
        '<a href="/users/' + this.user_id + '">' +
        this.name + '</a>' + '</h1>' + '<div id="bodyContent">' + this.summary +
        '</div>' + '</div>';
      infoWindow = new google.maps.InfoWindow({
        content: contentString
      });
      if ((this.framework === null) || (this.framework === "Unspecified")) {
        customIcon = 'assets/jobs.png';
      } else {
        customIcon = 'assets/' + this.framework + '.png';
      }
      marker = new google.maps.Marker({
        position: userCoord,
        map: map,
        icon: customIcon,
        animation: google.maps.Animation.DROP,
        title: this.name
      });
      console.log(window.gmarkers);
      marker.addListener('click', function() {
        infoWindow.open(map, marker);
      });
      $('#pf-uid-'+this.user_id).click(function(e){
        infoWindow.open(map, marker);
      });
    });
    return
  }
});
