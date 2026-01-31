#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../models.typ": *
#import "../colors.typ": *
#import "../lang.typ": get-theorem-title

// show rule to apply style

#let show-theorem(body, counter-level: none) = {

  let build-title(kind) = (counter, name) => {
    [*#get-theorem-title(kind) #if counter-level != none {(counter.display)()}*#if name != "" [ _(#name) _]]
  }

  let build-simple-title(kind) = (counter, name) => {
    [_#get-theorem-title(kind) #if counter-level != none {(counter.display)()}#if name != "" [ _(#name) _]_]
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
      counter: thm-counter,
    ),
    set-theorem-title-style(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, proof, generic,
      color: black,
      sep-thickness: 0pt,
    ),
    set-theorem-frame(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, proof, generic,
      title-color: white,
      border-color: black,
      radius: 5pt
    ),

    // box style of: definition, lemma, proposition, theorem and corollary
    set-theorem(
      definition, lemma, proposition, theorem, corollary,
      above: 1.3em,
    ),
    set-theorem-frame(
      definition, lemma, proposition, theorem, corollary,
      body-inset: (x: 0.65em, bottom: 1em, top: 0.3em),
      title-inset: (x: 1.2em, top: 0.65em),
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
      body-inset: (x: 0.65em, bottom: .65em, top: .65em),
      body-color: luma(230),
      title-color: luma(230)
    ),

    // DEFINITION
    set-theorem(definition,
      title: build-title("definition"),
    ),
    set-theorem-frame(definition,
      body-color: colorful-cyan.lighten(70%),
      title-color: colorful-cyan.lighten(70%),
    ),

    // LEMMA 
    set-theorem(lemma,
      title: build-title("lemma"),
    ),
    set-theorem-frame(lemma,
      body-color: sand-beige.lighten(70%),
      title-color: sand-beige.lighten(70%),
    ),

    // PROPOSITION 
    set-theorem(proposition,
      title: build-title("proposition"),
    ),
    set-theorem-frame(proposition,
      body-color: colorful-bordeau.lighten(70%),
      title-color: colorful-bordeau.lighten(70%),
    ),
    
    // THEOREM
    set-theorem(theorem,
      title: build-title("theorem"),
    ),
    set-theorem-frame(theorem,
      body-color: apple-green.lighten(70%),
      title-color: apple-green.lighten(70%),
    ),

    // COROLLARY 
    set-theorem(corollary,
      title: build-title("corollary"),
    ),
    set-theorem-frame(corollary,
      body-color: colorful-purple.lighten(70%),
      title-color: colorful-purple.lighten(70%),
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
      border-color: white,
      body-inset: (x: 1em, y: 0.3em),
      title-inset: (y: 0.65em),
    ),
    set-theorem-body-style(proof,
      suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
    ),
    
  )
  body
}