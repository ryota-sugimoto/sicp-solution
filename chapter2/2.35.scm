(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves tree)
  (accumulate +
              0
              (map (lambda (t) (if (pair? t) (count-leaves t) 1))
                   tree)))

(define x (list 1 2 (list 3 4 (list 5) 6 7)))
(newline)
(display (count-leaves x))

