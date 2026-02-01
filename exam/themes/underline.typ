#import "@preview/elembic:1.1.1" as e
#import "../core.typ": (
  question_ as generic-question, 
  question, 
  subquestion_ as generic-subquestion, 
  subquestion, 
  set-theorem, 
  set-theorem-frame, 
  set-theorem-title-style, 
  set-theorem-footer-style,
  set-theorem-body-style,
  set-theorem-sep,
  set-theorem-shadow,
  build-title,
)

#let show-exam(body) = {
  show: e.apply(

    // BOTH
    set-theorem-title-style(
      generic-question, generic-subquestion,
      color: black,
    ),
    set-theorem-footer-style(
      generic-question, generic-subquestion,
      sep-thickness: 0pt,
    ),
    set-theorem-frame(
      generic-question, generic-subquestion,
      title-color: white,
      border-color: black,
      footer-color: white,
      thickness: 0pt,
      body-inset: (x: 0em, y: 0.3em),
      title-inset: (x: 0em, y: 0em),
      footer-inset: (x: 0em, y: 0em),
    ),

    // QUESTION
    set-theorem-frame(
      generic-question,
      title-inset: (x: 0em, y: 0.65em),
      body-inset: (x: 0em, y: .8em),
    ),
    set-theorem-title-style(
      generic-question,
      sep-thickness: 1pt,
    ),

    // SUBQUESTION
    set-theorem(
      generic-subquestion,
      title: none,
    ),
    set-theorem-title-style(
      generic-subquestion,
      inline: true,
      sep-thickness: 0pt,
    ),
  )
  body
}

