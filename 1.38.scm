(define (cont-frac-iterative n d k)
  (define (iter i result)
    (if (< i 1)
      result
      (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

(define (e-constant k)
  (define (d i)
    (cond ((= (remainder i 3) 2) (* 2 (/ (+ i 1) 3)))
          (else 1)))
  (+ 2 (cont-frac-iterative (lambda (i) 1.0) d k)))

(define (test k)
  (newline)
  (display "k=")
  (display k)
  (display ": ")
  (display (e-constant k)))

(test 10)
(test 100)
(test 1000)
