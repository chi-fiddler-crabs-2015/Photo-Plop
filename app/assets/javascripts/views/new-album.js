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

  $(document).on('submit', '#new-album-form', function() {
    form = $(this)
    console.log(form.attr('action'))
    console.log(form.attr('method'))
    $.ajax({
      url: form.attr('action'),
      method: form.attr('method'),
      success: function(response) {
        console.log(response)
      }
    })

  })
})