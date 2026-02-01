// translations for theorem names

#let exam-lexicon = (
  question: (
    fr: "Exercice",
    de: "Ũbung",
    en: "Exercise"
  ),
  problem: (
    fr: "Problème",
    en: "Problem",
    de: "Problem"
  ),
)

#let get-exam-transl(kind) = (
  context{
    return exam-lexicon.at(kind, default: (kind: kind)).at(text.lang, default: kind)
  }
)
