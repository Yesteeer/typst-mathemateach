#import "../../lib.typ": *

// import simple style
#import theorem.box-colorful: * 

#set page(height: 12cm)

// *optional*: personal default settings (fonts, layout, etc.)
#show: apply-default 

// applies the imported style, with theorem counter based on level-1 headings
#show: show-theorem.with(counter-level: 1)  

// first chapter
= Géométrie euclidienne

// a simple definition
#definition[ #lorem(20) ]

// a simple theorem followed by its proof
#theorem(label: <thm1>, name: [Théorème de Pythagore])[ #lorem(30) ]
#proof[ Ceci est une démonstration du @thm1. #lorem(30) ]