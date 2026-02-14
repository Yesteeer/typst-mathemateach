#import "core.typ": generic-box

// basic theorem block

#let styled-box = generic-box.with(
  kind: "styled-box",
)

#let theorem = generic-box.with(
  kind: "theorem",
)

#let example = generic-box.with(
  kind: "exercise"
)

#let proposition = generic-box.with(
  kind: "proposition"
)

#let lemma = generic-box.with(
  kind: "lemma"
)

#let corollary = generic-box.with(
  kind: "corollary"
)

#let definition = generic-box.with(
  kind: "definition"
)

#let remark = generic-box.with(
  kind: "remark"
)

#let proof = generic-box.with(
  kind: "proof"
)

#let notation = generic-box.with(
  kind: "notation"
)

