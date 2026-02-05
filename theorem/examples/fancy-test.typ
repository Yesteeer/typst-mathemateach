#import "../../lib.typ": *

// import fancy style
#import theorem.fancy: * 

#set page(height: auto, margin: 1cm)
#set heading(numbering: "1.")

// applies the imported style, with theorem counter based on level-1 headings
#show: show-theorem.with(counter-level: 1)  

= Géométrie euclidienne

// a generic customisable box with matching styling (use (counter, name) => [] for custom title)
#generic-box(title: build-title("Formula"), counter: none)[This is an important formula.]

#definition[ #lorem(10) ]

#remark(counter: none)[ #lorem(10) ]

#lemma[ #lorem(10) ]

#example[ #lorem(10) ]

#proposition[ #lorem(10) ]

#notation[ #lorem(10) ]

// a theorem followed by its proof
#theorem(label: <thm1>, name: [Pythagorean Theorem])[ #lorem(10) ]
#proof[ This is a proof of @thm1. ]

#corollary[ #lorem(10) ]