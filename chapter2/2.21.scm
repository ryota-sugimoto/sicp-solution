(define (square-list items)
  (if (null? items)
      items
      (cons (square (car items)) (square-list (cdr items)))))

(define (map-square-list items)
  (map square items))

(newline)
(display (square-list (list 1 2 3 4 5)))
(newline)
(display (map-square-list (list 1 2 3 4 5)))
