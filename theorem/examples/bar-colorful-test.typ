#import "../../lib.typ": *
#import "@preview/elembic:1.1.1" as e

// import simple style
#import theorem.bar-colorful: * 

#set page(height: auto)

// *optional*: personal default settings (fonts, layout, etc.)
#show: apply-default 

// applies the imported style, with theorem counter based on level-1 headings
#show: show-theorem.with(counter-level: 1)  

// first chapter
= Géométrie euclidienne

// a definition
#definition[ #lorem(20) ]

// an example
#example[ #lorem(20) ]

// a theorem followed by its proof
#theorem(label: <thm1>, name: [Théorème de Pythagore])[ #lorem(30) ]
#proof[ Ceci est une démonstration du @thm1. #lorem(30) ]