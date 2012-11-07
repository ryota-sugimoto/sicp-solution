(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      ()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init  (map cdr seqs)))))

(define (dot-products v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (mi) (dot-products mi v)) m))

(define (transpose mat)
  (accumulate-n cons () mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (mi) (matrix-*-vector cols mi)) m)))

(define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define n (list (list 10 11 12) (list 13 14 15) (list 16 17 18)))
(define v (list 19 20 21))
(newline)
(display (dot-products v v))
(newline)
(display (matrix-*-vector m v))
(newline)
(display (transpose m))
(newline)
(display (matrix-*-matrix m n))
