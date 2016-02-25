$(document).ready(function(){
  var doc = $(document.body);
  var alert = $('.alert');
  if ((doc.hasClass('welcome')) && (alert.length > 0)) {
    var page = $('.every-page');
    page.css({'margin-top': '-45px'});
  }
});
