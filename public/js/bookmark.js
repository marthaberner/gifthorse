(function () {

  var result = window.confirm('Do you want to add this page to your GiftHorse account?');

  if (result) {
    document.location = 'http://localhost:3000/api/bookmarks?title=' + document.title + "&url=" + location.href;
  }

})();