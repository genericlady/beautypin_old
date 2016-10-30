var Deal = (function() {

  var renderIndex = (deals) => {
    var context = { 'deals': deals };
    clearHTML($('main'));
    $('main').append(HandlebarsTemplates['deals/index'](context));
  };

  var renderShow = (json) => {
    clearHTML($('main'));
    $('main').append(HandlebarsTemplates['deals/show'](json));
  };

  var public = {
    renderIndex: renderIndex,
     renderShow: renderShow
  };

  return public;
}());

$(function() {
  onSortByDiscount();
  onDealsShow();
});

function onSortByDiscount() {
  $('body').on("click", 'a.sort-by-discount', function(event) {
    var searchCriteria = $( '#lastSearch' ).val();
    $.get('/sort_by_discount', { search: searchCriteria }, function(response) {
      Deal.renderIndex(response);
    });
    event.preventDefault();
  });

}

function onDealsShow() {
  $('body').on("click", '.deals-show', function(event) {

    var options = { url: this.href, dataType: "json", method: "GET" }
    $.ajax(options).success(function(json) {

      Deal.renderShow(json)

    }).fail(function(response) {
      console.log('sorry something went wrong' + response);
    });

    event.preventDefault();
  });

}

function clearHTML(element) {
  element.html('');
}
