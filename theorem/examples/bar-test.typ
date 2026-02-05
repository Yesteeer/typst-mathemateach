#import "../../lib.typ": *

// import bar style
#import theorem.bar: * 

#set page(height: auto, margin: 1cm)
#set heading(numbering: "1.")

// applies the imported style, with theorem counter based on level-1 headings
#show: show-theorem.with(counter-level: 1)  

= Géométrie euclidienne

// a generic customisable box with matching styling (use (counter, name) => [] for custom title)
#c(title: build-title("Formula"), counter: none)[This is an important formula.]

#definition[ #lorem(20) ]

#remark[ #lorem(20) ]

#lemma[ #lorem(20) ]

#example[ #lorem(20) ]

#proposition[ #lorem(20) ]

#notation[ #lorem(20) ]

// a theorem followed by its proof
#theorem(label: <thm1>, name: [Pythagorean Theorem])[ #lorem(30) ]
#proof[ This is a proof of @thm1. ]
