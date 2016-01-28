#lang racket/gui

(require racket/runtime-path)

(require (planet "rgl.rkt" ("stephanh" "RacketGL.plt" 1 4)))
(require ffi/vector)

(require "../core/math.rkt")
(require "../core/model.rkt")
(require "./glsl.rkt")
(require "./two-viewer.rkt")

; ------------------------------------------------------------------------------
; Command line interface.

(command-line
  #:program "two"

  #:usage-help
  "Displays a design interactively in 2D mode."

  #:ps
  ""
  "Keyboard/mouse usage:"
  "- Scroll wheel / gesture zooms."
  "- F5 reloads and recompiles any changes to the design."

  #:args (design-path)
  (begin
    (define frame
      (new frame%
           [label "Ruckus 2D"]
           [width 300]
           [height 300]))

    (define v
      (new two-viewer%
           [style '(gl no-autoclear)]
           [parent frame]
           [design-path design-path]))

    (send frame show #t)))