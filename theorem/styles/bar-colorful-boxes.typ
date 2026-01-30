#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../models.typ": *
#import "../colors.typ": *
#import "../lang.typ": get-theorem-title

// show rule to apply style

#let show-theorem(body, counter-level: none) = {

  let build-title(kind) = (counter, name) => {
    [_*#get-theorem-title(kind) #(counter.display)()*#if name != "" [ _(#name) _]_]
  }

   let build-simple-title(kind) = (counter, name) => {
    [_#get-theorem-title(kind) #(counter.display)()#if name != "" [ _(#name) _]_]
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
      border-color: black,
      body-inset: (x: 0.65em, bottom: 1em, top: 0.3em),
      title-inset: (x: 1.2em, top: 0.65em),
      thickness: (left: 2pt, rest: 0pt),
      radius: 0pt
    ),

    // DEFINITION
    set-theorem(definition,
      title: build-title("definition"),
      counter: thm-counter,
    ),
    set-theorem-frame(definition,
      body-color: colorful-cyan.lighten(80%),
      title-color: colorful-cyan.lighten(80%),
      border-color: colorful-cyan.darken(20%)
    ),

    // LEMMA 
    set-theorem(lemma,
      title: build-title("lemma"),
      counter: thm-counter
    ),
    set-theorem-frame(lemma,
      body-color: sand-beige.lighten(80%),
      title-color: sand-beige.lighten(80%),
      border-color: sand-beige.darken(20%)
    ),

    // PROPOSITION 
    set-theorem(proposition,
      title: build-title("proposition"),
      counter: thm-counter
    ),
    set-theorem-frame(proposition,
      body-color: colorful-bordeau.lighten(80%),
      title-color: colorful-bordeau.lighten(80%),
      border-color: colorful-bordeau.darken(20%)
    ),

    // THEOREM
    set-theorem(theorem,
      title: build-title("theorem"),
      counter: thm-counter
    ),
    set-theorem-frame(theorem,
      body-color: apple-green.lighten(80%),
      title-color: apple-green.lighten(80%),
      border-color: apple-green.darken(20%)
    ),

    
    // COROLLARY 
    set-theorem(corollary,
      title: build-title("corollary"),
      counter: thm-counter
    ),
    set-theorem-frame(corollary,
      body-color: colorful-purple.lighten(80%),
      title-color: colorful-purple.lighten(80%),
      border-color: colorful-purple.darken(20%)
    ),

    
    // EXAMPLE
    set-theorem(example,
      title: build-simple-title("example"),
      counter: thm-counter,
    ),
    set-theorem-frame(example,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0.65em),
    ),
    

    // REMARK
    set-theorem(remark,
      title: build-simple-title("remark"),
      counter: thm-counter
    ),
    set-theorem-frame(remark,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0.65em),
    ),

    // NOTATION
    set-theorem(notation, 
      title: build-simple-title("notation"),
      counter: thm-counter
    ),
    set-theorem-frame(notation,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0.65em),
    ),


    // PROOF
    set-theorem(proof,
      title: [_#get-theorem-title("proof"):_],
      above: 0.4em
    ),
    set-theorem-frame(proof,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0.65em),
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