function applyDatePicker() {
  $('.date-picker').datepicker().on('changeDate', function () {
    $(this).datepicker('hide');
  });
}

$(document).on('ready', applyDatePicker);
$(document).on('page:load', applyDatePicker);
