$(document).ready(function() {

  $(document).on('submit', '#favorite-button', function(e) {
    e.preventDefault();
    form = $(this)
    $.ajax({
      url: form.attr('action'),
      method: form.attr('method'),
      data: form.serialize(),
      success: function(response) {
        $('#favorite-button-container').html(response);
      }
    })

  })

})