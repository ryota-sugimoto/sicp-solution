(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (make-segment start end) (cons start end))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(define (midpoint-segment segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (let ((start-x (x-point start))
           (start-y (y-point start))
           (end-x (x-point end))
           (end-y (y-point end)))
       (make-point (/ (+ start-x end-x) 2) (/ (+ start-y end-y) 2)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(let ((seg (make-segment (make-point 1 2) (make-point 3 4))))
  (print-point (midpoint-segment seg)))
