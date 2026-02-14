#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../themes-imports.typ": *

#let smallbox = generic-box.with(
  kind: "smallbox"
)


// show rule to apply style

#let show-theorem(body, counter-level: none, colors: default-palette) = {

  // prepare elembic for references

  show: e.prepare()

  // define theorem counter
  //
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
        dy: -1.2em,
        context{show: set-box(
          width: measure([#linguify(kind, from: lang-database, default: kind)+#if counter != none [#(counter.display)()#h(.5em)]]+if name != "" [#name#h(.3em)]+h(1em)).width,
          frame: (
            border-color: colors.at(kind).lighten(10%),
            body-color: colors.at(kind).lighten(80%),
            thickness: 1pt,
          ),
        );smallbox[*#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]*#if name != "" [ _(#name)_]]}
      )
    ] else if kind == "proof" [
      _#linguify("proof", from: lang-database).#h(.4em)_
    ] else [
      _#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]_ #if name != "" [ _(#name)_]
    ]
  }

  show: set-box(
    title: build-title,
    counter: thm-counter,
    above: 1.3em,
  )
  show: set-box-frame(
    body-inset: (x: 0em, y: 0.5em),
    title-inset: (x: 0em, y: 0.3em),
    title-color: white,
    radius: 0pt,
    thickness: none
  )
  show: set-box-title-style(
    color: black,
    sep-thickness: none
  )
  show: set-box-title-style(proof,
    inline: true
  )
  show: set-box-body-style(proof,
    suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
  )
  show: set-box(
    smallbox,
    title: "",
    frame: (
      body-inset: (x: .5em, y: .5em)
    )
  )
  show: it => colors.keys().fold(it, (it, kind) => {
    show: set-box(
      theorem.with(kind: kind),
      above: 2.5em
    )
    show: set-box-frame(
      theorem.with(kind: kind),
      radius: 0pt,
      body-inset: (x: 0em, bottom: 1em, top: 1em),
      title-inset: (x: 0em, y: .2em),
    )
    it
  })
  body
}
