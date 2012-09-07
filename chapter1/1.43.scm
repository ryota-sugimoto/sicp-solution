(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter result i)
    (if (= i n)
        result
        (iter (compose f result) (+ i 1))))
  (iter f 1))

(newline)
(display ((repeated square 2) 5))
