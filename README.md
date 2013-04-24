[Demo](http://ngn.github.io/jquery-html5-slidecast/)

# Usage

    <!-- HTML -->
    <div id="presentation">
        <div class="slide" data-duration="25000">Slide 1</div>
        <div class="slide" data-duration="73000">Slide 2</div>
        <div class="slide" data-duration="38000">Slide 3</div>
        <audio src="talk.ogg" controls></audio>
    </div>

    // JavaScript
    $('#presentation').slidecast();

As the current position in the audio changes, the slides will be shown and
hidden accordingly.
