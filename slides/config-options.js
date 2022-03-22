// Full list of configuration options available here:
// https://github.com/hakimel/reveal.js#configuration
Reveal.initialize({
  controls: true,
  progress: true,
  slideNumber: "c/t",
  center: true,
  hash: true,
  history: true,
  width: 1600,
  height: 1200,
  margin: 0.04,
  minScale: 0.2,
  maxScale: 2.0,
  mathjax2: {
    config: 'TeX-AMS_HTML-full',
    TeX: {
      Macros: {
        R: '\\mathbb{R}',
        set: [ '\\left\\{#1 \\; ; \\; #2\\right\\}', 2 ]
      }
    }
  },
  // Learn about plugins: https://revealjs.com/plugins/
  plugins: [ RevealZoom, RevealNotes, RevealSearch, RevealMarkdown, RevealHighlight, RevealMath.MathJax2 ]
});
