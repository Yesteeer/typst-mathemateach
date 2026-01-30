#import "@preview/showybox:2.0.4": showybox
#import "@preview/rich-counters:0.2.2" as rc
#import "@preview/elembic:1.1.1" as e

#import "../src/theorem-core.typ": (
  theorem_,
  set-theorem,
  set-theorem-body-style,
  set-theorem-footer-style,
  set-theorem-frame,
  set-theorem-sep,
  set-theorem-shadow,
  set-theorem-title-style
)

#import "../src/lang.typ": get-theorem-title

// basic theorem block

#let theorem = theorem_.with(
  kind: "theorem",
)

#let example = theorem_.with(
  kind: "exercise"
)

#let definition = theorem_.with(
  kind: "definition"
)

#let remark = theorem_.with(
  kind: "remark"
)

#let proof = theorem_.with(
  kind: "proof"
)


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
    // GENERAL
    set-theorem-title-style(
      color: black,
      sep-thickness: 0pt,
      boxed-style: (:),
      inline: true,
    ),
    set-theorem-frame(
      title-color: white,
      border-color: white,
      footer-color: white,
      body-inset: (x: 0em, y: 0.65em),
      title-inset: (x: 0em, y: 0em),
    ),

    // THEOREM
    set-theorem(theorem,
      title: [*#get-theorem-title("theorem")*],
      counter: thm-counter
    ),
    
    // EXAMPLE
    set-theorem(example,
      title: [_#get-theorem-title("example")_],
      counter: thm-counter,
    ),

    // REMARK
    set-theorem(remark,
      title: [#get-theorem-title("remark")],
    ),

    set-theorem-title-style(remark,
      boxed-style: none,
      inline: false
    ),

    // PROOF
    set-theorem-title-style(proof,
      weight: "regular"
    ),

    set-theorem-body-style(proof,
      prefix: "Démonstration." + h(.4em),
      suffix: h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))
    ),

    set-theorem-frame(proof,
      body-inset: (x: 1em),
      footer-inset: (x: .5em, y: .0em),
    ),
    
  )
  body
}