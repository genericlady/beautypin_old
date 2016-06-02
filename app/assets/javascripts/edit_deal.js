$(function() {
  onDealEditFormSubmit();
});

function onDealEditFormSubmit() {
  $('button#dealFormSubmit').click(function(event) {
    event.preventDefault;
    let url = $('.edit_deal').attr('action');
    let dealParams = $('#dealForm').serializeArray();

    $.post(url, dealParams);
  });
}
