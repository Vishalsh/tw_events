var getEventDetails = function () {

  $(".event-name").on('click', function (e) {
    $("#get_event_details").remove();
    $.ajax({
      url: '/events/' + $(this).data("id"),
      type: 'GET',
      crossDomain: true,
      dataType: 'html',
      success: function (data) {
        $(data).modal('show');
      }
    })
  });
};

$(document).ready(getEventDetails);
$(document).on('page:load', getEventDetails);