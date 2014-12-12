function applyDatePicker() {

  var $datePicker = $('.date-picker');

  $datePicker.datepicker().on('changeDate', function () {
    $(this).datepicker('hide');
  });

  $datePicker.on('focus', function () {
    $datePicker.datepicker('hide');
    $(this).datepicker('show');
  });

  $("input.form-control").on('keydown', function (e) {
    var keyCode = e.keyCode || e.which;
    var escKey = 27;
    if (keyCode == escKey) {
      $datePicker.datepicker('hide');
    }
  });
}

$(document).on('ready', applyDatePicker);
$(document).on('page:load', applyDatePicker);
