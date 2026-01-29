// translations for theorem names

#let theorem-lexicon = (
  theorem: (
    fr: "Théorème",
    de: "Satz",
    en: "Theorem"
  ),
  lemmma: (
    fr: "Lemme",
    de: "Lemma",
    en: "Lemma"
  ),
  corollary: (
    fr: "Corollaire",
    de: "Korollar",
    en: "Corollary"
  ),
  remark: (
    fr: "Remarque",
    de: "Bemerkung",
    en: "Remark"
  ),
  definition: (
    fr: "Définition",
    de: "Definition",
    en: "Definition"
  ),
  example: (
    fr: "Exemple",
    de: "Beispiel",
    en: "Example",
  ),
  exercise: (
    fr: "Exercice",
    de: "Übung",
    en: "Exercise",
  ),
  notation: (
    fr: "Notation",
    de: "Notation",
    en: "Notation",
  ),
  proof: (
    fr: "Démonstration",
    de: "Beweis",
    en: "Proof",
  ),
  note: (
    fr: "Note",
    de: "Anmerkung",
    en: "Note",
  ),
  axiom: (
    fr: "Axiome",
    de: "Axiom",
    en: "Axiom",
  )
)

#let get-theorem-title(kind) = (
  context{
    return theorem-lexicon.at(kind, default: (
      theorem: (
        fr: "Théorème",
        de: "Satz",
        en: "Theorem"
      )),
    ).at(text.lang, default: "Theorem")
  }
)