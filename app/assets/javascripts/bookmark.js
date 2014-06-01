(function(){

  // the minimum version of jQuery we want
  var v = "1.3.2";

  // check prior inclusion and version
  if (window.jQuery === undefined || window.jQuery.fn.jquery < v) {
    var done = false;
    var script = document.createElement("script");
    script.src = "http://ajax.googleapis.com/ajax/libs/jquery/" + v + "/jquery.min.js";
    script.onload = script.onreadystatechange = function(){
      if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete")) {
        done = true;
        initMyBookmarklet();
      }
    };
    document.getElementsByTagName("head")[0].appendChild(script);
  } else {
    initMyBookmarklet();
  }

  function initMyBookmarklet() {
    (window.myBookmarklet = function() {

      var Bookmark = {
        confirm: function confirm() {
          var result = window.confirm('This page is : ' + GiftHorse.title() + '\nThe URL is : ' + GiftHorse.location());

          if (result) {
            var params = {bookmark: {title: GiftHorse.title, url: GiftHorse.location()}};
            $.post('http://localhost:3000/bookmarks', params);
          }
        }
      }

      GiftHorse = {
        location: function () {
          return location.href;
        },

        title: function () {
          return document.title
        }
      }
      Bookmark.confirm();
    })();
  }

})();