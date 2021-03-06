$(document).on('turbolinks:load', function() {
  let x = window.matchMedia("(max-width: 992px)");
  if (x.matches) {
    const orderHeaderDivs = document.querySelectorAll('.admin-order-header-wrapper');

    function toggleInfoDiv(e) {
      this.nextElementSibling.classList.toggle('hide');
    }
    orderHeaderDivs.forEach(div => div.nextElementSibling.classList.toggle('hide'));
    orderHeaderDivs.forEach(div => div.addEventListener('click', toggleInfoDiv));
  };
});