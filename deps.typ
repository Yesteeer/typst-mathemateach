#import "@preview/linguify:0.5.0": linguify
#import "@preview/elembic:1.1.1" as e
#import "colors.typ": default-palette
#import "theorem/models.typ": *
#import "theorem/rules.typ": (
  set-box,
  set-box-sep,
  set-box-frame,
  set-box-shadow,
  set-box-body-style,
  set-box-title-style,
  set-box-footer-style
)

#let lang-database = toml("lang.toml")
