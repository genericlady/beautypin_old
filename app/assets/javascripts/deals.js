$(function() {
  onDealUpdateButton();
  onSortByDiscount();
  onDealEditButton();
  onDataShow();
});

var Deal = function(attributes) {
  this.id = attributes.id
  this.title = attributes.title;
  this.discount = attributes.discount;
  this.description = attributes.description;
}

Deal.prototype.getTemplate = Handlebars.getTemplate;
// Deal.getTemplate(model, filename);
Deal.prototype.renderTR = function() {
  var elements = '';
  let showLink = '<a href="#" data-deal-show="/deals/' + this.id + '" data-remote="true">' + this.title + '</a>';
  elements += '<tr>';
  elements += '<td>' + this.beautyPlace.name  + '</td>';
  elements += '<td>' + showLink + '</td>';
  elements += '<td>' + this.discount + '</td>';
  elements += '<td>' + this.description;
  elements += '</tr>';
  return elements;
};

Deal.prototype.renderTable = function(tableRows) {
  var elements = [];
  elements.push('<table id="dealsTable" class="table">');
  elements.push('<tr><th>place</th><th>title</th>');
  elements.push('<th><a href="/sort_by_discount" data-remote="true"></a></th>');
  elements.push('<th>description</th>');
  elements.push('</tr>');
  elements.push('<tbody id="dealsTableBody">');
  elements.push(tableRows);
  elements.push('</tbody>');
  elements.push('</table>')
  return elements.join('');
};

Deal.prototype.renderShow = function() {
  var elements = '';
  let url = '/deals/' + this.id + '/edit'
  elements += '<ul>';
  elements += '<li>Place of Beauty: ' + this.beautyPlace.name + '</li>';
  elements += '<li>title: ' + this.title + '</li>';
  elements += '<li>description: ' + this.description + '</li>';
  elements += '<li>discount: ' + this.discount + '</li>';
  elements += '</ul>';
  return elements;
};

function onSortByDiscount() {
  $( 'a[sort-by-discount]' ).on("click", function(event) {

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

    event.preventDefault;
  });
}

function onDealEditButton() {
  $('body').on('click', 'a[data-edit]', function(event) {
    url = this.href;
    $.ajax({
      url: url,
      dataType: 'json',
      method: 'GET'
    }).success(function(response) {
      // render edit
      // deal.renderEditPartial()
    }).fail(function(response) {
      console.log('Something went wrong: ' + response);
    });

    event.stopPropogation;
  });
}

function onDealUpdateButton() {
  $( 'form.edit_deal' ).on("submit", function(event) {
      let $form = $( this );
      let url = $form.attr('action');
      let dealParams = $form.serializeArray();

      $.post(url, dealParams).done(function(html){
        let mainElement = $('body > main');
        clearHTML(mainElement);
        mainElement.append(html);
      });

      event.preventDefault;

    });
}

function onDataShow() {
  $('body').on("click", "a[data-deal-show]", function(event) {
    url = this.dataset.dealShow;
    let mainElement = $('body > main');

    $.ajax({
      url: url,
      dataType: "json",
      method: "GET"
    }).success(function(json) {
      let deal = new Deal(json['deal']);
      deal.beautyPlace = new BeautyPlace(json['beauty_place']);
      let html = deal.renderShow();
      clearHTML(mainElement);
      mainElement.append(html);

    }).fail(function(response) {
      console.log('sorry something went wrong' + response);
    });

  });

}

function clearHTML(element) {
  element.html('');
}
