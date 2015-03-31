$(document).ready(function() {

  $('#album-show-edit-button').on('click', function(e) {
    e.preventDefault();
    link = $(this);

    $.ajax({
      url: link.attr('href'),
      method: 'get',
      success: function(response) {
        $("#album-show-title").html(response)
      }
    });
  })

  $('#album-show-title').on('submit', '#update-album-form', function(e) {
    e.preventDefault();
    form = $(this);

    $.ajax({
      url: form.attr('action'),
      method: form.attr('method'),
      data: form.serialize(),
      success: function(response) {
        $("#album-show-title").html(response)
      }
    })
  })
})