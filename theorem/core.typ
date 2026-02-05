#import "@preview/elembic:1.1.1" as e
#import "@local/showybox:2.0.4": showybox
#import "func.typ": resolve-supplement, resolve-body, resolve-title, resolve-shadow, resolve-spacing

#let box-body-style = e.element.declare(
  "box-body-style",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "generic"),
    e.field("color", e.types.union(color, gradient), default: black),
    e.field("align", alignment, default: start),
    e.field("prefix", content, default: []),
    e.field("suffix", content, default: [])
  )
)

#let box-footer-style = e.element.declare(
  "box-footer-style",
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

#let box-frame = e.element.declare(
  "box-frame",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "generic"),
    e.field("title-color", e.types.union(color, gradient), default: black),
    e.field("body-color", e.types.union(color, gradient), default: white),
    e.field("footer-color", e.types.union(color, gradient), default: luma(220)),
    e.field("border-color", e.types.union(color, gradient), default: black),
    e.field("radius", e.types.union(relative, dictionary), default: 5pt),
    e.field("thickness", e.types.union(length, dictionary, none), default: 1pt),
    e.field("dash", str, default: "solid"),
    e.field("inset", e.types.union(relative, dictionary), default: (x: 1em, y: 0.65em)),
    e.field("title-inset", e.types.union(relative, dictionary), default: (x: 1em, y: 0.65em)),
    e.field("body-inset", e.types.union(relative, dictionary), default: (x: 1em, y: 0.65em)),
    e.field("footer-inset", e.types.union(relative, dictionary), default: (x: 1em, y: 0.65em)),
  )
)

#let box-sep = e.element.declare(
  "box-sep",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "generic"),
    e.field("thickness", length, default: 1pt),
    e.field("dash", str, default: "solid"),
    e.field("gutter", relative, default: 0.65em),
  )
)

#let box-shadow = e.element.declare(
  "box-shadow",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "generic"),
    e.field("color", e.types.union(none, color, gradient), default: none),
    e.field("offset", e.types.union(none, relative, dictionary), default: none),
  )
)

#let box-title-style = e.element.declare(
  "box-title-style",
  prefix: "carex",

  display: it => it,

  fields: (
    e.field("kind", str, default: "generic"),
    e.field("color", e.types.union(color, gradient), default: white),
    e.field("weight", e.types.union(int, str), default: "regular"),
    e.field("align", alignment, default: start),
    e.field("sep-thickness", e.types.option(length), default: 1pt),
    e.field("boxed-style", e.types.option(dictionary), default: none),
    e.field("inline", bool, default: false)
  )
)

#let generic-box = e.element.declare(
  "generic-box",
  prefix: "carex",
  
  display: it => e.get(get => {
    let inline = get(box-title-style).inline
    let args = (
      title: if inline {none} else {resolve-title(it.title, it.counter, it.name)},
      footer: it.footer,
      frame: get(box-frame) + it.frame,
      title-style: get(box-title-style) + it.title-style,
      body-style: get(box-body-style) + it.body-style,
      footer-style: get(box-footer-style) + it.footer-style,
      sep: get(box-sep) + it.footer-style,
      shadow: resolve-shadow(get(box-shadow), it.shadow),
      width: it.width,
      align: it.align,
      breakable: it.breakable,
      spacing: it.spacing,
    ) + resolve-spacing(it.above, it.below)
    showybox(
      ..args,
      ..resolve-body(get(box-body-style).prefix, it.body, get(box-body-style).suffix, it.counter, it.title, it.name, inline)
    )
  }),

  count: counter => it => if it.counter != none {(it.counter.step)()},

  fields: (
    e.field("body", e.types.any, required: true),
    e.field("kind", str, default: "generic"),
    e.field("counter", e.types.any, default: none),
    e.field("title", e.types.union(str, content, function), default: ""),
    e.field("name", e.types.union(str, content), default: ""),
    e.field("footer", e.types.union(str, content), default: ""),
    e.field("frame", e.types.option(dictionary), default: none),
    e.field("title-style", e.types.option(dictionary), default: none),
    e.field("body-style", e.types.option(dictionary), default: none),
    e.field("footer-style", e.types.option(dictionary), default: none),
    e.field("sep", e.types.option(dictionary), default: none),
    e.field("shadow", e.types.option(dictionary), default: (:)),
    e.field("width", relative, default: 100%),
    e.field("align", alignment, default: start),
    e.field("breakable", bool, default: false),
    e.field("spacing", e.types.smart(relative), default: auto),
    e.field("above", e.types.option(relative), default: none),
    e.field("below", e.types.option(relative), default: none),
  ),

  parse-args: (default-parser, fields: none, typecheck: none) => (args, include-required: true) => {
    let args = if include-required {
      // Convert positional arguments into a single 'values' argument
      let values = args.pos()
      arguments(values, ..args.named())
    } else if args.pos() == () {
      // 'include-required' is always true for types, but keeping these here
      // just for completeness
      args
    } else {
      assert(false, message: "element 'sunk': unexpected positional arguments\n  hint: these can only be passed to the constructor")
    }

    default-parser(args, include-required: include-required)
  },

  reference: (
    supplement: it => resolve-supplement(it),
    numbering: it => if it.counter != none {
      (..nums) => (it.counter.display)()
    } else {"1.1"}
  ),
)


