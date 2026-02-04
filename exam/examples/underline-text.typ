#import "../../lib.typ": *

// import underline style
#import exam.underline: * 

#set page(height: auto, margin: 1cm)

// applies the imported style, with theorem counter based on level-1 headings
#show: show-exam.with(
  title: [Exam]
)


#question[
  This question has two parts
  #subquestion(points: 3)[First part #v(5em)]
  #subquestion(points: 5)[Second part #v(5em)]
]

#question(points: 7)[
  This question has only one part
]

#question(title: (points, counter, name) => [*Difficult exercise #(counter.display)()* #h(1fr)/ #points], points: 6)[This is a difficult question.]