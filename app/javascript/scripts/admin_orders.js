$(document).on('turbolinks:load', function() {
  const orderHeaderDivs = document.querySelectorAll('.admin-order-header-wrapper');

  function toggleInfoDiv(e) {
    this.nextElementSibling.classList.toggle('hide');
  }

  orderHeaderDivs.forEach(div => div.addEventListener('click', toggleInfoDiv))


});