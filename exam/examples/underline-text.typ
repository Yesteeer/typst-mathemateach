#import "../../lib.typ": *

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
