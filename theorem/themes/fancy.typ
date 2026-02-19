#import "@preview/rich-counters:0.2.2" as rc

#import "../../deps.typ": *
#import "../models.typ": *


#let show-theorem(body, counter-level: none, colors: (:)) = {

  let colors = default-palette + colors
  
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

  // define title style
  
  let build-title = (kind, counter, name) => {
    if kind in colors.keys() [
      #place(
        dy: -.65em,
        rect(
          stroke: 0pt,
          fill: white,
          inset: (x: 0.6em, y: 0em),
        )[*#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]*#if name != "" [ _(#name)_]]
      )
    ]
    else if kind == "proof" [
      _#linguify("proof", from: lang-database).#h(.4em)_
    ]
    else [
      _#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]_#if name != "" [ _(#name)_]
    ]
  }

  show: set-box(
    title: build-title,
    counter: thm-counter,
    above: 2em,
  )
  show: set-box-frame(
    body-inset: (x: 0em, y: 0.5em),
    title-inset: (x: 0em, y: 0.3em),
    title-color: white,
    thickness: none,
    radius: 0pt,
  )
  show: set-box-title-style(
    color: black,
    sep-thickness: none,
  )
  show: set-box-title-style(proof,
    inline: true
  )
  show: set-box-body-style(proof,
    suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
  )
  show: it => colors.keys().fold(it, (it, kind) => {
    show: set-box-title-style(
      theorem.with(kind: kind),
      color: colors.at(kind).darken(10%),
      sep-thickness: none,
    )
    show: set-box-frame(
      theorem.with(kind: kind),
      border-color: colors.at(kind).darken(10%),
      thickness: 1.5pt,
      radius: 0pt,
      body-inset: (x: 1em, bottom: 1em, top: .7em),
      title-inset: (x: 1em, y: .2em),
    )
    it
  })
  body
}
