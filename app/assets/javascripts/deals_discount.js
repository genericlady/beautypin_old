$(function() {
  bindListeners();
});

var bindListeners = function() {
  $('a#discount').click(function(event) {
    var searchCriteria = $('#lastSearch').val();
    var memo = '';
    event.preventDefault();
    
    $.get(this.href, { search: searchCriteria }, function( response ) {
      for (var i = 0; i < response.deals.length; i++) {
        memo += '<tr>';
        memo += '<td>' + response.deals[i]['title'] + '</td>';
        memo += '<td>' + response.deals[i]['discount'] + '</td>';
        memo += '<td>' + response.deals[i]['description'] + '</td>';
        memo += '</tr>';
      }
      $('#dealsTableBody').html(memo);
    });
  });
}
