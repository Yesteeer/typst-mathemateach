#import "core/theorem-core.typ": (
  theorem_,
  set-theorem,
  set-theorem-body-style,
  set-theorem-footer-style,
  set-theorem-frame,
  set-theorem-sep,
  set-theorem-shadow,
  set-theorem-title-style
)

// basic theorem block

#let theorem = theorem_.with(
  kind: "theorem",
)

#let example = theorem_.with(
  kind: "exercise"
)

#let proposition = theorem_.with(
  kind: "proposition"
)

#let lemma = theorem_.with(
  kind: "lemma"
)

#let corollary = theorem_.with(
  kind: "corollary"
)

#let definition = theorem_.with(
  kind: "definition"
)

#let remark = theorem_.with(
  kind: "remark"
)

#let proof = theorem_.with(
  kind: "proof"
)

#let notation = theorem_.with(
  kind: "notation"
)

