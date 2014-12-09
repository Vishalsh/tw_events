$(function () {
  $('.date-picker').datepicker().on('changeDate', function (ev) {
    $(this).datepicker('hide');
  });
});
