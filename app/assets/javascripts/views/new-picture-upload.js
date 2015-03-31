var showing = false

$(document).ready(function() {

  $('#upload_button').on('click', function(e) {
    form = $(this);
    if(showing) {
      $('#to_append_to').html('')
      showing = false
    } else {
      $.ajax({
        url: form.attr('href'),
        method: "get",
        success: function(response) {
          $('#to_append_to').html(response);
        }
      })
      showing = true
    }
  })

  $(document).on('submit', '#image-password-form', function(e) {
    form = $(this);
    $.ajax({
      url: form.attr('action'),
      method: form.attr('method'),
      data: form.serialize(),
      success: function(response) {
        $('#to_append_to').html(response);
      }
    })
  })

})