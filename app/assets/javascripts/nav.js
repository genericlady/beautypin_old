$(function() {
  onNavDeals();
});

function onNavDeals() {
  var tableRows = '';

  $('[data-nav-deals]').on("click", function(event) {
    let url = this.dataset.navDeals;

    $.ajax({
      url: url,
      dataType: "json",
      method: "GET"
    }).success(function(deals) {

      for (var i = 0; i < deals.length; i++) {
        let deal = new Deal(deals[i]);
        deal.beautyPlace = deals[i].beauty_place;
        tableRows += deal.renderTR();
      }
      debugger;
      $('main').html(Deal.prototype.renderTable(tableRows));
    }).fail(function() {
      console.log('onNavDeals ajax call fail on /deals');
    });

    event.preventDefault;

  });
}
