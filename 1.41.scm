(define (double f)
  (lambda (x) (f (f x))))

(define (inc n)
  (+ n 1))

(define (many-double x)
  (((double (double double)) inc) x))

(newline)
(display (many-double 5))
;There is 3 double functions are nested.
;and each double function applies twice their argument function.
;thus many-double function applies inc function ((2^2)^2) = 16 times.
;return value will be 21.
