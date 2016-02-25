$(document).ready(function(){
  var doc = $(document.body);
  if (doc.hasClass('conversations')) {
    var tabs = $('#mailbox-tabs ul li');
    for (i = 0; i < tabs.length; i++) {
      if (!$(tabs[i]).hasClass('active')) {
        $(tabs[i]).addClass('inactive-tab');
      }
    }
  }
});
