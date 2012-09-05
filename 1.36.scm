(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (let ((next (f guess)))
      (newline)
      (display count)
      (display ": ")
      (display next)
      (if (close-enough? guess next)
          next
          (try next (+ count 1)))))
  (try first-guess 1))

;regular relaxation
(display "regular")
(define power-x-x
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 2))

;average relaxation
(newline)
(display "improved")
(define (average a b)
  (/ (+ a b) 2))
(define power-x-x-improved
  (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2))
