var editTalk = function () {
  $(".edit-talk").click(function () {
    var id = $(this).attr("data-edit-id");
    var event_name = $('.event_name').val();
    var event_id = $('.event_id').val();

    HttpUtils.get('/topics/' + id + '/edit', 'html', {success: successCallback, complete: completeCallback});
    function successCallback(data) {
      $(data).modal('show');
    }

    function completeCallback() {
      setTimeout(function () {
        $('#tag1').tagsInput({
          'width': '100%',
          'defaultText': 'Add a speaker',
          'onChange': function () {
            var tagCount = $(".tagsinput .tag").length;
            tagInput = $(".tagsinput input")
            tagInput.attr('maxlength', 30);
            if (tagCount >= 5) {
              tagInput.hide();
            } else {
              tagInput.show().focus();
            }
          }

        });
        $("#talk").on('hidden.bs.modal', function () {
          $(this).remove();
          window.location.replace("/" + event_id + "/" + event_name + "/talks");
        })
        $("#submit_talk").click(updateTalk(id, event_name, event_id));
        $(".close").click(hideAlerts);
        $("#topic_title").focus();
      }, 500);
    }
  });
};

var updateTalk = function (id, event_name, event_id) {
  return function (e) {
    e.preventDefault();
    hideAlerts();
    hideErrors();
    var valuesToSubmit = $("#edit_topic_" + id).serialize();
    HttpUtils.put('/topics/' + id, valuesToSubmit, 'json', {success: successCallback, error: errorCallback});

    function successCallback() {
      window.location.replace("/" + event_id + "/" + event_name + "/talks");
    }

    function errorCallback(errors) {
      $(".alert-danger").show();
      highlightErrors(errors)
    }
  }

}

var hideAlerts = function () {
  $(".alert").hide();
}

$(document).ready(editTalk)
$(document).on('page:load', editTalk)
