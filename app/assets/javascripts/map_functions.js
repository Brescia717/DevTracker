function myclick(i) {
  if (window.gmarkers) {
    google.maps.event.trigger( window.gmarkers[i], 'click' );
  }
}
