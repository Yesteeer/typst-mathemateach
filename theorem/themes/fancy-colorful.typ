#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../models.typ": *
#import "../colors.typ": *
#import "../lang.typ": get-theorem-title

// show rule to apply style

#let show-theorem(body, counter-level: none) = {

  let build-title(kind) = (counter, name) => {
    [
      #place(
        dy: -.65em,
        rect(
          stroke: 0pt,
          fill: white,
          inset: (x: 0.6em, y: 0em),
        )[*#get-theorem-title(kind) #(counter.display)()*#if name != "" [ _(#name)_]]
      )
    ]
  }

  let build-simple-title(kind) = (counter, name) => {
    [*#get-theorem-title(kind) #(counter.display)()*#if name != "" [ _(#name)_]]
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
    
    // GENERAL
    set-theorem(
      counter: thm-counter
    ),
    set-theorem-title-style(
      color: black,
      sep-thickness: 0pt,
    ),
    set-theorem-frame(
      title-color: white,
      radius: 0pt,
      thickness: 1.5pt,
    ),
    
    // box style of: definition, lemma, proposition, theorem and corollary
    set-theorem(
      definition, lemma, proposition, theorem, corollary,
      above: 1.3em,
    ),
    set-theorem-frame(
      definition, lemma, proposition, theorem, corollary,
      body-inset: (x: 1em, bottom: 1em, top: .7em),
      title-inset: (x: 1em, y: .2em),
    ),

    // box style of: example, remark, notation and proof
    set-theorem-frame(
      example, remark, notation, proof,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0.3em),
    ),
    
    // DEFINITION
    set-theorem(definition,
      title: build-title("definition"),
    ),
    set-theorem-frame(definition,
      border-color: colorful-cyan.darken(10%),
    ),
    set-theorem-title-style(definition,
      color: colorful-cyan.darken(10%),
    ),
    
    // LEMMA 
    set-theorem(lemma,
      title: build-title("lemma"),
    ),
    set-theorem-frame(lemma,
      border-color: sand-beige,
    ),
    set-theorem-title-style(lemma,
      color: sand-beige,
    ),

    // PROPOSITION 
    set-theorem(proposition,
      title: build-title("proposition"),
    ),
    set-theorem-frame(proposition,
      border-color: colorful-bordeau,
    ),
    set-theorem-title-style(proposition,
      color: colorful-bordeau,
    ),

    // THEOREM
    set-theorem(theorem,
      title: build-title("theorem"),
    ),
    set-theorem-frame(theorem,
      border-color: apple-green.darken(10%),
    ),
    set-theorem-title-style(theorem,
      color: apple-green.darken(10%),
    ),
    
    // COROLLARY 
    set-theorem(corollary,
      title: build-title("corollary"),
    ),
    set-theorem-frame(corollary,
      border-color: colorful-purple,
    ),
    set-theorem-title-style(corollary,
      color: colorful-purple,
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
      counter: none,
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