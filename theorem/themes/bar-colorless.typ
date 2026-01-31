#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../models.typ": *
#import "../lang.typ": get-theorem-title

// show rule to apply style

#let show-theorem(body, counter-level: none) = {

  let build-title(kind) = (counter, name) => {
    [*#get-theorem-title(kind) #(counter.display)()*#if name != "" [ _(#name) _]]
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
  
  show: e.apply(
    // GENERAL
    set-theorem(
      counter: thm-counter,
    ),
    set-theorem-title-style(
      color: black,
      sep-thickness: 0pt,
    ),
    set-theorem-frame(
      title-color: white,
      border-color: black,
      body-inset: (x: 0.65em, bottom: 1em, top: 0.3em),
      title-inset: (x: 1.2em, top: .4em),
      thickness: (left: 1.5pt, rest: 0pt),
      radius: 0pt
    ),

    // box style of: example, remark, notation, proof
    set-theorem-frame(
      example, remark, notation, proof,
      border-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0.65em),
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
      title: [_#get-theorem-title("proof"):_],
      above: 0.4em,
      counter: none,
    ),
    set-theorem-frame(proof,
      border-color: white,
      body-inset: (x: 1em, y: 0.65em),
      title-inset: (y: 0.65em),
    ),
    set-theorem-body-style(proof,
      suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
    ),
    
  )
  body
}