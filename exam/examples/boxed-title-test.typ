#import "../../lib.typ": *

// import boxed-title style
#import exam.boxed-title: *

#set page(height: auto, margin: 1cm)

// apply exam style
#show: show-exam


#question[
  This question has two parts
  #subquestion(points: 3)[First part #v(2em)]
  #subquestion(points: 5)[Second part #v(2em)]
]

#question(points: 0)[
  This question has only one part and no defined total number of points.
]

#question(title: build-title("Difficult question"), points: 6)[This is a difficult question.]

#question(title: [*Bonus*], counter: none)[This is a bonus question.]

#question(points: 7, label: <this-question>)[
  The bonus above has no counter, so this is @this-question.
]
