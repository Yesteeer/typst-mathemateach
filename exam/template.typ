#import "core.typ": exam-exercise-points
#let show-template(
  body,
  title: "Épreuve",
  time: "90 min",
  material: "",
  bonus: 2,
  units: 2,
  notation: 1
) = {
  let to-fill(length: 5cm) = {
    $underline(#h(length))$
  }
  rect(
    inset: 1em,
    width: 100%,
    [
      #set par(leading: 2em)
      #text(size: 16pt)[*#title*]\
      #emph[
        Nom : #to-fill()  #h(1fr) Date : #to-fill()\
        Prénom: #to-fill()  #h(1fr) Classe : #to-fill()\
        #if time != "" [Durée : #time] #if material != "" [#h(1fr) Matériel autorisé: #material]\
        Propreté du travail: #strong[\- 2 si travail bâclé] #h(1fr) #if bonus != 0 [Points défis: #to-fill(length:1cm) / #bonus (bonus)]  \
        #if units != 0 [Arrondis et unités: #to-fill(length:1cm) / #units #h(1fr) ] #if notation != 0 [Notations correctes: #to-fill(length:1cm) / #notation] #if units != 0 or notation != 0 [\ ]
        #h(1fr)  Total: #to-fill(length:1cm) / #context{exam-exercise-points.final().values().sum() + units + notation}\
      ]
    ]
  )
  body
}
