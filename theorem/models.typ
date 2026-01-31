#import "core/theorem-core.typ": (
  theorem_ as generic-theorem,
  set-theorem,
  set-theorem-body-style,
  set-theorem-footer-style,
  set-theorem-frame,
  set-theorem-sep,
  set-theorem-shadow,
  set-theorem-title-style
)

// basic theorem block

#let theorem = generic-theorem.with(
  kind: "theorem",
)

#let example = generic-theorem.with(
  kind: "exercise"
)

#let proposition = generic-theorem.with(
  kind: "proposition"
)

#let lemma = generic-theorem.with(
  kind: "lemma"
)

#let corollary = generic-theorem.with(
  kind: "corollary"
)

#let definition = generic-theorem.with(
  kind: "definition"
)

#let remark = generic-theorem.with(
  kind: "remark"
)

#let proof = generic-theorem.with(
  kind: "proof"
)

#let notation = generic-theorem.with(
  kind: "notation"
)

