#import "@preview/elembic:1.1.1" as e

#let footer-style = e.element.declare(
  "theorem-footer-style",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "generic"),
    e.field("color", e.types.union(color, gradient), default: black),
    e.field("weight", e.types.union(int, str), default: "regular"),
    e.field("align", alignment, default: start),
    e.field("sep-thickness", e.types.option(length), default: 1pt),
  )
)

// custom set rule for footer

#let set-footer-style = e.set_.with(footer-style)

// custom set rule with theorem selector

#let set-theorem-footer-style(..rules) = it => {
  show: if rules.pos() == () {set-footer-style(..rules.named())} else {
    e.filtered(e.filters.or_(..rules.pos()),
      set-footer-style(..rules.named())
    )
  }
  it
}
