#import "@preview/elembic:1.1.1" as e 

#let sep = e.element.declare(
  "theorem-sep",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "generic"),
    e.field("thickness", length, default: 1pt),
    e.field("dash", str, default: "solid"),
    e.field("gutter", relative, default: 0.65em),
  )
)

// custom set rule for sep

#let set-sep = e.set_.with(sep)

// custom set rule with theorem selector

#let set-theorem-sep(..rules) = it => {
  show: if rules.pos() == () {set-sep(..rules.named())} else {
    e.filtered(e.filters.or_(..rules.pos()),
      set-sep(..rules.named())
    )
  }
  it
}