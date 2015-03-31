$(document).ready(function() {

  $(document).on('click', '#favorite-button-container a', function(e) {
    e.preventDefault();
    form = $(this)
    $.ajax({
      url: form.attr('href'),
      method: form.attr('method'),
      data: form.attr('params'),
      success: function(response) {
        $('#favorite-button-container').html(response)
      }
    })

  })

})