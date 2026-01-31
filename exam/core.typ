#import "@preview/elembic:1.1.1" as e
#import "@preview/rich-counters:0.2.2" as rc
#import "../theorem/theorem.typ":*
#import simple: (
  generic-theorem, 
  set-theorem, 
  set-theorem-frame, 
  set-theorem-title-style, 
  set-theorem-footer-style,
  set-theorem-body-style,
  set-theorem-sep,
  set-theorem-shadow,
)
#import "lang.typ": get-exam-transl

// define questions
#let question_ = generic-theorem.with(
  kind: "question"
)

#let subquestion_ = generic-theorem.with(
  kind: "subquestion"
)

// keep track of points for each exercise by its counter
#let exam-exercise-points = state("exam-exercise-pts", (:))

//define counters
#let question-counter = rc.rich-counter(
  identifier: "question-counter",
  inherited_levels: 0,
) 

#let subquestion-counter = rc.rich-counter(
  identifier: "subquestion-counter",
  inherited_levels: 0,
  inherited_from: question-counter,
)


// build question title
#let build-title(kind) = (counter, name) => {
  [*#get-exam-transl(kind) #(counter.display)()* #h(1fr) #context{
    let exercise-number = (counter.get)().first() - 1
    let exercise-points = exam-exercise-points.final().at(str(exercise-number), default: 0)
    [#h(1fr)*#sym.slash* #if exercise-points != 0 [*#exercise-points*] else [#hide("0.0")]]
  }]
}

#let question(points: 0, body, ..args) = {context{
  let exercise-number = (question-counter.get)().at(0)
  exam-exercise-points.update(c => c + (str(exercise-number): points))
  question_(
    title: build-title("question"),
    counter: question-counter,
    ..args,
    body
  )
}}

#let subquestion(points: 5, body, ..args) = {
  exam-exercise-points.update(c => c + c.pairs().map(
    ((k, v)) => if k == str(c.keys().len() - 1) {
      (k, v + points)
    } else {
      (k, v)
    }
  ).to-dict())
  subquestion_(
    title: (counter, name) => [#(counter.get)().at(1)#h(.2em))#h(.5em)],
    counter: subquestion-counter,
    footer: [#h(1fr)#sym.slash #points],
    ..args,
    body
  )
}

