$(function() {
  onNavDeals();
});

function onNavDeals() {
  $('body').on("click", '[data-nav-deals]', function(event) {

    $.ajax({
      url: this.href,
      dataType: "json",
      method: "GET"
    }).success(function(deals) {

      renderDealsIndex(deals);

    }).fail(function() {
      console.log('Ajax call fail on /deals');
    });

    event.preventDefault;
  });
}

function renderDealsIndex(deals) {
  var context = { 'deals': deals };
	clearHTML($('main'));
  $('main').append(HandlebarsTemplates['deals/index'](context));
}
