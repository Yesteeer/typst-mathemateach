#import "../global.typ": *

#let resolve-title(title, counter, name) = {
  if type(title) == function {
    return title(counter, name)
  } 
    return title
}

#let resolve-shadow(actual-shadow, arg-shadow) = {
  let shadow = actual-shadow+ arg-shadow
  let color = shadow.color
  let offset = shadow.offset
  if color == none {
    if offset == none {
      none
    } else {
      (color: luma(128), offset: offset)
    }
  } else if offset == none {
    (color: color, offset: 5pt)
  } else {
    shadow
  }
}

#let resolve-spacing(above, below) = {
  if above == none {
    none
  } else {
    (above: above)
  } + if below == none {
    none
  } else {
    (below: below)
  }
}

#let resolve-body(prefix, body, suffix, counter, title, name, inline) = {
  let start-content = []
  let end-content = []
  if inline {
    prefix += resolve-title(title, counter, name)
  }
  if type(body) == array and body.len() > 1 {
    start-content += prefix
    start-content += body.first()
    end-content += body.last()
    end-content += suffix
    return (start-content, ..body.slice(1, body.len()-1), end-content)
  } else {
    return (prefix + body.first() + suffix,)
  }
}

#let resolve-supplement(it) = [#linguify(it.kind, from: lang-database)]

#let build-title(kind) = (counter, name) => {
  [*#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]*#if name != "" [ _(#name) _]]
}

#let build-simple-title(kind) = (counter, name) => {
  [_#linguify(kind, from: lang-database, default: kind) #if counter != none [#(counter.display)()]#if name != "" [ _(#name) _]_]
}