#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../models.typ": *
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
        )[_*#get-theorem-title(kind) #(counter.display)()*#if name != "" [ _(#name)_]_]
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

  // show theorem body text as italic
  show: e.show_(e.filters.or_(
    theorem, lemma, definition, corollary, proposition
  ), it => {
    set text(style: "italic")
    it
  })
  
  show: e.apply(
    // GENERAL
    set-theorem-title-style(
      color: black,
      sep-thickness: 0pt,
    ),
    set-theorem-frame(
      title-color: white,
      body-inset: (x: 0em, y: 0em),
      title-inset: (x: 0em, y: 0em),
      radius: 0pt,
      thickness: 1.5pt,
    ),

    // DEFINITION
    set-theorem(definition,
      title: build-title("definition"),
      counter: thm-counter,
      above: 1.3em,
    ),
    set-theorem-frame(definition,
      border-color: black,
      body-inset: (x: 1em, bottom: 1em, top: .7em),
      title-inset: (x: 1em, y: .2em),
    ),
    set-theorem-title-style(definition,
      color: black,
    ),
    
    // LEMMA 
    set-theorem(lemma,
      title: build-title("lemma"),
      counter: thm-counter,
      above: 1.3em,
    ),
    set-theorem-frame(lemma,
      border-color: black,
      body-inset: (x: 1em, bottom: 1em, top: .7em),
      title-inset: (x: 1em, y: 0.2em),
    ),
    set-theorem-title-style(lemma,
      color: black,
    ),

    // PROPOSITION 
    set-theorem(proposition,
      title: build-title("proposition"),
      counter: thm-counter,
      above: 1.3em,
    ),
    set-theorem-frame(proposition,
      border-color: black,
      body-inset: (x: 1em, bottom: 1em, top: .7em),
      title-inset: (x: 1em, y: .2em),
    ),
    set-theorem-title-style(proposition,
      color: black,
    ),

    // THEOREM
    set-theorem(theorem,
      title: build-title("theorem"),
      counter: thm-counter,
      above: 1.3em,
    ),
    set-theorem-frame(theorem,
      border-color: black,
      body-inset: (x: 1em, bottom: 1em, top: .7em),
      title-inset: (x: 1em, y: .2em),
    ),
    set-theorem-title-style(theorem,
      color: black,
    ),
    
    // COROLLARY 
    set-theorem(corollary,
      title: build-title("corollary"),
      counter: thm-counter,
      above: 1.3em,
    ),
    set-theorem-frame(corollary,
      border-color: black,
      body-inset: (x: 1em, bottom: 1em, top: .7em),
      title-inset: (x: 1em, y: .2em),
    ),
    set-theorem-title-style(corollary,
      color: black,
    ),
    
    // EXAMPLE
    set-theorem(example,
      title: build-simple-title("example"),
      counter: thm-counter,
    ),
    set-theorem-frame(example,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0.3em),
    ),

    // REMARK
    set-theorem(remark,
      title: build-simple-title("remark"),
      counter: thm-counter
    ),
    set-theorem-frame(remark,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0.3em),
    ),

    // NOTATION
    set-theorem(notation, 
      title: build-simple-title("notation"),
      counter: thm-counter
    ),
    set-theorem-frame(notation,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0.3em),
    ),


    // PROOF
    set-theorem(proof,
      title: [_#get-theorem-title("proof"):_],
      above: 0.4em
    ),
    set-theorem-frame(proof,
      border-color: white,
      body-inset: (x: 1em, y: 0.65em),
      title-inset: (x: 1em, y: 0.65em),
    ),
    set-theorem-body-style(proof,
      suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
    ),
    
  )
  body
}