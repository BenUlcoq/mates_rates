// Address Autocomplete using Google API


// Waits for the page to be loaded
document.addEventListener("DOMContentLoaded", function() {
 
  //Initializes variables
  var placeSearch, autocomplete;

  // Function to provide autocomplete suggestions for addresses.
  function initAutocomplete() {

    // Create the autocomplete object, restricting the search predictions to
    // geographical location types.
    autocomplete = new google.maps.places.Autocomplete(
        document.getElementById('autocomplete'), {types: ['geocode'], componentRestrictions: {country: 'au'}});
  
    // Avoid paying for data that you don't need by restricting the set of
    // place fields that are returned to just the address components.
    autocomplete.setFields(['formatted_address']);
  
    // When the user selects an address from the drop-down, populate the
    // address fields in the form.
    autocomplete.addListener('place_changed', fillInAddress);
  }
  
  function fillInAddress() {

    // Get the place details from the autocomplete object.
    var place = autocomplete.getPlace();

    // Populates the form once an autocomplete value is selected.
    document.getElementById('autocomplete').value = place.formatted_address

  }
  
  //Initializes the function.
  initAutocomplete();
});