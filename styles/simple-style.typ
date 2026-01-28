#import "@preview/showybox:2.0.4": showybox
#import "@preview/rich-counters:0.2.2" as rc

#import "../theorem.typ": *
#import "../typing.typ": *

// theorem environments styling

#let simple-theorem-style(body, counter-level: none) = {

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
        weight: "bold",
        sep-thickness: 0pt
    ),
    set-theorem-frame(
        title-color: white,
        border-color: white,
        footer-color: white,
        body-inset: (x: 0em, y: 0.65em),
        title-inset: (x: 0em, y: 0.35em),
    ),
    
    // styling applied to example environment
    e.cond-set(theorem_.with(kind: "ex"),
      title: [#context{get-theorem-title(text.lang).at("ex")}]
    ),

    // styling applied to theorem environment
    e.cond-set(theorem_.with(kind: "thm"),
      title: [#context{get-theorem-title(text.lang).at("thm")}]
    ),

    // styling applied to remark environment
    e.cond-set(theorem_.with(kind: "rem"),
      title: [#context{get-theorem-title(text.lang).at("rem")}],
      counter: none,
    ),

    // styling applied to proof environment
    e.cond-set(theorem_.with(kind: "proof"),
      title: [_#context{get-theorem-title(text.lang).at("proof")} :_],
      counter: none,
      footer: [#text(size: 18pt, sym.square.stroked)]
    ),

    e.filtered(theorem_.with(kind: "proof"),
      set-theorem-title-style(
        weight: "regular"
      )
    ),

    e.filtered(theorem_.with(kind: "proof"),
      set-theorem-frame(
        body-inset: (x: .5em),
        title-inset: (x: .5em),
        footer-inset: (x: .5em, y: .0em),
      )
    ),

    e.filtered(theorem_.with(kind: "proof"),
      set-theorem-footer-style(
        align: end,
      )
    ),
    
  )
  body
}