#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../themes-imports.typ": *

#let build-title(kind) = (counter, name) => {
  [_*#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]*#if name != "" [ (#name)]_] + h(.4em)
}

#let build-simple-title(kind) = (counter, name) => {
  [#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]#if name != "" [ (#name)]] + h(.4em)
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

  // show theorem body text as italic
  show: e.show_(e.filters.or_(
    theorem, lemma, definition, corollary, proposition, generic,
  ), it => {
    set text(style: "italic")
    it
  })
  
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
      boxed-style: (:),
      inline: true,
    ),
    set-box-frame(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, proof, generic,
      title-color: white,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0em),
      footer-inset: (x: 0em, y: 0em),
    ),

    // DEFINITION
    set-box(definition,
      title: build-title("definition"),
    ),

    // LEMMA 
    set-box(lemma,
      title: build-title("lemma"),
    ),

    // PROPOSITION 
    set-box(proposition,
      title: build-title("proposition"),
    ),

    // THEOREM
    set-box(theorem,
      title: build-title("theorem"),
    ),
    
    // COROLLARY 
    set-box(corollary,
      title: build-title("corollary"),
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
