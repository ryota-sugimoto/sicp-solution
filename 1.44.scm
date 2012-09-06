(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter result i)
    (if (= i n)
        result
        (iter (compose f result) (+ i 1))))
  (iter f 1))

(define dx 0.0001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3.0)))

(define (n-smooth f n)
  ((repeated smooth n) f))
