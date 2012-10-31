(define (deep-reverse list)
  (define (iter result remain)
    (if (null? remain) 
        result
        (iter  (cons (deep-reverse (car remain)) result) (cdr remain))))
  (if (pair? list) (iter () list) list))

(define x (list (list 1 2) (list 3 4)))
(newline)
(display (deep-reverse x))
