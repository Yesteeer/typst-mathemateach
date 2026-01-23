#import "@preview/elembic:1.1.1" as e

#let basic-style(body) = {
  set text(font: "New Computer Modern Sans", size: 11pt)
  show math.equation: set text(font: "New Computer Modern Math", fallback: false)
  show: e.prepare()
  body
}
