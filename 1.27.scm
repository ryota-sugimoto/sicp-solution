(define (expmod base exp m)
  (cond ((= exp 0 ) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m)
        )
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m)
        )
  )
)

(define (pass-fermat? n)
  (define (pass? a)
    (= (expmod a n n) a)
  )
  (define (try a)
    (cond ((= a n) true)
          ((pass? a) (try (+ a 1))) 
          (else false)
    )
  )
  (try 1)
)

(define (report n)
  (display n)
  (if (pass-fermat? n) (display " passed Fermat test.")
                       (display " couldn't pass Fermat test.")
  )
  (newline)
)

(newline)
(report 4)
(report 561)
(report 1105)
(report 1729)
(report 2465)
(report 2821)
(report 6601)
