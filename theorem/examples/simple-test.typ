#import "../../lib.typ": *

// import theorem simple style
#import theorem.simple: *

#show: show-theorem.with(counter-level: 1)

#set page(height: auto, margin: 1cm)
#set heading(numbering: "1.")

// apply imported style, with theorem counter based on level-1 headings
#show: show-theorem.with(counter-level: 1)  


= Default environments

#definition[ #lorem(10) ]

#remark(counter: none)[ #lorem(10) ]

#lemma[ #lorem(10) ]

#example[ #lorem(10) ]

#proposition[ #lorem(10) ]

#notation[ #lorem(10) ]

#theorem(label: <thm1>, name: [Pythagorean Theorem])[ #lorem(10) ]
#proof[ This is a proof of @thm1. ]

#corollary[ #lorem(10) ]

= Define new environments (with or without matching style)

// define a formula box with matching styling (title styling has to be re-defined explicitely)
#let formula = styled-box.with(
  title: (kind, counter, name) => [*Formula #(counter.display)()* #h(.4em) _(#name)_],
  frame: (
    body-color: navy.lighten(80%),
    border-color: navy.darken(10%),
    title-color: navy.lighten(80%),
  ),
)

// define a warning box with own styling
#let warning = generic-box.with(
  title: (kind, counter, name) => [*#emoji.warning Warning #emoji.warning * #h(.4em)],
  frame: (
    border-color: red.darken(10%),
    title-color: white,
    body-color: white,
    dash: "loosely-dashed",
    thickness: 2pt,
    body-inset: 10pt,
  ),
  title-style: (
    inline: true,
  ),
  counter: none,
)

// define a tip box with own styling
#let tip = generic-box.with(
  title: (kind, counter, name) => [*#emoji.lightbulb Tip* #h(.4em)],
  frame: (
    border-color: green.darken(10%),
    title-color: green.lighten(30%),
    body-color: white,
    thickness: 1pt,
    body-inset: 10pt,
    title-inset: 5pt,
  ),
  title-style: (
    boxed-style: (offset: (x: 10pt)),
  ),
  counter: none,
)

#formula(name: [Euler's formula])[$ e^(i x) = cos(x) + i sin(x) $]

#warning[The following is a very common mistake.]

#tip[This is a useful tip.] 
