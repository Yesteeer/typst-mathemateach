#import "@preview/elembic:1.1.1" as e
#import "@preview/rich-counters:0.2.2" as rc
#import "../theorem/rules.typ": *
#import "models.typ": generic-question, generic-subquestion
#import "func.typ": build-title

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

// needs context
#let get-exercise-points(counter) = {
    let exercise-number = if counter != none {(counter.get)().first() - 1} else {none}
    let exercise-points = if exercise-number != none {exam-exercise-points.final().at(str(exercise-number), default: 0)} else {0}
    return exercise-points
}

#let question(points: 0, body, title: build-title("question"), ..args) = {context{
  let exercise-number = (question-counter.get)().at(0)
  exam-exercise-points.update(c => c + (str(exercise-number): points))
  generic-question(
    title: if type(title) == function {
      (counter, name) => title(get-exercise-points(counter), counter, name)
    } else {title},
    counter: question-counter,
    ..args.named(),
    body
  )
}}

#let subquestion(points: 0, body, title: (counter, name) => [#(counter.get)().at(1)#h(.2em))#h(.5em)], ..args) = {
  exam-exercise-points.update(c => c + c.pairs().map(
    ((k, v)) => if k == str(c.keys().len() - 1) {
      (k, v + points)
    } else {
      (k, v)
    }
  ).to-dict())
  generic-subquestion(
    title: title,
    counter: subquestion-counter,
    footer: [#h(1fr)#sym.slash #points],
    ..args.named(),
    body
  )
}

