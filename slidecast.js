// Generated by CoffeeScript 1.6.2
(function() {
  (function($) {
    return $.fn.slidecast = function(opts) {
      var _ref, _ref1;

      if (opts == null) {
        opts = {};
      }
      if ((_ref = opts.slideSelector) == null) {
        opts.slideSelector = '.slide';
      }
      if ((_ref1 = opts.audioSelector) == null) {
        opts.audioSelector = 'audio';
      }
      return this.each(function() {
        var $audio, $slides, audioElement, offset, slides, tid, update;

        $slides = $(opts.slideSelector, this);
        slides = [];
        offset = 0;
        $slides.hide().each(function() {
          var duration;

          slides.push({
            time: offset,
            element: this
          });
          duration = parseInt($(this).data('duration'));
          return offset += duration;
        });
        $audio = $(opts.audioSelector, this);
        audioElement = $audio.get(0);
        tid = null;
        update = function() {
          var i, t;

          t = Math.floor(1000 * audioElement.currentTime);
          i = slides.length - 1;
          while (t < slides[i].time) {
            i--;
          }
          $slides.hide();
          $(slides[i].element).show();
          clearTimeout(tid);
          tid = null;
          if (i < slides.length - 1) {
            tid = setTimeout(update, 1000 * (slides[i].time - t));
          }
        };
        update();
        return $audio.on('playing pause seeked', update);
      });
    };
  })(jQuery);

}).call(this);
