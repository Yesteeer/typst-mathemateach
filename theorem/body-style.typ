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