(define (fringe list)
  (if (null? list) list
    (if (pair? (car list)) (append (fringe (car list)) 
                                   (fringe (cdr list)))
                           (cons (car list) (fringe (cdr list))))))

(define x (list (list 1 2) (list 3 4)))
(newline)
(display (fringe x))
(newline)
(display (fringe (list x x)))
