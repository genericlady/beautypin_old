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
        for (var deal of deals) {
          // make sure deal can be serialized with beauty_place
          var newDeal = new Deal(deal);
          newDeal.beauty_place = new BeautyPlace(newDeal.beauty_place);
          elements += newDeal.renderTR();

        }
        $('#dealsTableBody').html(elements);
      });
    event.preventDefault;
  });
}
