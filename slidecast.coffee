do ($ = jQuery) ->
  $.fn.slidecast = (opts = {}) ->
    opts.slideSelector ?= '.slide'
    opts.audioSelector ?= 'audio'

    @each ->

      $slides = $ opts.slideSelector, @
      slides = []
      offset = 0
      $slides.hide().each ->
        slides.push time: offset, element: @
        duration = parseInt $(@).data 'duration'
        offset += duration

      $audio = $ opts.audioSelector, @
      audioElement = $audio.get 0
      tid = null # timeout id

      update = ->
        t = Math.floor 1000 * audioElement.currentTime
        i = slides.length - 1
        while t < slides[i].time then i--
        $slides.hide()
        $(slides[i].element).show()
        clearTimeout tid
        tid = null
        if i < slides.length - 1
          tid = setTimeout update, 1000 * (slides[i].time - t)
        return

      update()

      $audio.on 'playing pause seeked', update
