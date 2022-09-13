# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
select_to_select2 = ->
  $('#post_city, #post_color').select2( { tags: true } )

$(document).on 'turbolinks:load', ->
  select_to_select2()