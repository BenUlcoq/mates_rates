

function getDates(){
  return document.getElementById('dates').value;
}

function applyData(dates){

    var values = dates.match(/\d{1,4}([.\-/])\d{1,2}([.\-/])\d{1,4}/g)

    document.getElementById('start_date').value = values[0]
    document.getElementById('end_date').value = values[1]

    var start_date = new Date(values[0]); 
    var end_date = new Date(values[1]); 
      
    // To calculate the time difference of two dates 
    var Difference_In_Time = end_date.getTime() - start_date.getTime(); 
      
    // To calculate the no. of days between two dates 
    var days = Difference_In_Time / (1000 * 3600 * 24); 

    document.getElementById('price').value = days * document.getElementById('tool_price').value

}

document.addEventListener('DOMContentLoaded', function(){
  document.getElementById('dates').addEventListener('change', function(){
    applyData(getDates());
  })
})
