$(function() {
  searchListeners();
});

function searchListeners() {
  $('button.search').click(function(event) {
    var searchCriteria = $('#lastSearch').val();
    $.get('/deals.json', { search: searchCriteria })
      .done(function(response) {
        var elements = '';
        var deals = response['deals'];

        for (var i = 0; i < deals.length; i++) {
          var newDeal = new Deal(deals[i]);
          newDeal.beauty_place = new BeautyPlace(newDeal.beauty_place);
          elements += newDeal.renderTR();
        }
        
        $('#dealsTableBody').html(elements);
      });
    event.preventDefault;
  });
}
