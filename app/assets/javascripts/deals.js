$(function() {
  onDealUpdateButton();
  onSortByDiscount();
  onDealEditButton();
  onDataShow();
});

var Deal = function(attributes) {
  this.title = attributes.title;
  this.discount = attributes.discount;
  this.description = attributes.description;
}

Deal.prototype.renderTR = function() {
  let elements = '';
  elements += '<tr>';
  elements += '<td>' + this.beautyPlace.name + '</td>';
  elements += '<td>' + this.title + '</td>';
  elements += '<td>' + this.discount + '</td>';
  elements += '<td>' + this.description;
  elements += '</tr>';
  return elements;
};

Deal.prototype.renderTable = function(tableRows) {
  let elements = [];
  elements.push('<tbody id="dealsTableBody">');
  elements.push(tableRows);
  elements.push('</tbody>');
  return elements.join('');
};

Deal.prototype.renderShow = function() {
  let elements = '';
  elements += '</ul>';
  elements += '<li>Place of Beauty: ' + this.beautyPlace.name + '</li>';
  elements += '<li>title: ' + this.title + '</li>';
  elements += '<li>description: ' + this.description + '</li>';
  elements += '<li>discount: ' + this.discount + '</li>';
  elements += '<ul>';
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
        deal.beautyPlace = new BeautyPlace(response.beautyPlace);
        note += deal.renderTR();
      };
      clearHTML(dealsTableBody);
      dealsTableBody.html(note);
    });

  });
}

function onDealEditButton() {
  $('a[data-edit]').on('click', function(e) {
    e.stopPropogation;
  });
}

function onDealUpdateButton() {
  $( 'form.edit_deal' ).on("submit", function(event) {
      let $form = $( this );
      let url = $form.attr('action');
      let dealParams = $form.serializeArray();

      $.post(url, dealParams).done(function(html){
        let mainElement = $( 'main' );
        clearHTML(mainElement);
        mainElement.append(html);
      });

      event.preventDefault;

    });
}

function onDataShow() {
  $("[data-deal-show]").on("click", function(event) {
    url = this.dataset.dealShow;

    $.ajax({
      url: url,
      dataType: "json",
      method: "GET"
    }).success(function(json) {
      var deal = new Deal(json['deal']);
      deal.beautyPlace = new BeautyPlace(json['beauty_place']);
      // deal needs the name of the salon it belongs to
      $('main').html(deal.renderShow());
    });
    event.preventDefault;

  });

}

function clearHTML(element) {
  element.html('');
}
