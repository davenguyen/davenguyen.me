$ ->
  $('.skill').hover (->
    $(this).find('.skill-detail').show()
  ), (->
    $(this).find('.skill-detail').hide()
  )
