var getTopicDetails = function () {

  $(".topic-title").on('click', function (e) {
    $("#get_topic_details").remove();
    HttpUtils.get('/topics/' + $(e.target).attr("data-id"), 'html', {success: successCallback});

    function successCallback(data) {
      $(data).modal('show');
    }
  });
}

$(document).ready(getTopicDetails)
$(document).on('page:load', getTopicDetails)
