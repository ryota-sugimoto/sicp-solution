(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (define (iter remain count)
    (if (= 0 (remainder remain 2)) (iter (/ remain 2) (+ count 1)) count))
  (iter z 0))

(define (cdr z)
  (define (iter remain count)
    (if (= 0 (remainder remain 3)) (iter (/ remain 3) (+ count 1)) count ))
  (iter z 0))
;these processes are very unefficient!
;there should be better algorithm but i couldnt find it out. :(

(newline)
(display (car (cons 10 11)))
(newline)
(display (cdr (cons 10 11)))
