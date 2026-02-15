#import "core.typ": exam-exercise-points

#let show-header(
  body,
  title: "Test",
  time: "",
  material: "",
  bonus: 0,
  units: 0,
  notation: 0,
  presentation: 0,
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
        #if time != "" [Durée : #time] #if material != "" [#h(1fr) Matériel autorisé: #material] #if time != "" or material != "" [\ ]
        #if presentation != 0 [Propreté du travail: #to-fill(length:1cm) / #presentation] #h(1fr) #if bonus != 0 [Points défis: #to-fill(length:1cm) / #bonus (bonus)]  #if presentation != 0 or bonus != 0 [\ ]
        #if units != 0 [Arrondis et unités: #to-fill(length:1cm) / #units #h(1fr) ] #if notation != 0 [Notations correctes: #to-fill(length:1cm) / #notation] #if units != 0 or notation != 0 [\ ]
        #context{
          let pts = exam-exercise-points.final().values().sum(default: 0) + units + notation + presentation
          if pts != 0 {
            [#v(.2em)#h(1fr)Total: #to-fill(length:1cm) / #pts \ ]
          }
        }
      ]
    ]
  )
  body
}
