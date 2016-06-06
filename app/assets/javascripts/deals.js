$(function() {
  // on click events
  onDealEditButton();
  onDealUpdateButton();
  onSortByDiscount();
});

var Deal = function(attributes) {
  this.title = attributes.title;
  this.discount = attributes.discount;
  this.description = attributes.description;
}

Deal.prototype.renderTR = function() {
  let elements = '';
  elements += '<tr>';
  elements += '<td>' + this.beauty_place.name + '</td>';
  elements += '<td>' + this.title + '</td>';
  elements += '<td>' + this.discount + '</td>';
  elements += '<td>' + this.description;
  elements += '</tr>';
  return elements;
};

function onSortByDiscount() {
  $( 'a[sort-by-discount]' ).on("click", function(event) {
    event.preventDefault;

    let searchCriteria = $( '#lastSearch' ).val();
    let note = '';
    let dealsTableBody = $( '#dealsTableBody' );

    $.get(this.href, { search: searchCriteria }, function(response) {
      for (var i = 0; i < response.deals.length; i++) {
        let response = response.deals[i];
        let deal = new Deal($response);
        deal.beauty_place = new BeautyPlace(response.beauty_place);
        note += deal.renderTR();
      };
      clearHTML(dealsTableBody);
      dealsTableBody.html(note);
    });

  });
}

function onDealEditButton() {
  let link = $( 'a[edit-deal]' );

  link.on('click', function() {
    debugger;
  })
}

function onDealUpdateButton() {
  $( 'form.edit_deal' ).on("submit", function(event) {
      event.preventDefault;
      let $form = $( this );
      let url = $form.attr('action');
      let dealParams = $form.serializeArray();

      $.post(url, dealParams).done(function(html){
        let mainElement = $( 'main' );
        clearHTML(mainElement);
        mainElement.append(html);
      });
    });
}

function clearHTML(element) {
  element.html('');
}
