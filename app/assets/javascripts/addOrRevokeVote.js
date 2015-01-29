var bindToVote = function () {

  if (!$(".vote").hasClass('vote-disabled')) {
    $(".vote").click(function (e) {
      e.preventDefault();
      var target = $(this);
      var id = target.attr('data-id');
      if (target.hasClass('vote-open')) {
        addVoteForTopic(id, target)
      }
      else {
        revokeVoteFromTopic(id, target)
      }
    });
  }
};

var addVoteForTopic = function (id, target) {

  HttpUtils.get('/topics/vote_for/' + id, 'html', {success: successCallback});

  function successCallback() {
    target.addClass('vote-cast').removeClass('vote-open');
  }
}

var revokeVoteFromTopic = function (id, target) {

  HttpUtils.get('/topics/revoke_vote/' + id, 'html', {success: successCallback});

  function successCallback() {
    target.addClass('vote-open').removeClass('vote-cast');
  }
}

$(document).ready(bindToVote);
$(document).on('page:load', bindToVote);