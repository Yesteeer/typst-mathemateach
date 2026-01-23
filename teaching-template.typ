#import "@preview/elembic:1.1.1" as e
#import "@local/my-theorem:0.1.0" as mt


// basic styling for teaching support

#let basic-style(body, lang: "fr") = {
  // set default text properties
  set text(font: "New Computer Modern Sans", size: 11pt, lang: lang)

  // set default numbering
  set enum(numbering: "1)")
  set page(numbering: (x, y) => context{ if counter(page).final().at(0) > 1 {text(size: 9pt)[#x / #y]}})
  set heading(numbering: "1.")

  // set default paragraphe justification
  set par(
    justify: true,
  )

  // set default math font
  show math.equation: set text(font: "New Computer Modern Math", fallback: false)

  // prepare call for elembic (my-theorem package)
  show: e.prepare()

  // set bold theorem title
  show: mt.set-theorem(
    title: (
      style: "bold"
    ),
    count: "sum",
  )
  body
}

// basic theorem blocks

#let theorem = mt.theorem.with(
  kind: "thm",
)

#let lemma = mt.theorem.with(
  kind: "lem",
)

#let corollary = mt.theorem.with(
  kind: "cor",
)

#let remark = mt.theorem.with(
  kind: "rem",
)

#let definition = mt.theorem.with(
  kind: "def",
)

#let example = mt.theorem.with(
  kind: "ex",
)

#let exercise = mt.theorem.with(
  kind: "exo",
)

#let notation = mt.theorem.with(
  kind: "not",
  count: none,
)

#let proof = mt.theorem.with(
  kind: "dem",
  count: none,
  spacing: (
    above: -0.4em,
  ),
  suffix: ":",
  title: (
    style: "italic",
    dx: -1em,
    dy: -0.2em,
  ),
  inset: (
    x: 1em,
    top: 0.5em,
    bottom: 1em + 3pt,
  ),
  additional-content:
    ([
      #place(
        dx: 100%,
        dy: 0% + 3pt,
        [#text(size: 18pt, sym.square.stroked)]
      )
    ],)
)