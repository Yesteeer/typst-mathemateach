#import "../../lib.typ": *

// import underline style
#import exam.boxed-title: *

#set page(height: auto, margin: 1cm)

// show exam header with total points
#show: show-header

// apply exam style
#show: show-exam


#question[
  This question has two parts
  #subquestion(points: 3)[First part #v(2em)]
  #subquestion(points: 5)[Second part #v(2em)]
]

#question(points: 7)[
  This question has only one part
]

#question(title: build-title("Difficult question"), points: 6)[This is a difficult question.]

#question(title: [*Bonus* #h(1fr)/ 3], counter: none)[This is a bonus question whose points are not added to the total.]

#question(points: 7, label: <this-question>)[
  The bonus above has no counter, so this is @this-question.
]