#import "../../lib.typ": *

// import underline style
#import exam.underline: * 

#set page(height: auto, margin: 1cm)

// applies the imported style, with parameters for exam title page
#show: show-exam.with(
  title: [Exam]
)


#question[
  This question has two parts
  #subquestion(points: 3)[First part #v(2em)]
  #subquestion(points: 5)[Second part #v(2em)]
]

#question(points: 7)[
  This question has only one part
]

#question(title: (points, counter, name) => [*Difficult exercise #(counter.display)() #h(1fr)/ #points*], points: 6)[This is a difficult question.]

#question(title: [*Bonus* #h(1fr)/ 3], counter: none)[This is a bonus question whose points are not added to the total.]

#question(points: 7, label: <this-exercise>)[
  The bonus above has no counter, so this is @this-exercise.
]
