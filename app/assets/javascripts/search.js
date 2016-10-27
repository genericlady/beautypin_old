$(function() {
  searchListeners();
});

function searchListeners() {
  $('button.search').click(function(event) {
    var searchCriteria = $('#lastSearch').val();
    $.get('/deals.json', { search: searchCriteria })
      .done(function(response) {
        var deals = deserializeDeals(response);
        renderDealsTableHTML(deals);
      });
    event.preventDefault;
  });
}

function deserializeDeals(response) {
  var serializedDeals = response['deals'];
  var deserializedDeals = [];
  for (var i = 0; i < serializedDeals.length; i++) {
    var newDeal = new Deal(deals[i]); 
    newDeal.beauty_place = new BeautyPlace(newDeal.beauty_place);
  }
  return deals;
}

function renderDealsTableHTML(deals) {
  var childrenElements = '';
  for (var i=0; i < deals.length; i++) {
    childrenElements += deals[i].renderTR();
  }
  $('#dealsTableBody').html(childrenElements);
}
