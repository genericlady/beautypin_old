$(function() {
  bindListeners();
});

var bindListeners = function() {
  $('#discount').click(function(event) {
    console.log($('#lastSearch').val());
  });
}
