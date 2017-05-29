# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@add_new_room = ->
  $('#add_room_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_room", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    panel.find('a.remove_room').on 'click', ->
      window.delete_one_room($(this))
      false    
    false

room_ready = ->
  window.add_new_room()
$(document).on 'page:load', room_ready # Включаем при ajax обновлении страницы
$(document).ready room_ready # Включаем при обычном обновлении страницы
