#let default = (
  definition: rgb(40, 150, 170),
  corollary: rgb(140, 40, 170),
  theorem: rgb(50, 170, 70),
  lemma: rgb(170, 150, 50),
  proposition: rgb(170, 50, 90),
)

// qualitative colour-blind friendly color palettes

#let okitabe-ito = (
  // black: rgb(0, 0, 0),
  lemma: rgb(230, 159, 0), // orange
  definition: rgb(86, 180, 233), // sky blue
  theorem: rgb(0, 158, 115), // bluish green
  // yellow: rgb(240, 228, 66),
  // blue: rgb(0, 114, 178),
  proposition: rgb(213, 94, 0), // vermilion
  corollary: rgb(204, 121, 167), // reddish purple
)

#let tol-bright = (
  // black: rgb(0, 0, 0),
  lemma: rgb(204, 187, 68), // yellow
  definition: rgb(68, 119, 170), // blue
  theorem: rgb(34, 136, 51), // green
  // cyan: rgb(102, 204, 238),
  proposition: rgb(238, 102, 119), // red
  corollary: rgb(170, 51, 119), // purple
  //grey: rgb(187, 187, 187),
)

#let tol-muted = (
  // black: rgb(0, 0, 0),
  lemma: rgb(221, 204, 119), // sand
  // olive: rgb(153, 153, 51)
  definition: rgb(136, 204, 238).darken(10%), // cyan (darkened)
  // indigo: rgb(51, 34, 136),
  // teal: rgb(68, 170, 153),
  theorem: rgb(17, 119, 51), // green
  proposition: rgb(204, 102, 119), // rose
  // wine: rgb(136, 34, 85)
  corollary: rgb(170, 68, 153), // purple
  //pale grey: rgb(221, 221, 221),
)

#let tol-light = (
  // black: rgb(0, 0, 0),
  lemma: rgb(170, 170, 0), // olive
  // light-yellow: rgb(238, 221, 136),
  // pear: rgb(187, 204, 51),
  definition: rgb(119, 170, 221), // light blue
  // light cyan: rgb(153, 221, 255),
  theorem: rgb(68, 187, 153), // mint
  proposition: rgb(238, 136, 102), // orange
  corollary: rgb(255, 170, 187), // pink
  //pale grey: rgb(221, 221, 221),
)
