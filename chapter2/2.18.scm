(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))

(define (reverse list)
  (define (iter a remain)
    (if (null? remain)
        a
        (iter  (cons (car remain) a) (cdr remain))))
  (iter () list))

(newline)
(display (reverse (list 1 4 9 16 25)))
