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
    e.cond-set(example,
      title: [_#get-theorem-title("example")_]
    ),

    // styling applied to theorem environment
    e.cond-set(theorem,
      title: [*#get-theorem-title("theorem")*]
    ),

    // styling applied to remark environment
    e.cond-set(remark,
      title: [*#get-theorem-title("remark")*],
      counter: none,
    ),

    // styling applied to proof environment
    e.cond-set(proof,
      counter: none,
    ),

    e.filtered(proof,
      set-theorem-title-style(
        weight: "regular"
      )
    ),

    e.filtered(proof,
      set-theorem-frame(
        body-inset: (x: 1em),
        footer-inset: (x: .5em, y: .0em),
      )
    ),

    e.filtered(proof,
      set-theorem-footer-style(
        align: end,
      )
    ),
    
  )
  body
}

#let proof(..args, body) = theorem_(
  ..args.named(),
  kind: "proof",
  [_#get-theorem-title("proof"):_] + h(1em) + body + h(1fr) + h(1.2em) + box(height: 0.65em, text(1.6em, baseline: -.2em, sym.square))

)