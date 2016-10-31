$(function() {
  onSortByDiscount();
  onDealsShow();
});

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

function onSortByDiscount() {
  $('body').on("click", 'a.sort-by-discount', function(event) {
    var searchCriteria = $( '#lastSearch' ).val();

    getSortByDiscount(searchCriteria).then(
      (response) => {
        Deal.renderIndex(response);
      }
    );

    event.preventDefault();
  });

}

function getSortByDiscount(searchCriteria) {
  return $.get('/sort_by_discount', { search: searchCriteria }, function(response) {
    return response;
  });
}

function onDealsShow() {
  $('body').on("click", '.deals-show', function(event) {

    var ajaxParams = { url: this.href, dataType: "json", method: "GET" }
    
    getDealsShow(ajaxParams).then(
      (response) => {
        Deal.renderShow(response);
      }
    ).fail(function(response) {
      console.log('sorry something went wrong' + response);
    });

    event.preventDefault();
  });
}

function getDealsShow(ajaxParams) {
  return $.ajax(ajaxParams).success(function(json) {
    return json
  }); 
}

function clearHTML(element) {
  element.html('');
}
