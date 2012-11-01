(define (fringe tree)
  (if (null? tree) tree
    (if (pair? tree) (append (fringe (car tree)) 
                             (fringe (cdr tree)))
                     (list tree))))

(define x (list (list 1 2) (list 3 4)))
(newline)
(display (fringe x))
(newline)
(display (fringe (list x x)))
