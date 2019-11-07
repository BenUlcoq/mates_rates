
function createDatePicker(dates) {
  console.log('here')
  const el = document.getElementById('dates')
  flatpickr(el, {
    mode: "range",
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    minDate: "today",
    disable: dates,
    "locale": {
        "firstDayOfWeek": 1 
    }
  })
}