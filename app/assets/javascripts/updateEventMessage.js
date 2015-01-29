var getEventMessage = function () {

  $(".event-message").on('click', function (e) {
    var event_id = $(this).data('id');

    HttpUtils.get('/events/' + event_id + '/message', 'html', {success: successCallback, complete: completeCallback});

    function successCallback(data) {
      $(data).modal('show');
    }

    function completeCallback() {
      $('.submit-message').on('click', updateMessage(event_id));
    }
  });
};

var updateMessage = function (event_id) {
  return function () {
    var valueToSubmit = $(".message").val();

    HttpUtils.put('/events/' + event_id + '/message/?value=' + valueToSubmit, '', '', {
      success: successCallback,
      error: errorCallback
    });

    function successCallback() {
      window.location.replace("/events");
    }

    function errorCallback(data) {
      $('.alert').show();
    }
  }
};


$(document).ready(getEventMessage);
$(document).on('page:load', getEventMessage);
