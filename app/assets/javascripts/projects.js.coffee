$ ->
  $('.project-tile').hover ->
    $(this).children('.project-title').fadeToggle(200)

  $('.project-thumbnails img').on 'click', ->
    $(this).closest('.modal-body').find('.featured-image').attr('src', $(this).attr('data-url'))