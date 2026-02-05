#import "../../lib.typ": *

// import underline style
#import exam.boxed-pts: *

#set page(height: auto, margin: 1cm)

// applies header template
#show: show-template

// applies exam style
#show: show-exam


#question[
  This question has two parts
  #subquestion(points: 3)[First part #v(2em)]
  #subquestion(points: 5)[Second part #v(2em)]
]

#question(points: 7)[
  This question has only one part
]

#question(title: build-title("Difficult exercise"), points: 6)[This is a difficult question.]

#question(title: [*Bonus* #h(1fr)/ 3], counter: none)[This is a bonus question whose points are not added to the total.]

#question(points: 7, label: <this-exercise>)[
  The bonus above has no counter, so this is @this-exercise.
]
