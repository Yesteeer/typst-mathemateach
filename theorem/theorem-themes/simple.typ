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
      _*#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]*_ #if name != "" [ _(#name)_ ]#h(.4em)
    ]
    else if kind == "proof" [
      _#linguify("proof", from: lang-database).#h(.4em)_
    ]
    else [
      _#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]_ #if name != "" [ _(#name)_]#h(.4em)
    ]
  }
  
  // define showybox style

  show: set-box(
    title: build-title,
    counter: thm-counter,
    above: 1.3em,
  )

  // define simple style

  show: set-box-frame(
    e.filters.or_(..((styles.at("simple") + styles.at("fancy")).map(it => generic-box.with(kind: it)))),
    border-color: white,
    body-inset: (x: 0em, y: 0.65em),
    title-inset: (x: 0em, y: 0em),
    footer-inset: (x: 0em, y: 0em),
    title-color: white,
    radius: 0pt,
  )
  show: set-box-title-style(
    e.filters.or_(..((styles.at("simple") + styles.at("fancy")).map(it => generic-box.with(kind: it)))),
    color: black,
    inline: true,
    sep-thickness: none
  )

  // define fancy style

  show: e.show_(e.filters.or_(..(styles.at("fancy").map(it => generic-box.with(kind: it)))),
    it => {
      set text(style: "italic")
      it
    }
  )

  // special kinds

  show: set-box-body-style(proof,
    suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
  )
  show: set-box(proof,
    above: .3em,
  )

  body
}
