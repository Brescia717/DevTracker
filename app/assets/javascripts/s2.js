$(document).ready(function() {
  function formatOption(person) {
    var option = $(person.element);
    return "<span style='display: inline;'>&nbsp;&nbsp;</span> " +
      "<img src='" + option.data("gravatar") + "'> " +
      person.text;
  };

  $('.s2').select2({
    // theme: "bootstrap",
    placeholder: "Select user(s)",
    allowClear: true,
    formatResult: formatOption,
    formatSelection: formatOption,
    escapeMarkup: function(m) { return m; }
  });
});
