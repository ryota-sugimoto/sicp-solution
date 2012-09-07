(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
    result
    (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recursive combiner null-value (next a) next b))))

(define (sum term a next b)
  (define accumulate accumulate-iterative)
  (define (add x y) (+ x y))
  (accumulate add 0 term a next b))

(define (product term a next b)
  (define accumulate accumulate-iterative)
  (define (mul x y) (* x y))
  (accumulate mul 1 term a next b))

(define (identity x) x)
(define (inc x) (+ x 1))

(newline)
(display "sum 1-10: ")
(display (sum identity 1 inc 10))
(newline)
(display "factorial 10: ")
(display (product identity 1 inc 10))
