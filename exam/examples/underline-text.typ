//#import "../../lib.typ": *
#import "@preview/showybox:2.0.4": showybox

/*
// import underline style
#import exam.underline: * 

#set page(height: auto, margin: 1cm)

// applies the imported style, with theorem counter based on level-1 headings
#show: show-exam

#generic-question(title: (counter, name) => [*custom question* #h(1fr) points: #h(2em)])[Ceci est une question au format custom.]

#question[
  Ceci est une première question en plusieurs parties
  #subquestion(points: 3)[Première partie]
  #subquestion(points: 5)[Deuxième partie]
]

#question[
  Ceci est une deuxième question sans points prédéfinis
]
*/

#showybox(
  frame: (
    border-color: black,
    title-color: white,
    thickness: 1pt,
  ),
  title-style: (
    color: black,
    sep-thickness: 1pt
  ),
  title: [Title 1]
)[test]

#showybox(
  frame: (
    border-color: black,
    title-color: white,
    thickness: (left: 1pt),
  ),
  title-style: (
    color: black,
    sep-thickness: 1pt
  ),
  title: [Title 2]
)[test]

#showybox(
  frame: (
    border-color: black,
    title-color: white,
    thickness: (left: 1pt)
  ),
  title-style: (
    color: black,
    sep-thickness: 0pt
  ),
  title: [Title 3]
)[test]

#showybox(
  frame: (
    border-color: black,
    title-color: white,
    thickness: (left: 1pt, rest: 0pt)
  ),
  title-style: (
    color: black,
    sep-thickness: 1pt
  ),
  title: [Title 4]
)[test]

#let strokes = (
    left: (thickness: 1pt), 
    right: (thickness: 1pt), 
    top: (thickness: 1pt), 
    bottom: (thickness: 3pt),
  )
#strokes.insert("bottom", none)
#block(
  width: 100%,
  inset: 10pt,
  stroke: (left: none, rest: 1pt),
  [test]
)
