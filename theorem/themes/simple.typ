#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../models.typ": *
#import "../lang.typ": get-theorem-title

#let build-title(kind) = (counter, name) => {
  [_*#get-theorem-title(kind) #if counter != none [#(counter.display)()]*#if name != "" [ (#name)]_] + h(.4em)
}

#let build-simple-title(kind) = (counter, name) => {
  [#get-theorem-title(kind) #if counter != none [#(counter.display)()]#if name != "" [ (#name)]] + h(.4em)
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
    set-theorem(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, generic,
      counter: thm-counter,
    ),
    set-theorem-title-style(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, proof, generic,
      color: black,
      sep-thickness: 0pt,
      boxed-style: (:),
      inline: true,
    ),
    set-theorem-frame(
      definition, lemma, proposition, theorem, corollary, example, notation, remark, proof, generic,
      title-color: white,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0em),
      footer-inset: (x: 0em, y: 0em),
    ),

    // DEFINITION
    set-theorem(definition,
      title: build-title("definition"),
    ),

    // LEMMA 
    set-theorem(lemma,
      title: build-title("lemma"),
    ),

    // PROPOSITION 
    set-theorem(proposition,
      title: build-title("proposition"),
    ),

    // THEOREM
    set-theorem(theorem,
      title: build-title("theorem"),
    ),
    
    // COROLLARY 
    set-theorem(corollary,
      title: build-title("corollary"),
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
      title: [_#get-theorem-title("proof").#h(.4em)_],
      above: 0.4em,
    ),

    set-theorem-body-style(proof,
      suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
    ),

    set-theorem-frame(proof,
      body-inset: (x: 1em),
    ),
    
  )
  body
}
