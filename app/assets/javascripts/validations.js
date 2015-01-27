function validations() {

  var $submitEvent = $("#submit_event"),
    $eventDate = $('#event_event_date'),
    $submissionCloseDate = $('#event_submission_close_date'),
    $votingCloseDate = $('#event_voting_close_date'),
    $avatar = $('#event_avatar');


  $submitEvent.on('click', function () {
    clearValidations();
    dateValidations();
    fileValidations();
  });


  function clearValidations() {
    setMessage($submissionCloseDate, '');
    setMessage($votingCloseDate, '');
    setMessage($avatar, '');
  }

  function dateValidations() {

    var eventDateValue = formatDateInDdMmYyyy($eventDate.val()),
      submissionEndDateValue = formatDateInDdMmYyyy($submissionCloseDate.val()),
      votingEndDateValue = formatDateInDdMmYyyy($votingCloseDate.val());

    if (compareDates(submissionEndDateValue, eventDateValue)) {
      setMessage($submissionCloseDate, 'Should be before event date');
    }

    if (compareDates(votingEndDateValue, eventDateValue)) {
      setMessage($votingCloseDate, 'Should be before event date');
    }

    if (compareDates(submissionEndDateValue, votingEndDateValue)) {
      setMessage($votingCloseDate, 'Should be after submission close date');
    }


  }

  function fileValidations() {
    var $avatar = $('#event_avatar'),
      file = $avatar[0].files[0];

    fileContentTypeValidation(file.type);
    fileSizeValidation(file.size);
  }


  function formatDateInDdMmYyyy(date) {
    var split_array = date.split("/");
    return Date.parse(split_array[1] + "/" + split_array[0] + "/" + split_array[2]);
  }

  function compareDates(date1, date2) {
    return date1 > date2;
  }

  function fileContentTypeValidation(type) {
    var validContentTypes = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'];
    if (validContentTypes.indexOf(type) == -1) {
      setMessage($avatar, 'Only jpg, png, gif file type supported');
    }
  }

  function fileSizeValidation(fileSize) {
    if (fileSize > 100000) {
      setMessage($avatar, 'File size should be less than 100kb');
    }
  }

  function setMessage(ele, message) {
    ele[0].setCustomValidity(message);
  }

}

$(document).on('ready', validations);
$(document).on('page:load', validations);
