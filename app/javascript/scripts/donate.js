$(document).on('turbolinks:load', function() {
  const $donateForm = $("#paypal-donate");
  $donateForm.click(function() {
    document.cookie = `redirect=${window.location.href};`;
  });
});
