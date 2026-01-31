#import "@preview/elembic:1.1.1" as e

#let frame = e.element.declare(
  "theorem-frame",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "thm"),
    e.field("title-color", color, default: black),
    e.field("body-color", color, default: white),
    e.field("footer-color", color, default: luma(220)),
    e.field("border-color", color, default: black),
    e.field("radius", e.types.union(relative, dictionary), default: 5pt),
    e.field("thickness", e.types.union(length, dictionary), default: 1pt),
    e.field("dash", str, default: "solid"),
    e.field("inset", e.types.union(relative, dictionary), default: (x: 1em, y: 0.65em)),
    e.field("title-inset", e.types.union(relative, dictionary), default: (x: 1em, y: 0.65em)),
    e.field("body-inset", e.types.union(relative, dictionary), default: (x: 1em, y: 0.65em)),
    e.field("footer-inset", e.types.union(relative, dictionary), default: (x: 1em, y: 0.65em)),
  )
)

// custom set rule for frame

#let set-frame = e.set_.with(frame)

// custom set rule with theorem selector

#let set-theorem-frame(..rules) = it => {
  show: if rules.pos() == () {set-frame(..rules.named())} else {
    e.filtered(e.filters.or_(..rules.pos()),
      set-frame(..rules.named())
    )
  }
  it
}