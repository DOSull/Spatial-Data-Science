// Full list of configuration options available here:
// https://github.com/hakimel/reveal.js#configuration
Reveal.initialize({
  controls: true,
  progress: true,
  loop: false,
  slideNumber: true,
  history: true,
  center: true,
  rollingLinks: false,
  previewLinks: false,
  viewDistance: 3,
  touch: true,
  width: 1600,
  height: 1200,
  margin: 0.025,
  minScale: 0.2,
  maxScale: 1.0,
  theme: Reveal.getQueryHash().theme, // available themes are in /css/theme
  backgroundTransition: 'slide',
  transition: 'linear', //Reveal.getQueryHash().transition || 'default', // default/cube/page/concave/zoom/linear/fade/none
  // math: {
  //   mathjax: 'http://cdn.mathjax.org/mathjax/latest/MathJax.js',
  //   config: 'TeX-AMS_HTML-full'  // See http://docs.mathjax.org/en/latest/config-files.html
  // },
  dependencies: [
    { src: '../reveal.js/lib/js/classList.js', condition: function() { return !document.body.classList; } },
    { src: '../reveal.js/plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
    { src: '../reveal.js/plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
    { src: '../reveal.js/plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } },
    // { src: '../reveal.js/plugin/zoom-js/zoom.js', async: true, condition: function() { return !!document.body.classList; } },
    // { src: '../reveal.js/plugin/notes/notes.js', async: true, condition: function() { return !!document.body.classList; } },
    // { src: '../reveal.js/plugin/leap/leap.js', async: true },
    // { src: '../reveal.js/plugin/search/search.js', async: true, condition: function() { return !!document.body.classList; } },
    // { src: '../reveal.js/plugin/remotes/remotes.js', async: true, condition: function() { return !!document.body.classList; } },
    { src: '../reveal.js/plugin/math/math.js', async: true }
  ]
});

var header = $('#header').html();
if ( window.location.search.match( /print-pdf/gi ) ) {
    Reveal.addEventListener( 'ready', function( event ) {
     $("body").remove("#header");
    });
}
else {
  $('div.reveal').append(header);
}
