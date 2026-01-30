// basic styling

#let apply-default(body, lang: "fr") = {
  // set default text properties
  set text(font: "New Computer Modern Sans", size: 11pt, lang: lang)

  // set default numbering
  set enum(numbering: "1)")
  set page(numbering: (x, y) => context{ if counter(page).final().at(0) > 1 {text(size: 9pt)[#x / #y]}})
  set heading(numbering: "1.")

  // set default paragraphe justification
  set par(
    justify: true,
    leading: .8em 
  )
  
  // set default math font
  show math.equation: set text(font: "New Computer Modern Math", fallback: false)

  body
}