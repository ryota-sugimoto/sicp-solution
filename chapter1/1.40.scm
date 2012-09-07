(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (newton-method g guess)
  (fixed-point-of-transform g newton-transform guess))

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a (square x)) (* b x) c)))

(define test-func (cubic 9 10 11))
(define zero-point (newton-method test-func 1))
(newline)
(display "value: ")
(display (test-func zero-point))
