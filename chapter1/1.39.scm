(define (cont-frac-iterative n d k)
  (define (iter i result)
    (if (< i 1)
      result
      (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

(define (tan-cf x k)
  (cont-frac-iterative (lambda (i) (if (= i 1) x (- (square x))))
                       (lambda (i) (- (* 2 i) 1))
                       k))

(define pi 3.1415926535)

(newline)
(display (tan-cf (/ pi 4) 100))
