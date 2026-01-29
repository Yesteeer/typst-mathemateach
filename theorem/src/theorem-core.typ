#import "@preview/elembic:1.1.1" as e
#import "@preview/showybox:2.0.4" as showybox

#import "frame.typ": *
#import "title-style.typ": *
#import "body-style.typ": *
#import "footer-style.typ": *
#import "sep.typ": *
#import "shadow.typ": *
#import "lang.typ": get-theorem-title

#let theorem_ = e.element.declare(
  "theorem",
  prefix: "carex",
  
  display: it => e.get(get => {
    let args = (
      title: it.title + if it.counter != none {if it.title != "" {h(.4em)} ; (it.counter.display)()},
      footer: it.footer,
      frame: get(frame) + it.frame,
      title-style: get(title-style) + it.title-style,
      body-style: get(body-style) + it.body-style,
      footer-style: get(footer-style) + it.footer-style,
      sep: get(sep) + it.footer-style,
      shadow: {let shadow = get(shadow) + it.shadow
        let color = shadow.color
        let offset = shadow.offset
        if color == none {
          if offset == none {
            none
          } else {
            (color: luma(128), offset: offset)
          }
        } else if offset == none {
          (color: color, offset: 5pt)
        } else {
          shadow
        }
      },
      width: it.width,
      align: it.align,
      breakable: it.breakable,
      spacing: it.spacing,
    ) + if it.above == none {
      none
    } else {
      (above: it.above)
    } + if it.below == none {
      none
    } else {
      (below: it.below)
    }
    showybox.showybox(
      ..args,
      ..it.body
    )
  }),

  count: counter => it => if it.counter != none {(it.counter.step)()},

  fields: (
    e.field("body", e.types.any, required: true),
    e.field("kind", str, default: "theorem"),
    e.field("counter", e.types.any, default: none),
    e.field("title", e.types.union(str, content), default: ""),
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
    supplement: it => [#context{get-theorem-title(text.lang).at(it.kind, default: it.kind)}],
    numbering: it => if it.counter != none {
      (..nums) => (it.counter.display)()
    } else {"1.1"}
  ),
)

// custom set rules

#let set-theorem-sep = e.set_.with(sep)
#let set-theorem = e.set_.with(theorem_)
#let set-theorem-frame = e.set_.with(frame)
#let set-theorem-shadow = e.set_.with(shadow)
#let set-theorem-body-style= e.set_.with(body-style)
#let set-theorem-title-style = e.set_.with(title-style)
#let set-theorem-footer-style = e.set_.with(footer-style)