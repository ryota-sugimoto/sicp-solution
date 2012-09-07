(define (cont-frac-iterative n d k)
  (define (iter i result)
    (if (< i 1)
      result
      (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

(define (cont-frac-recursive n d k)
  (define (iter i)
    (if (>= i k) (/ (n k) (d k))
                (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define (golden-ratio k)
  (/ 1 (cont-frac-iterative (lambda (i) 1.0)
                            (lambda (i) 1.0)
                            k)))

(define (test k)
  (newline)
  (display "k=")
  (display k)
  (display ": ")
  (display (golden-ratio k)))

(test 10)
(test 100)
(test 1000)
