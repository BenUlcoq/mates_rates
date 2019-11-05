

function getDates(){
  return document.getElementById('dates').value;
}

function applyDates(dates){

  // "2019-11-22 to 2019-11-25"

    var values = dates.match(/\d{1,4}([.\-/])\d{1,2}([.\-/])\d{1,4}/g)

    document.getElementById('start_date').value = values[0]
    document.getElementById('end_date').value = values[1]

}

document.addEventListener('DOMContentLoaded', function(){
  document.getElementById('dates').addEventListener('change', function(){
    applyDates(getDates());
  })
})
