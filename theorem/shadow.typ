#import "@preview/elembic:1.1.1" as e 

#let shadow = e.element.declare(
  "theorem-shadow",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "thm"),
    e.field("color", e.types.option(color), default: none),
    e.field("offset", e.types.union(none, relative, dictionary), default: none),
  )
)