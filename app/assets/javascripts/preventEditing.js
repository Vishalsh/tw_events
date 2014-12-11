function preventEditing() {
  $('input.no-editing').on('keydown', function (e) {
    var keyCode = e.keyCode || e.which;
    var tabKey = 9;
    if (!(keyCode === tabKey)) {
      if (e.shiftKey) {
        return false;
      } else {
        return false;
      }
    }
  });
}

$(document).on('ready', preventEditing);
$(document).on('page:load', preventEditing);
