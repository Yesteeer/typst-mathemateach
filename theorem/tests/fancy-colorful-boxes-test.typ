#import "../../lib.typ": *
#import theorem.fancy-colorful-boxes: *
#import "@preview/elembic:1.1.1" as e

#show: apply-default
#show: show-theorem.with(counter-level: 1)

= Géométrie euclidienne

#definition[ #lorem(20) ]

Quelques mots supplémentaires.

#example[ #lorem(10) ]

#lemma[ #lorem(20) ]

#remark[ #lorem(20) ]

#proposition[ #lorem(20) ]

#notation[ #lorem(20) ]

#theorem(label: <thm1>, name: [Théorème de Pythagore])[ 
  #lorem(30)
]
  
#proof[ Ceci est une démonstration du @thm1. #lorem(50) ]

#corollary(name: [Réciproque du @thm1])[ #lorem(20) ]

= Trigonométrie

#definition[ #lorem(20) ]

#definition[ #lorem(20) ]
