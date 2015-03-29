$(document).ready(function() {

  $('#upload_button').on('click', function(e) {
    form = $(this);
    $.ajax({
      url: form.attr('href'),
      method: "get",
      success: function(response) {
        $('#upload-photo-box').append(response);
      }
    })
  })

})