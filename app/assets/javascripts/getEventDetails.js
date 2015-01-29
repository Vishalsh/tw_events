var getEventDetails = function () {

  $(".event-name").on('click', function (e) {
    $("#get_event_details").remove();
    HttpUtils.get('/events/' + $(this).data("id"), 'html', {success: successCallback});

    function successCallback(data) {
      $(data).modal('show');
    }
  });
};

$(document).ready(getEventDetails);
$(document).on('page:load', getEventDetails);