do ($ = jQuery) ->
  $.fn.slidecast = ->
    @each ->

      slides = []
      offset = 0
      $('.slide', @).hide().each ->
        slides.push time: offset, element: @
        duration = parseInt $(@).data 'duration'
        offset += duration

      audioElement = $(@).find('audio').get 0
      tid = null # timeout id

      update = ->
        t = Math.floor 1000 * audioElement.currentTime
        i = slides.length - 1
        while t < slides[i].time then i--
        $('#presentation .slide').hide()
        $(slides[i].element).show()
        clearTimeout tid
        tid = null
        if i < slides.length - 1
          tid = setTimeout update, 1000 * (slides[i].time - t)
        return

      update()

      $('audio', @)
        .on('playing', update)
        .on('pause',   update)
        .on('seeked',  update)
