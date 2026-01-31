#import "@preview/elembic:1.1.1" as e 

#let shadow = e.element.declare(
  "theorem-shadow",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "generic"),
    e.field("color", e.types.union(none, color, gradient), default: none),
    e.field("offset", e.types.union(none, relative, dictionary), default: none),
  )
)

// custom set rule for shadow

#let set-shadow = e.set_.with(shadow)

// custom set rule with theorem selector

#let set-theorem-shadow(..rules) = it => {
  show: if rules.pos() == () {set-shadow(..rules.named())} else {
    e.filtered(e.filters.or_(rules.pos()),
      set-shadow(..rules.named())
    )
  }
  it
}