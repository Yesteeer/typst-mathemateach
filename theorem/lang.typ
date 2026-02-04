// translations for theorem names

#let theorem-lexicon = (
  theorem: (
    fr: "Théorème",
    de: "Satz",
    en: "Theorem"
  ),
  lemma: (
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
  ),
  proposition: (
    fr: "Proposition",
    de: "Proposition",
    en: "Proposition"
  ),
  problem: (
    fr: "Problème",
    en: "Problem",
    de: "Problem"
  ),
  assumption: (
    fr: "Hypothèse",
    en: "Assumption",
    de: "Annahme"
  ),
  conclusion: (
    fr: "Conclusion",
    en: "Conclusion",
    de: "Schlussfolgerung"
  ),
  property: (
    fr: "Propriété",
    en: "Property",
    de: "Eigenschaft"
  ),
  solution: (
    fr: "Solution",
    en: "Solution",
    de: "Lösung"
  ),
  tip: (
    fr: "Conseil",
    en: "Tip",
    de: "Hinweis"
  ),
  important: (
    fr: "Important",
    en: "Important",
    de: "Wichtig"
  ),
  conjecture: (
    fr: "Conjecture",
    en: "Conjecture",
    de: "Vermutung"
  ),
  caution: (
    fr: "Attention",
    en: "Caution",
    de: "Vorsicht"
  ),
  question: (
    fr: "Exercice",
    de: "Ũbung",
    en: "Exercise"
  ),
)

#let get-theorem-title(kind) = (
  context{
    return theorem-lexicon.at(kind, default: (
      kind: kind),
    ).at(text.lang, default: kind)
  }
)

#let build-title(kind) = (counter, name) => {
  [*#get-theorem-title(kind) #if counter != none [#(counter.display)()]*#if name != "" [ _(#name) _]]
}

#let build-simple-title(kind) = (counter, name) => {
  [_#get-theorem-title(kind) #if counter != none [#(counter.display)()]#if name != "" [ _(#name) _]_]
}

