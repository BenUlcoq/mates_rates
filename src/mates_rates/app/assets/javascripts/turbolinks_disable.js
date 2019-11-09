document.addEventListener("DOMContentLoaded", function() {

var links = document.links;

for (var i = 0, l = links.length; i < l; i++) {
  var el = links[i];
  // console.log(el)
  el.setAttribute("data-turbolinks", "false")
}

});