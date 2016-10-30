$(function() {
  searchListeners();
});

function searchListeners() {
  $('button.search-submit').click(function(event) {

    var searchCriteria = $('#lastSearch').val();

    $.get('/deals.json', { search: searchCriteria })
      .done(function(response) {
        Deal.renderIndex(response);
      });

    event.preventDefault;
  });
}

