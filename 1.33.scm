(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
    result
    (if (filter a) (iter (next a) (combiner (term a) result))
                   (iter (next a) result))))
  (iter a null-value))

;prime?
(define (expmod base exp m)
  (define (remainder-square-signal a b)
    (define return (remainder (square a) b))
    (if (and (not (or (= a 1)
                      (= a (- b 1))))
             (= return 1))
        0
        return))
  (cond ((= exp 0 ) 1)
        ((even? exp)
         (remainder-square-signal (expmod base (/ exp 2) m)
                                  m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (prime? n (- times 1)))
        (else false)))
;end prime?

(define (sum-square-prime a b)
  (define (prime n) (prime? n 1000))
  (define (square x) (* x x))
  (define (inc x) (+ x 1))
  (filtered-accumulate prime + 0 square a inc b))

(define (product-coprise n)
  (define (coprise-filter i)
    (if (= (gcd i n) 1) true false))
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (filtered-accumulate coprise-filter * 1 identity 1 inc (- n 1)))


(newline)
(display "sum of square prime in 2 10 = ")
(display (sum-square-prime 2 10))

(newline)
(display "product coprise  10")
(display (product-coprise 10))
