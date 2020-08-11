import noImage from '../images/no_image.png';

const setTitle = (url, element) => {
  const proxyurl = "https://cors-anywhere.herokuapp.com/";
  fetch(proxyurl + url)
    .then(response => response.text())
    .then((contents) => {
      const regex = new RegExp('<title>(.*?)</title>');
      let title = regex.exec(contents)[0];
      title = title.replace(/<title>/,"");
      title = title.replace(/<\/title>/,"");
      element.text(title);

    })
    .catch(function (err) {
      element.text("title not found at given URL");
      console.log("Something went wrong!", err);
    });
}

const addHiddenInput = () => {
  
}

const addInput = () => {
  
}

$(document).on('turbolinks:load', function() {
  const $urlInput = $('#article_url');
  const $imgInput = $('#article_img_src');
  const $previewDiv = $('.articlePreview');
  const $previewImage = $('#previewImage');
  const $previewTitle = $('#previewTitle');

  $previewImage.on('error', function(e) {
    this.src = noImage;
  	console.log(this);
  });

  $urlInput.on('input', function(e) {
    setTitle(e.target.value, $previewTitle);
  });

  $imgInput.on('input', function(e) {
  	$previewImage.attr('src', e.target.value);
  });
});