#import "@preview/elembic:1.1.1" as e

#let title-style = e.element.declare(
  "theorem-title-style",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "thm"),
    e.field("color", color, default: white),
    e.field("weight", e.types.union(int, str), default: "regular"),
    e.field("align", alignment, default: start),
    e.field("sep-thickness", length, default: 1pt),
    e.field("boxed-style", e.types.option(dictionary), default: none),
  )
)