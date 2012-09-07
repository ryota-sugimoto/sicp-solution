(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))


(define (cube x) (* x x x))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (next k) (+ k 2))
  (* (/ h 3.0 ) (+ (y 0)
                   (* 4 (sum y 1 next (- n 1)))
                   (* 2 (sum y 2 next (- n 2)))
                   (y n))))
                   

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (test_simpson n)
  (newline)
  (display n)
  (display ": ")
  (display (simpson cube 0 1 n)))

(define (test_integral n)
  (newline)
  (display n)
  (display ": ")
  (display (integral cube 0 1 n)))

(newline)
(display "integral")
(test_integral 0.01)
(test_integral 0.001)
(newline)
(display "simpson")
(test_simpson 1)
(test_simpson 10)
(test_simpson 100)
(test_simpson 1000)
