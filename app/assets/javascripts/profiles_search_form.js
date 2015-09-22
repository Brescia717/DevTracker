$(function(){
  var frameworks = $('#profiles-search-form').data('frameworks');
  $('#profiles-search-field').autocomplete({
    source: frameworks
  });
});
