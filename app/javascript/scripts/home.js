$(document).on('turbolinks:load', function() {
  const homeHero = document.getElementById('home-hero');
  const container = document.querySelector('.container');
  if (homeHero) {
    container.style["margin-left"] = 0;
    container.style["margin-right"] = 0;
  }
});