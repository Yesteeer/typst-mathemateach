#import "@preview/elembic:1.1.1" as e

#let footer-style = e.element.declare(
  "theorem-footer-style",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "thm"),
    e.field("color", color, default: black),
    e.field("weight", e.types.union(int, str), default: "regular"),
    e.field("align", alignment, default: start),
    e.field("sep-thickness", length, default: 1pt),
  )
)