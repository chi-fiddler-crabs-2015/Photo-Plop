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

  $(document).on('submit', '#image-password-form', function(e) {
    form = $(this);
    $.ajax({
      url: form.attr('action'),
      method: form.attr('method'),
      data: form.serialize(),
      success: function(response) {
        $('#upload-photo-box').html(response);
      }
    })
  })

})