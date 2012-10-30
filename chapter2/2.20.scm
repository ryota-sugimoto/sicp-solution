(define (same-parity a . b)
  (define (iter remain parity)
    (if (null? remain)
        remain
        (if (parity (car remain)) (cons (car remain) 
                                        (iter (cdr remain) parity))
                                  (iter (cdr remain) parity))))
  (cons a (iter b (if (even? a) even? odd?))))
;This function will generate recursive process.
;I could not find out iterate procedure which doesn't require us 
;to revese the result sequence after itereate all elements.
;See 2.22.scm

(newline)
(display (same-parity 1 2 3 4 5 6 7))
(newline)
(display (same-parity 2 3 4 5 6 7))
