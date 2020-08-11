/*function httpGet(theUrl) {
    if (window.XMLHttpRequest) {
      // code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        return xmlhttp.responseText;
      }
    }
    xmlhttp.open("GET", theUrl, true );
    xmlhttp.send();    
}
*/

const setTitle = (url, element) => {
  const proxyurl = "https://cors-anywhere.herokuapp.com/";
  fetch(proxyurl + url)
    .then(response => response.text())
    .then((contents) => {
      const regex = new RegExp('<title>(.*?)</title>');
      let title = regex.exec(contents)[0];
      title = title.replace(/<title>/,"");
      title = title.replace(/<\/title>/,"");
      console.log(title);
      console.log(element);
      element.text(title);
    })
    .catch(function (err) {
        console.log("Something went wrong!", err);
    });
}

$(document).on('turbolinks:load', function() {
  const $urlInput = $('#article_url');
  const $imgInput = $('#article_img_src');
  const $previewDiv = $('.articlePreview');
  const $previewImage = $('#previewImage');
  const $previewTitle = $('#previewTitle');

  $urlInput.on('input', function(e) {
    setTitle(e.target.value, $previewTitle);
  });
  $imgInput.on('input', function(e) {
  	$previewImage.attr('src', e.target.value);
    $previewDiv.slideDown('slow');
  });
});