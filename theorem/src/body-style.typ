#import "@preview/elembic:1.1.1" as e

#let body-style = e.element.declare(
  "theorem-body-style",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "thm"),
    e.field("color", color, default: black),
    e.field("align", alignment, default: start),
  )
)

// custom set rule for body-style

#let set-body-style = e.set_.with(body-style)

// custom set rule with theorem selector

#let set-theorem-body-style(..rules) = it => {
  show: if rules.pos().len() == 0 {set-body-style(..rules.named())} else {
    e.filtered(rules.pos().first(),
      set-body-style(..rules.named())
    )
  }
  it
}