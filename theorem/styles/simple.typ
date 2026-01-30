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

    // styling applied to all environments
    set-theorem(
      counter: thm-counter,
    ),
    set-theorem-title-style(
        color: black,
        sep-thickness: 1pt
    ),
    set-theorem-frame(
        title-color: white,
        border-color: white,
        footer-color: white,
        body-inset: (x: 0em, y: 0.65em),
        title-inset: (x: 0em, y: 0.15em),
    ),
    
    // styling applied to example environment
    set-theorem(example,
      title: [_#get-theorem-title("example")_]
    ),

    // styling applied to theorem environment
    set-theorem(theorem,
      title: [*#get-theorem-title("theorem")*]
    ),

    // styling applied to remark environment
    set-theorem(remark,
      title: [#get-theorem-title("remark")],
      counter: none,
    ),

    // styling applied to proof environment
    set-theorem(proof,
      counter: none,
    ),

    set-theorem-title-style(proof,
      weight: "regular"
    ),

    set-theorem-frame(proof,
      body-inset: (x: 1em),
      footer-inset: (x: .5em, y: .0em),
    ),
    
  )
  body
}

#let proof(..args, body) = theorem_(
  ..args.named(),
  kind: "proof",
  [_#get-theorem-title("proof"):_] + h(1em) + body + h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))

)