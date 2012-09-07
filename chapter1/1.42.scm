(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc n) (+ n 1))

(newline)
(display ((compose square inc) 6))
