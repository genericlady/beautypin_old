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

      Deal.renderIndex(deals);
      
    }).fail(function() {
      console.log('Ajax call fail on /deals');
    });

    event.preventDefault;
  });
}

