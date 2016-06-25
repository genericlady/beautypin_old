$(function() {
  onNavDeals();
  onNavbarBrand();
});

function onNavbarBrand() {
  var navbarBrand =  $('body > navbar-brand');
  $('body').on('click', '.navbar-brand', function(event) {
    console.log("i'm over this it's time for handlebars");
  });
};

function onNavDeals() {
  var tableRows = '';

  $('body').on("click", '[data-nav-deals]', function(event) {
    var url = this.dataset.navDeals;

    $.ajax({
      url: url,
      dataType: "json",
      method: "GET"
    }).success(function(deals) {

      for (var i = 0; i < deals.length; i++) {
        var deal = new Deal(deals[i]);
        deal.beautyPlace = deals[i].beauty_place;
        tableRows += deal.renderTR();
      }
      $('main').html(Deal.prototype.renderTable(tableRows));
    }).fail(function() {
      console.log('onNavDeals ajax call fail on /deals');
    });

    event.preventDefault;

  });
}
