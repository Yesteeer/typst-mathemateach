#import "@preview/elembic:1.1.1" as e 

#let sep = e.element.declare(
  "theorem-sep",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "thm"),
    e.field("thickness", length, default: 1pt),
    e.field("dash", str, default: "solid"),
    e.field("gutter", relative, default: 0.65em),
  )
)