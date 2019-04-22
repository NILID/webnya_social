$ ->
  set = $('#desktop')
  set_x = set.offset().left
  set_y = set.offset().top

  $('.drag-icon').each (i) ->
    $(this).css
      'top': $(this).data('get-y')
      'left': $(this).data('get-x')

  $('#desktop .drag-icon').draggable
    opacity: 0.35
    containment: "html"
    stack: $('#desktop .drag-icon')
    stop: (event, ui) ->
      pos_x = ui.offset.left - set_x
      pos_y = ui.offset.top - set_y
      icon_id = ui.helper.data('icon-id')
      $.ajax
        type: 'POST'
        url: 'icons/update_position'
        data:
          xposition: pos_x
          yposition: pos_y
          id: icon_id

  $('body').vegas slides: [ { src: $('body').data('bg') } ]