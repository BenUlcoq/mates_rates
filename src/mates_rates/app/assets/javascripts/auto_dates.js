// Javascipt for autoformatting and filling out date fields for submission of a Rental.


// Grabs the datepicker values.
function getDates(){
  return document.getElementById('dates').value;
}


// Formats the datepicker values and updates the fields.
function applyData(dates){

    // Format dates
    var values = dates.match(/\d{1,4}([.\-/])\d{1,2}([.\-/])\d{1,4}/g)

    // Grab and sets the value of the fields.
    document.getElementById('start_date').value = values[0]
    document.getElementById('end_date').value = values[1]

    // Stores the values for calculation
    var start_date = new Date(values[0]); 
    var end_date = new Date(values[1]); 
      
    // To calculate the time difference of two dates 
    var Difference_In_Time = end_date.getTime() - start_date.getTime(); 
      
    // To calculate the no. of days between two dates 
    var days = Difference_In_Time / (1000 * 3600 * 24); 

    // Calculates and stores the price of the rental based on the length and price per day.
    document.getElementById('price').value = days * document.getElementById('tool_price').value

}

// Waits for the page to load before
document.addEventListener('DOMContentLoaded', function(){
  
  // Listens for when the datepicker is updated and runs the necessary functions
  document.getElementById('dates').addEventListener('change', function(){
    applyData(getDates());
  })
})
