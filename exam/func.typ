#import "../global.typ": linguify, lang-database

// builds a default title
#let build-title(kind) = (points, counter, name) => {
  [*#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]* #h(1fr) #h(2em)*#sym.slash* #if points != 0 [*#points*] else [#hide("0.0")]]
}