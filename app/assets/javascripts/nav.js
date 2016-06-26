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
  $('body').on("click", '[data-nav-deals]', function(event) {
    var tableRows = '';
    var url = this.href;

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

      var mainElement = $('main');
      var tableDeals = Deal.prototype.renderTable(tableRows);

      clearHTML($('#flash'));
      mainElement.html(tableDeals);

    }).fail(function() {
      console.log('Ajax call fail on /deals');
    });

    event.preventDefault;
  });
}
