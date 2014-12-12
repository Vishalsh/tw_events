function validations() {

  var $submitEvent = $("#submit_event"),
    $eventDate = $('#event_event_date'),
    $submissionCloseDate = $('#event_submission_close_date'),
    $votingCloseDate = $('#event_voting_close_date'),
    eventDateValue, submissionEndDateValue, votingEndDateValue;

  $submitEvent.on('click', function (e) {

    clearValidations();
    eventDateValue = formatDateInDdMmYyyy($eventDate.val());
    submissionEndDateValue = formatDateInDdMmYyyy($submissionCloseDate.val());
    votingEndDateValue = formatDateInDdMmYyyy($votingCloseDate.val());

    if (compareDates(eventDateValue, submissionEndDateValue)) {
      $submissionCloseDate[0].setCustomValidity("Should be after event date");
    }

    if (compareDates(submissionEndDateValue, votingEndDateValue)) {
      $votingCloseDate[0].setCustomValidity("Should be after submission close date");
    }
  });

  function formatDateInDdMmYyyy(date) {
    var split_array = date.split("/");
    return Date.parse(split_array[1] + "/" + split_array[0] + "/" + split_array[2]);
  }

  function compareDates(date1, date2) {
    return date1 > date2;
  }

  function clearValidations() {
    $submissionCloseDate[0].setCustomValidity('');
    $votingCloseDate[0].setCustomValidity('');
  }
}

$(document).on('ready', validations);
$(document).on('page:load', validations);
