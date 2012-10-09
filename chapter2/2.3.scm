(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (make-segment start end) (cons start end))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(define (make-rectangle-from-points top-left bottom-right)
  (cons top-left bottom-right))

(define (make-rectangle-from-segment segment)
  (cons (start-segment segment) (end-segment segment)))

(define (rectangle-height rectangle)
  (abs (- (y-point (car rectangle)) (y-point (cdr rectangle)))))

(define (rectangle-width rectangle)
  (abs (- (x-point (cdr rectangle)) (x-point (car rectangle)))))

(define (area rectangle)
  (* (rectangle-height rectangle) (rectangle-width rectangle)))

(define (perimeter rectangle)
  (+ (* 2 (rectangle-height rectangle)) (* 2 (rectangle-width rectangle))))

(define (display-area-perimeter rectangle)
  (newline)
  (display "area = ")
  (display (area rectangle))
  (newline)
  (display "perimeter = ")
  (display (perimeter rectangle)))

(display-area-perimeter (make-rectangle-from-points (make-point 0 0) 
                                                    (make-point -2 -3)))

(display-area-perimeter (make-rectangle-from-segment
  (make-segment (make-point 0 0) (make-point -2 -3))))
