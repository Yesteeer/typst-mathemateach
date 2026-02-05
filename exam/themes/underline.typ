#import "@preview/elembic:1.1.1" as e
#import "../themes-import.typ": *
#import "../header.typ": show-header
#import "../func.typ": build-title

#let show-exam(body) = {
  show: e.prepare()
  
  show: e.apply(

    // BOTH
    set-box-title-style(
      generic-question, generic-subquestion,
      color: black,
    ),
    set-box-footer-style(
      generic-question, generic-subquestion,
      sep-thickness: 0pt,
    ),
    set-box-frame(
      generic-question, generic-subquestion,
      title-color: white,
      border-color: black,
      footer-color: white,
      thickness: none,
      body-inset: (x: 0em, y: 0.3em),
      title-inset: (x: 0em, y: 0em),
      footer-inset: (x: 0em, y: 0em),
    ),

    // QUESTION
    set-box-frame(
      generic-question,
      title-inset: (x: 0em, y: 0.65em),
      body-inset: (x: 0em, y: .8em),
    ),
    set-box-title-style(
      generic-question,
      sep-thickness: 1pt,
    ),

    // SUBQUESTION
    set-box(
      generic-subquestion,
      title: none,
    ),
    set-box-title-style(
      generic-subquestion,
      inline: true,
      sep-thickness: none,
    ),
    set-box-frame(
      generic-subquestion,
      body-inset: (
        left: .6em
      )
    ),
  )
  body
}

