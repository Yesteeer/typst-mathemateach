#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../themes-imports.typ": *

#let build-title(kind, color: black, fill: white) = (counter, name) => {
  [
    #place(
      dy: -1.2em,
      rect(
        stroke: 1pt + color,
        fill: fill,
        inset: (x: 0.6em, y: 0.5em),
        radius: 5pt,
      )[*#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]*#if name != "" [ _(#name)_]]
    )
  ]
}

#let build-simple-title(kind) = (counter, name) => {
  [*#linguify(kind, from: lang-database, default: kind)  #if counter != none [#(counter.display)()]*#if name != "" [ _(#name)_]]
}

// show rule to apply style

#let show-theorem(body, counter-level: none) = {

  // prepare call for elembic
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
  
  show: e.apply(
    
    // applied to all custom theorems
    set-box(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, generic,
      counter: thm-counter
    ),
    set-box-title-style(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, proof, generic,
      color: black,
      sep-thickness: 0pt,
    ),
    set-box-frame(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, proof, generic,
      title-color: white,
      radius: 0pt,
      thickness: 0pt,
    ),
    
    // box style of: definition, lemma, proposition, theorem and corollary
    set-box(
      definition, lemma, proposition, theorem, corollary, generic,
      above: 2em,
    ),
    set-box-frame(
      definition, lemma, proposition, theorem, corollary, generic,
      body-inset: (x: 0em, bottom: 1em, top: 1em),
      title-inset: (x: 0em, y: .2em),
    ),

    // box style of: example, remark, notation and proof
    set-box-frame(
      example, remark, notation, proof,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0.3em),
    ),

    // DEFINITION
    set-box(definition,
      title: build-title("definition", 
        color: colorful-cyan.darken(10%),
        fill: colorful-cyan.lighten(80%),
      ),
    ),
    
    // LEMMA 
    set-box(lemma,
      title: build-title("lemma", 
        color: sand-beige.darken(20%), 
        fill: sand-beige.lighten(80%),
      ),
    ),
    // PROPOSITION 
    set-box(proposition,
      title: build-title("proposition", 
        color: colorful-bordeau.darken(10%), 
        fill: colorful-bordeau.lighten(80%),
      ),
    ),

    // THEOREM
    set-box(theorem,
      title: build-title("theorem", 
        color: apple-green.darken(20%), 
        fill: apple-green.lighten(80%),
      ),
    ),
    
    // COROLLARY 
    set-box(corollary,
      title: build-title("corollary", 
        color: colorful-purple.darken(10%), 
        fill: colorful-purple.lighten(85%),
      ),
    ),
    
    // EXAMPLE
    set-box(example,
      title: build-simple-title("example"),
    ),

    // REMARK
    set-box(remark,
      title: build-simple-title("remark"),
    ),

    // NOTATION
    set-box(notation, 
      title: build-simple-title("notation"),
    ),

    // PROOF
    set-box(proof,
      title: [_#linguify("proof", from: lang-database):_],
      above: 0.4em,
    ),
    set-box-frame(proof,
      body-inset: (x: 1em, y: 0.3em),
      title-inset: (y: 0.65em),
    ),
    set-box-body-style(proof,
      suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
    ),
  )
  body
}
