(define (for-each proc items)
  (define (iter remain)
    (if (null? remain) true
                       (let ((nothing (proc (car remain))))
                            (iter (cdr remain)))))
  (iter items))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))
