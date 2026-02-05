#import "@preview/elembic:1.1.1" as e
#import "core.typ": *

// custom set rules with theorem selector

#let set-box(..rules) = it => {
  show: if rules.pos() == () {e.set_(generic-box, ..rules.named())} else {
    e.cond-set(e.filters.or_(..rules.pos()),
      ..rules.named()
    )
  }
  it
}

#let set-box-body-style(..rules) = it => {
  show: if rules.pos().len() == 0 {e.set_(box-body-style, ..rules.named())} else {
    e.filtered(e.filters.or_(..rules.pos()),
      e.set_(box-body-style, ..rules.named())
    )
  }
  it
}

#let set-box-footer-style(..rules) = it => {
  show: if rules.pos() == () {e.set_(box-footer-style, ..rules.named())} else {
    e.filtered(e.filters.or_(..rules.pos()),
      e.set_(box-footer-style, ..rules.named())
    )
  }
  it
}

#let set-box-frame(..rules) = it => {
  show: if rules.pos() == () {e.set_(box-frame, ..rules.named())} else {
    e.filtered(e.filters.or_(..rules.pos()),
      e.set_(box-frame, ..rules.named())
    )
  }
  it
}


#let set-box-sep(..rules) = it => {
  show: if rules.pos() == () {e.set_(box-sep, ..rules.named())} else {
    e.filtered(e.filters.or_(..rules.pos()),
      e.set_(box-sep, ..rules.named())
    )
  }
  it
}

#let set-box-shadow(..rules) = it => {
  show: if rules.pos() == () {e.set_(box-shadow, ..rules.named())} else {
    e.filtered(e.filters.or_(rules.pos()),
      e.set_(box-shadow, ..rules.named())
    )
  }
  it
}

#let set-box-title-style(..rules) = it => {
  show: if rules.pos() == () {e.set_(box-title-style, ..rules.named())} else {
    e.filtered(e.filters.or_(..rules.pos()),
      e.set_(box-title-style, ..rules.named())
    )
  }
  it
}
