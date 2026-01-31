#import "@preview/elembic:1.1.1" as e
#import "../core.typ": (
  question_, 
  question, 
  subquestion_, 
  subquestion, 
  set-theorem, 
  set-theorem-frame, 
  set-theorem-title-style, 
  set-theorem-footer-style,
  set-theorem-body-style,
  set-theorem-sep,
  set-theorem-shadow,
)

#let show-exam(body) = {
  show: e.apply(

    // BOTH
    set-theorem-title-style(
      question_, subquestion_,
      color: black,
    ),
    set-theorem-footer-style(
      question_, subquestion_,
      sep-thickness: 0pt,
    ),
    set-theorem-frame(
      question_, subquestion_,
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
      question_,
      title-inset: (x: 0em, y: 0.65em),
      body-inset: (x: 0em, y: .8em),
    ),
    set-theorem-title-style(
      question_,
      sep-thickness: 1pt,
    ),

    // SUBQUESTION
    set-theorem(
      subquestion_,
      title: none,
    ),
    set-theorem-title-style(
      subquestion_,
      inline: true,
      sep-thickness: 0pt,
    ),
  )
  body
}

