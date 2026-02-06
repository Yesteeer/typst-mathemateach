#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../themes-imports.typ": *

#let build-title(kind) = (counter, name) => {
  [
    #place(
      dy: -.65em,
      rect(
        stroke: 0pt,
        fill: white,
        inset: (x: 0.6em, y: 0em),
      )[*#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]*#if name != "" [ _(#name)_]]
    )
  ]
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
      thickness: 1.5pt,
    ),
    
    // box style of: definition, lemma, proposition, theorem and corollary
    set-box(
      definition, lemma, proposition, theorem, corollary, generic,
      above: 2em,
    ),
    set-box-frame(
      definition, lemma, proposition, theorem, corollary, generic,
      body-inset: (x: 1em, bottom: 1em, top: .7em),
      title-inset: (x: 1em, y: .2em),
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
      title: build-title("definition"),
    ),
    set-box-frame(definition,
      border-color: colorful-cyan.darken(10%),
    ),
    set-box-title-style(definition,
      color: colorful-cyan.darken(10%),
    ),
    
    // LEMMA 
    set-box(lemma,
      title: build-title("lemma"),
    ),
    set-box-frame(lemma,
      border-color: sand-beige,
    ),
    set-box-title-style(lemma,
      color: sand-beige,
    ),

    // PROPOSITION 
    set-box(proposition,
      title: build-title("proposition"),
    ),
    set-box-frame(proposition,
      border-color: colorful-bordeau,
    ),
    set-box-title-style(proposition,
      color: colorful-bordeau,
    ),

    // THEOREM
    set-box(theorem,
      title: build-title("theorem"),
    ),
    set-box-frame(theorem,
      border-color: apple-green.darken(10%),
    ),
    set-box-title-style(theorem,
      color: apple-green.darken(10%),
    ),
    
    // COROLLARY 
    set-box(corollary,
      title: build-title("corollary"),
    ),
    set-box-frame(corollary,
      border-color: colorful-purple,
    ),
    set-box-title-style(corollary,
      color: colorful-purple,
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
