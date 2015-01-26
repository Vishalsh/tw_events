var getEventMessage = function () {

  $(".event-message").on('click', function (e) {
    var event_id = $(this).data('id');
    $.ajax({
      url: '/events/' + event_id + '/message',
      type: 'GET',
      crossDomain: true,
      dataType: 'html',
      success: function (data) {
        $(data).modal('show');
      },
      complete: function () {
        $('.submit-message').on('click', updateMessage(event_id));
      }
    })
  });
};

var updateMessage = function (event_id) {
  return function () {
    var valueToSubmit = $(".message").val();
    $.ajax({
      url: '/events/' + event_id + '/message/?value=' + valueToSubmit,
      type: 'PUT',
      success: function () {
        window.location.replace("/events");
      },
      error: function (errors) {
        $('.alert').show();
      }
    });
  }
};


$(document).ready(getEventMessage);
$(document).on('page:load', getEventMessage);
