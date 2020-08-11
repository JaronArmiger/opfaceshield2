import noImage from '../images/no_image.png';

$(document).on('turbolinks:load', function() {
  const $urlInput = $('#article_url');
  const $titleInput = $('#article_title');
  const $imgInput = $('#article_img_src');
  const $previewDiv = $('.articlePreview');
  const $previewImage = $('#previewImage');
  const $previewTitle = $('#previewTitle');


  const setTitle = (url) => {
  const proxyurl = "https://cors-anywhere.herokuapp.com/";
  fetch(proxyurl + url)
    .then(response => response.text())
    .then((contents) => {
      const regex = new RegExp('<title>(.*?)</title>');
      let title = regex.exec(contents)[0];
      title = title.replace(/<title>/,"");
      title = title.replace(/<\/title>/,"");
      $previewTitle.text(title);
      $titleInput.val(title);
    })
    .catch(function (err) {
      $previewTitle.text("invalid URL");
      console.log("Something went wrong!", err);
    });
  }

  $previewImage.on('error', function(e) {
    this.src = noImage;
  	console.log(this);
  });

  $urlInput.on('input', function(e) {
    setTitle(e.target.value);
  });

  $titleInput.on('input', function(e) {
  	console.log(this);
  	$previewTitle.text(this.value);
  })

  $imgInput.on('input', function(e) {
  	$previewImage.attr('src', e.target.value);
  });
});