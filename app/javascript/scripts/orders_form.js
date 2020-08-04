$(document).on('turbolinks:load', function() {
  const textArea = $('textarea');
  const charCounter = $('#char-counter');
  textArea.on('input', () => {
    let chars = 140 - textArea.val().length;
    charCounter.text(chars);
  })

  const newAddressButton = $('#new-address-btn');
  const newAddressDiv = $('#new-address-div');
  const radioButtons = $('input[type=radio]');
  if (newAddressButton) {
    newAddressDiv.hide();
    newAddressDiv.toggleClass('showing');
  }

  newAddressButton.click(() => {
  	newAddressDiv.toggle();
    if (newAddressDiv.hasClass('showing')) {
      newAddressButton.html('<i class="material-icons">add_circle_outline</i> Add new address</span>');
    } else {
      newAddressButton.html('<i class="material-icons">remove_circle_outline</i> Hide address fields</span>');
      radioButtons.prop('checked', false);
    }
    newAddressDiv.toggleClass('showing');
  })

});
