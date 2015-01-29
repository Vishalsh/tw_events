var HttpUtils = (function () {

  function ajax(url, type, data, datatype, callbacks) {
    $.ajax({
      url: url,
      type: type,
      data: data,
      dataType: datatype,
      success: callbacks.success,
      error: callbacks.error,
      complete: callbacks.complete
    });
  }

  return {
    get: function (url, datatype, callbacks) {
      ajax(url, 'GET', {}, datatype, callbacks);
    },

    post: function (url, data, datatype, callbacks) {
      ajax(url, 'POST', data, datatype, callbacks);
    },

    put: function(url, data, datatype, callbacks) {
      ajax(url, 'PUT', data, datatype, callbacks);
    }
  }

})();