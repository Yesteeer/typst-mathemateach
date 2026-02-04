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
#import "../theorem/lang.typ": get-theorem-title

// define questions
#let generic-question = generic-theorem.with(
  kind: "question"
)

#let generic-subquestion = generic-theorem.with(
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

#let get-exercise-points(counter) = {
   context{
    let exercise-number = if counter != none {(counter.get)().first() - 1} else {none}
    let exercise-points = if exercise-number != none {exam-exercise-points.final().at(str(exercise-number), default: 0)} else {none}
    return exercise-points
  }
}

// builds a default title
#let build-title(kind) = (points, counter, name) => {
  [*#get-theorem-title(kind) #if counter != none [#(counter.display)()]* #h(1fr) #h(2em)*#sym.slash* #if points != 0 [*#points*] else [#hide("0.0")]]
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

#let subquestion(points: 5, body, title: (counter, name) => [#(counter.get)().at(1)#h(.2em))#h(.5em)], ..args) = {
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

