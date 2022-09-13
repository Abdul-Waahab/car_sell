bind_show_image = ->
  post_picture = document.querySelector('#post_pictures')
  post_picture.addEventListener 'change', ->
    debugger
    if post_picture.files && post_picture.files[0]
      reader = new FileReader
      reader.onload = (e) ->
        $('#img_prev').attr('src', e.target.result).width(150).height 150
      reader.readAsDataURL post_picture.files[0]

$(document).on 'turbolinks:load', ->
  bind_show_image()