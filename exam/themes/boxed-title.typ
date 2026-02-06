#import "@preview/elembic:1.1.1" as e
#import "../header.typ": show-header
#import "../themes-import.typ": *
#import "../func.typ": build-title

#let build-title(kind) = (points, counter, name) => [
  #points-box(
    [*#linguify(kind, from: lang-database, default: kind) #if counter != none [
      #(counter.display)()
    ]* #h(1fr) #h(2em) *#sym.slash* #if points != 0 [*#points*] else [#hide("0.")]]
  )
]

#let question = question.with(
  title: build-title("question"),
)

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
      sep-thickness: none,
    ),

    // SUBQUESTION
    set-box(
      generic-subquestion,
      title: "",
    ),
    set-box-title-style(
      generic-subquestion,
      inline: true,
      sep-thickness: none,
    ),
    set-box-frame(
      generic-subquestion,
      footer-inset: (
        right: .6em
      ),
      body-inset: (
        left: .6em
      ),
    ),

    // POINTS-BOX
    set-box(
      points-box,
      title: "",
      align: right,
    ),
    set-box-frame(
      points-box,
      body-inset: (left: 0.65em, right: .5em, y: 0.5em),
      title-inset: (bottom: 0em, rest: 0em),
      thickness: 1pt,
      radius: 0pt
    ),
  )
  body
}

