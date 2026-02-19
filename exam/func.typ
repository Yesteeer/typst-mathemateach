#import "@preview/linguify:0.5.0": linguify

#let lang-database = toml("../lang.toml")

// builds a default title
#let build-title(kind) = (points, kind, counter, name) => {
  [*#linguify(kind, from: lang-database, default: kind) #if counter != 0 [#(counter.display)()]* #h(1fr) #h(2em)*#sym.slash* #if points != 0 [*#points*] else [#hide("0.")]]
}
