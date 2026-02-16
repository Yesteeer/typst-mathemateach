#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../themes-imports.typ": *


// show rule to apply style

#let show-theorem(body, counter-level: none, colors: default-palette) = {
  
  // prepare elembic for references
  
  show: e.prepare()

  // define theorem counter
  let thm-counter = if counter-level != none {
    rc.rich-counter(
      identifier: "thm-counter", 
      inherited_levels:  counter-level, 
      inherited_from: heading
    )
  } else {
    none
  }

  // show theorem body text as italic
  show: e.show_(e.filters.or_(
    theorem, lemma, definition, corollary, proposition
  ), it => {
    set text(style: "italic")
    it
  })

  // define title style
  
  let build-title = (kind, counter, name) => {
    if kind in colors.keys() [
      _*#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]*_ #if name != "" [ _(#name)_ ]#h(.4em)
    ]
    else if kind == "proof" [
      _#linguify("proof", from: lang-database).#h(.4em)_
    ]
    else [
      _#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]_ #if name != "" [ _(#name)_]#h(.4em)
    ]
  }
  
  show: set-box(
    title: build-title,
    counter: thm-counter,
    above: 1.3em,
  )
  show: set-box-frame(
    border-color: white,
    body-inset: (x: 0em, y: 0.65em),
    title-inset: (x: 0em, y: 0em),
    footer-inset: (x: 0em, y: 0em),
    title-color: white,
    radius: 0pt,
  )
  show: set-box-title-style(
    color: black,
    inline: true,
    sep-thickness: none
  )
  show: set-box-body-style(proof,
    suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
  )
  show: set-box(proof,
    above: .3em,
  )
  show: set-box-frame(proof,
    body-inset: (x: .65em, y: 0.65em),
    title-inset: (x: .65em, y: 0.3em),
  )
  body
}
