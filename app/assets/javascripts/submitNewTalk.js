var submitNewTalk = function () {
    $("#submit_new_talk").on('click', function (e) {

        var activeSidebarLink = $('.active');
        activeSidebarLink.removeClass('active');
        $.ajax({
            url: '/topics/new',
            type: 'GET',
            crossDomain: true,
            dataType: 'html',
            success: function (data) {
                $("#submit_new_talk").addClass('active');
                $(data).modal('show');

            },
            complete: function () {
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
                    $("#submit_talk").click(createTalk);
                    $(".close").click(hideAlerts);
                    $("#topic_title").focus();
                    $("#talk").on('hidden.bs.modal', function () {
                        $(this).remove();
                        $("tester").remove();
                        $("#submit_new_talk").removeClass('active');
                        activeSidebarLink.addClass('active');
                    })
                }, 500);
            }
        })
    });
}

var createTalk = function (e) {
    e.preventDefault();
    hideAlerts();
    hideErrors();
    var valuesToSubmit = $("#new_topic").serialize();
    var event_name = $('.event_name').val();
    var event_id = $('.event_id').val();

    $.ajax({
        url: '/topics?event_id=' + event_id,
        type: 'POST',
        data: valuesToSubmit,
        dataType: 'json',
        success: function (data) {
            window.location.replace("/" + event_name + "/talks");
        },
        error: function (errors) {
            $(".alert-danger").show();
            highlightErrors(errors)
        }
    })
}

var highlightErrors = function (errors) {
    var errorJson = JSON.parse(errors.responseText);
    for (var key in errorJson) {
        $("#topic_" + key).css('border-color', 'rgb(239, 91, 161)').css('box-shadow', '0 0 8px rgba(239, 91, 161, 0.6)');
    }
}

var hideErrors = function () {
    $("input.form-control").css('border-color', '#cccccc').css('box-shadow', 'none');
    $("input.form-control").focus($(this).css('box-shadow', '0 0 8px rgba(102, 175, 233, 0.6)'));
    $("textarea.form-control").css('border-color', '#cccccc').css('box-shadow', 'none');
    $("textarea.form-control").focus($(this).css('box-shadow', '0 0 8px rgba(102, 175, 233, 0.6)'));
}

$(document).ready(submitNewTalk)
$(document).on('page:load', submitNewTalk)
