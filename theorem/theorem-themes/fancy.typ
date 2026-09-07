#import "@preview/rich-counters:0.2.2" as rc

#import "../../deps.typ": *
#import "../func.typ": prepare-theme

// show rule to apply style

#let show-theorem(body, counter-level: none, kind-colors: (:), kind-styles: (:)) = {

  let (thm-counter, colors, styles) = prepare-theme(counter-level, kind-colors, kind-styles)
  
  // prepare elembic for references

  show: e.prepare()

  // define title

  let build-title = (kind, counter, name) => {
    if kind in styles.at("fancy") [
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

  // define showybox style

  show: set-box(
    title: build-title,
    counter: thm-counter,
    above: 2em,
  )

  // define simple style
  
  show: set-box-frame(
    e.filters.or_(..(styles.at("simple").map(it => generic-box.with(kind: it)))),
    body-inset: (x: 0em, y: 0.5em),
    title-inset: (x: 0em, y: 0.3em),
    title-color: white,
    thickness: none,
    radius: 0pt,
  )
  show: set-box-title-style(
    e.filters.or_(..(styles.at("simple").map(it => generic-box.with(kind: it)))),
    color: black,
    sep-thickness: none,
  )

  // define fancy style

  show: it => styles.at("fancy").fold(it, (it, kind) => {
    show: set-box-title-style(
      theorem.with(kind: kind),
      color: colors.at(kind, default: black).darken(10%),
      sep-thickness: none,
    )
    show: set-box-frame(
      theorem.with(kind: kind),
      border-color: colors.at(kind, default: black).darken(10%),
      thickness: 1.5pt,
      radius: 0pt,
      title-color: white,
      body-inset: (x: 1em, bottom: 1em, top: .7em),
      title-inset: (x: 1em, y: .2em),
    )
    it
  })

  // special kinds

  show: set-box-title-style(proof,
    inline: true
  )
  show: set-box-body-style(proof,
    suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
  )

  body
}
