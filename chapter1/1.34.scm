(define (f g)
  (g 2))

;(f f) will be interepreted as (2 2).
;since 2 is not applicable, this will cause a error.
