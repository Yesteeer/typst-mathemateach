#import "@preview/elembic:1.1.1" as e
#import "@preview/showybox:2.0.4" as showybox

#import "frame.typ": frame, set-theorem-frame
#import "title-style.typ": title-style, set-theorem-title-style
#import "body-style.typ": body-style, set-theorem-body-style
#import "footer-style.typ": footer-style, set-theorem-footer-style
#import "sep.typ": sep, set-theorem-sep
#import "shadow.typ": shadow, set-theorem-shadow
#import "../lang.typ": get-theorem-title

#let resolve-title(title, counter, name) = {
  if type(title) == function {
    return title(counter, name)
  } else {
    let final-title = title
    if counter != none {
      final-title += h(.4em)
      final-title += (counter.display)()
    }
    if name != "" {
      final-title += h(.4em)
    final-title += name
    }
    return final-title
  }
}

#let resolve-shadow(actual-shadow, arg-shadow) = {
  let shadow = actual-shadow+ arg-shadow
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
}

#let resolve-spacing(above, below) = {
  if above == none {
    none
  } else {
    (above: above)
  } + if below == none {
    none
  } else {
    (below: below)
  }
}

#let resolve-body(prefix, body, suffix, counter, title, name, inline) = {
  let start-content = []
  let end-content = []
  if inline {
    prefix += resolve-title(title, counter, name)
  }
  if type(body) == array and body.len() > 1 {
    start-content += prefix
    start-content += body.first()
    end-content += body.last()
    end-content += suffix
    return (start-content, ..body.slice(1, body.len()-1), end-content)
  } else {
    return (prefix + body.first() + suffix,)
  }
}

#let theorem_ = e.element.declare(
  "theorem",
  prefix: "carex",
  
  display: it => e.get(get => {
    let inline = get(title-style).inline
    let args = (
      title: if inline {none} else {resolve-title(it.title, it.counter, it.name)},
      footer: it.footer,
      frame: get(frame) + it.frame,
      title-style: get(title-style) + it.title-style,
      body-style: get(body-style) + it.body-style,
      footer-style: get(footer-style) + it.footer-style,
      sep: get(sep) + it.footer-style,
      shadow: resolve-shadow(get(shadow), it.shadow),
      width: it.width,
      align: it.align,
      breakable: it.breakable,
      spacing: it.spacing,
    ) + resolve-spacing(it.above, it.below)
    showybox.showybox(
      ..args,
      ..resolve-body(get(body-style).prefix, it.body, get(body-style).suffix, it.counter, it.title, it.name, inline)
    )
  }),

  count: counter => it => if it.counter != none {(it.counter.step)()},

  fields: (
    e.field("body", e.types.any, required: true),
    e.field("kind", str, default: "theorem"),
    e.field("counter", e.types.any, default: none),
    e.field("title", e.types.union(none, str, content, function), default: none),
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
    supplement: it => [#context{get-theorem-title(it.kind)}],
    numbering: it => if it.counter != none {
      (..nums) => (it.counter.display)()
    } else {"1.1"}
  ),
)

// custom set rule for theorem

#let set-theorem_ = e.set_.with(theorem_)

// custom set rule with theorem selector

#let set-theorem(..rules) = it => {
  show: if rules.pos() == () {set-theorem_(..rules.named())} else {
    e.cond-set(rules.pos().first(),
      ..rules.named()
    )
  }
  it
}