
// Function to disable all turbolinks for anchors as it doesn't play nice with javascript
// Disabled with JS to avoid removing turbolinks completely in order to improve loading.
document.addEventListener("DOMContentLoaded", function() {

var links = document.links;

for (var i = 0, l = links.length; i < l; i++) {
  var el = links[i];
  // console.log(el)
  el.setAttribute("data-turbolinks", "false")
}

});