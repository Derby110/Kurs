# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@delete_one_creator = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()

@del_all_creators = ->
  $('a.remove_creator').on 'click', ->
    window.delete_one_ru($(this))
    false
  false

@add_new_creator = ->
  $('#add_creator_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_creator", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    panel.find('a.remove_creator').on 'click', ->
      window.delete_one_creator($(this))
      false    
    false

creator_ready = ->
  window.add_new_creator()
  window.del_all_creators()
$(document).on 'page:load', creator_ready # Включаем при ajax обновлении страницы
$(document).ready creator_ready # Включаем при обычном обновлении страницы
