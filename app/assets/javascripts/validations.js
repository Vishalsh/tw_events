function validations() {

  var $eventForm = $("#new_event"),
      $eventDate = $('#event_event_date'),
      $submissionCloseDate = $('#event_submission_close_date'),
      $votingEndDate = $('#event_voting_close_date'),
      eventDateValue, submissionEndDateValue, votingEndDateValue;

  $eventForm.on('submit', function() {

    eventDateValue = formatDateInDdMmYyyy($eventDate.val());
    submissionEndDateValue = formatDateInDdMmYyyy($submissionCloseDate.val());
    votingEndDateValue = formatDateInDdMmYyyy($votingEndDate.val());

    if(compareDates(eventDateValue, submissionEndDateValue)) {
      $submissionCloseDate.setCustomValidity("Should be after event date");
    }
  });

  function formatDateInDdMmYyyy(date) {
    var split_array = date.split("/");
    return Date.parse(split_array[1] + "/" + split_array[0] + "/" + split_array[2]);
  }

  function compareDates(date1, date2) {
    return date1 > date2;
  }
}

$(document).on('ready', validations);
$(document).on('page:load', validations);
