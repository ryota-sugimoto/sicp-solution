(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (term a) result))))
  (iter a 1))

(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recursive term (next a) next b))))

(define (factorial n)
  (define product product-iterative)
  (define (identity x) x)
  (define (inc a) (+ a 1))
  (product identity 1 inc n))

(newline)
(display "factorial(10) = ")
(display (factorial 10))

(define (pi-product n)
  (define product product-iterative)
  (define (next a) (+ a 2))
  (define (identity x) x)
  (* 4.0 
    (/ (/ (square (product identity 2 next (* 2 n))) 
          2)
       (/ (square (product identity 3 next (+ (* 2 n) 1)))
          (+ (* 2 n) 1)))))

(newline)
(display "pi: ")
(display (pi-product 1000))
