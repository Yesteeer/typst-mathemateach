#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../models.typ": *
#import "../colors.typ": *
#import "../lang.typ": get-theorem-title

// show rule to apply style

#let show-theorem(body, counter-level: none) = {

  let build-title(kind, color: black, fill: white) = (counter, name) => {
    [
      #place(
        dy: -1.2em,
        rect(
          stroke: 1pt + color,
          fill: fill,
          inset: (x: 0.6em, y: 0.5em),
          radius: 5pt,
        )[*#get-theorem-title(kind) #if counter-level != none {(counter.display)()}*#if name != "" [ _(#name)_]]
      )
    ]
  }

  let build-simple-title(kind) = (counter, name) => {
    [*#get-theorem-title(kind) #if counter-level != none {(counter.display)()}*#if name != "" [ _(#name)_]]
  }
  
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
    set-theorem(
      definition, lemma, proposition, theorem, corollary, example, notation, remark,
      counter: thm-counter
    ),
    set-theorem-title-style(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, proof, generic,
      color: black,
      sep-thickness: 0pt,
    ),
    set-theorem-frame(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, proof,
      title-color: white,
      radius: 0pt,
      thickness: 0pt,
    ),
    
    // box style of: definition, lemma, proposition, theorem and corollary
    set-theorem(
      definition, lemma, proposition, theorem, corollary,
      above: 2em,
    ),
    set-theorem-frame(
      definition, lemma, proposition, theorem, corollary,
      body-inset: (x: 0em, bottom: 1em, top: 1em),
      title-inset: (x: 0em, y: .2em),
    ),

    // box style of: example, remark, notation and proof
    set-theorem-frame(
      example, remark, notation, proof,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0.3em),
    ),

    // GENERIC
    set-theorem-frame(generic,
        border-color: black,
        body-color: luma(230),
        body-inset: (x: .65em, bottom: .65em, top: .5em),
    ),
    
    // DEFINITION
    set-theorem(definition,
      title: build-title("definition", 
        color: colorful-cyan.darken(10%),
        fill: colorful-cyan.lighten(80%),
      ),
    ),
    
    // LEMMA 
    set-theorem(lemma,
      title: build-title("lemma", 
        color: sand-beige.darken(20%), 
        fill: sand-beige.lighten(80%),
      ),
    ),
    // PROPOSITION 
    set-theorem(proposition,
      title: build-title("proposition", 
        color: colorful-bordeau.darken(10%), 
        fill: colorful-bordeau.lighten(80%),
      ),
    ),

    // THEOREM
    set-theorem(theorem,
      title: build-title("theorem", 
        color: apple-green.darken(20%), 
        fill: apple-green.lighten(80%),
      ),
    ),
    
    // COROLLARY 
    set-theorem(corollary,
      title: build-title("corollary", 
        color: colorful-purple.darken(10%), 
        fill: colorful-purple.lighten(85%),
      ),
    ),
    
    // EXAMPLE
    set-theorem(example,
      title: build-simple-title("example"),
    ),

    // REMARK
    set-theorem(remark,
      title: build-simple-title("remark"),
    ),

    // NOTATION
    set-theorem(notation, 
      title: build-simple-title("notation"),
    ),

    // PROOF
    set-theorem(proof,
      title: [_#get-theorem-title("proof"):_],
      above: 0.4em,
    ),
    set-theorem-frame(proof,
      body-inset: (x: 1em, y: 0.3em),
      title-inset: (y: 0.65em),
    ),
    set-theorem-body-style(proof,
      suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
    ),
  )
  body
}