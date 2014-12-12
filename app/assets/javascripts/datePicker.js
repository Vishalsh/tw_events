function applyDatePicker() {

  var $datePicker = $('.date-picker');

  $datePicker.datepicker({
    autoclose: true,
    startDate: '-0m',
    format: 'dd/mm/yyyy'
  });

}

$(document).on('ready', applyDatePicker);
$(document).on('page:load', applyDatePicker);
