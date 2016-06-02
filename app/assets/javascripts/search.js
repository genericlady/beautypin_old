$(function() {
  searchListeners();
});

function searchListeners() {
  $('button.search').click(function getDeals(event) {
    var searchCriteria = $('#lastSearch').val();
    event.preventDefault;
    // Pass data to params hash
    $.get('/deals.json', { search: searchCriteria })
      .done(function handleDeals(response) {
        var elements = '';
        var deals = response['deals'];
        for (let deal of deals) {
          elements += '<tr>'
          elements += '<td>' + deal.beauty_place['name'] + '</td>';
          elements += '<td>' + deal['title'] + '</td>';
          elements += '<td>' + deal['discount'] + '</td>';
          elements += '<td>' + deal['description']
          elements += '</tr>'
        }
        $('#dealsTableBody').html(elements)
      });
  });
}
