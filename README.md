The bloody thing is in an early stage of development.  I may abandon it anytime
or completely change the API, but here's how I envision its usage:

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
