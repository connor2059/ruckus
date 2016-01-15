#lang racket

(require "../lang/evaluator.rkt")
(require "../lang/loader.rkt")
(require "./glsl.rkt")

(define (shaderdump path)
  (let ([gen (load-frep path)])
    (for ([line (in-list (node->glsl (call-with-edsl-root gen)))])
      (displayln line))))

(command-line
  #:program "shaderdump"
  #:args (path)
  (shaderdump path))