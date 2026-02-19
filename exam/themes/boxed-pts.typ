#import "../../deps.typ": *
//#import "../func.typ": build-title
#import "../models.typ": *
#import "../header.typ": show-header
#import "../core.typ": question, subquestion


#let build-title(kind) = (points, counter, name) => grid(
  columns: (1fr, 1fr),
  align: (left + horizon, right + horizon),
  [*#linguify(kind, from: lang-database, default: kind) #if counter != none [
    #(counter.display)()
  ]*],
  [#context{
    show: set-box(
      width: measure([*#sym.slash* #if points != 0 [*#points*] else [#hide("0.")]]).width + 3em);
      points-box[
        #h(1fr)*#sym.slash* #if points != 0 [*#points*] else [#hide("0.")]
      ]
    }
  ]
)

#let question = question.with(
  title: build-title("question")
)

#let show-exam(body, header: true) = {

  show: if header {show-header} else {none}

  show: e.prepare()
  
  show: e.apply(

    // BOTH
    set-box-title-style(
      generic-question, generic-subquestion, points-box,
      color: black,
    ),
    set-box-footer-style(
      generic-question, generic-subquestion, points-box,
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
      title-inset: (x: 0em, bottom: 0em, top:0em),
      body-inset: (x: 0em, y: 1em),
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
        right: .6em,
      ),
      body-inset: (
        left: .6em
      )
    ),

    // POINTS-BOX
    set-box(
      points-box,
      title: "",
      align: right,
    ),
    set-box-frame(
      points-box,
      body-inset: (left: 1.65em, right: .5em, y: 0.4em),
      title-inset: (bottom: 0em, rest: 0em),
      thickness: 1pt,
      radius: 0pt
    ),
    
  )
  body
}

