#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../themes-imports.typ": *


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
      counter: thm-counter,
    ),
    set-box-title-style(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, proof, generic,
      color: black,
      sep-thickness: 0pt,
    ),
    set-box-frame(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, proof, generic,
      title-color: white,
      border-color: black,
      radius: 5pt
    ),

    // box style of: definition, lemma, proposition, theorem and corollary
    set-box(
      definition, lemma, proposition, theorem, corollary, generic,
      above: 1.3em,
    ),
    set-box-frame(
      definition, lemma, proposition, theorem, corollary, generic,
      body-inset: (x: 0.65em, y: 1em),
      title-inset: (x: 1.2em, top: 0.65em, bottom: 0em),
    ),

    // box style of: example, remark, notation and proof
    set-box-frame(
      example, remark, notation, proof,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0.3em),
    ),

    // GENERIC
    set-box-frame(generic,
      body-color: luma(230),
      title-color: luma(230)
    ),

    // DEFINITION
    set-box(definition,
      title: build-title("definition"),
    ),
    set-box-frame(definition,
      body-color: colorful-cyan.lighten(70%),
      title-color: colorful-cyan.lighten(70%),
    ),

    // LEMMA 
    set-box(lemma,
      title: build-title("lemma"),
    ),
    set-box-frame(lemma,
      body-color: sand-beige.lighten(70%),
      title-color: sand-beige.lighten(70%),
    ),

    // PROPOSITION 
    set-box(proposition,
      title: build-title("proposition"),
    ),
    set-box-frame(proposition,
      body-color: colorful-bordeau.lighten(70%),
      title-color: colorful-bordeau.lighten(70%),
    ),
    
    // THEOREM
    set-box(theorem,
      title: build-title("theorem"),
    ),
    set-box-frame(theorem,
      body-color: apple-green.lighten(70%),
      title-color: apple-green.lighten(70%),
    ),

    // COROLLARY 
    set-box(corollary,
      title: build-title("corollary"),
    ),
    set-box-frame(corollary,
      body-color: colorful-purple.lighten(70%),
      title-color: colorful-purple.lighten(70%),
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
      title: [_#linguify("proof", from: lang-database).#h(.4em)_],
      above: 0.4em,
    ),
    set-box-frame(proof,
      border-color: white,
      body-inset: (x: .65em, y: 0.65em),
      title-inset: (x: .65em, y: 0.3em),
    ),
    set-box-body-style(proof,
      suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
    ),
    set-box-title-style(proof,
      inline: true
    ),
    
  )
  body
}
