// Initializes all of the necessary Materialize framework components for functionality.


// Initialize Hamburger Menu
document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.sidenav');
  var instances = M.Sidenav.init(elems, {edge: "right"});
});

// Initialize Form Select
document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('select');
  var instances = M.FormSelect.init(elems, {});
});

// Initializes Tabs
document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.tabs');
  var instance = M.Tabs.init(elems, {});
});