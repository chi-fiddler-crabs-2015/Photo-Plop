$(document).ready(function() {

  $('#create-new-album').on('click', function(e) {
    link = $(this)

    $.ajax({
      url: link.attr('href'),
      method: 'get',
      success: function(response) {
        $('body').append(response)
      }
    })
  })

})