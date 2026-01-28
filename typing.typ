#import "@preview/elembic:1.1.1" as e

#import "theorem.typ": (
  theorem_,
  frame,
  body-style,
  footer-style,
  title-style,
  sep,
  shadow,
)


// basic theorem block

#let theorem = theorem_.with(
  kind: "thm",
)

#let example = theorem_.with(
  kind: "ex"
)

#let remark = theorem_.with(
  kind: "rem"
)

#let proof = theorem_.with(
  kind: "proof"
)


// custom set rules

#let set-theorem-sep = e.set_.with(sep)
#let set-theorem = e.set_.with(theorem_)
#let set-theorem-frame = e.set_.with(frame)
#let set-theorem-shadow = e.set_.with(shadow)
#let set-theorem-body-style= e.set_.with(body-style)
#let set-theorem-title-style = e.set_.with(title-style)
#let set-theorem-footer-style = e.set_.with(footer-style)