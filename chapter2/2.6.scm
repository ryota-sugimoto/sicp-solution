(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define three (lambda (f) (lambda (x) (f (f (f x))))))

(define (+ a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))


;convert church numeral to godel numeral
(define (convert church)
  ((church (lambda (n) (1+ n))) 0))

(newline)
(display (convert zero))
(newline)
(display (convert (add-1 zero)))
(newline)
(display (convert one))
(newline)
(display (convert two))
(newline)
(display (convert (+ three two)))
