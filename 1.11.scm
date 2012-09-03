(define (f_recursive n)
  (if (< n 3) n
      (+ (f_recursive (- n 1)) 
         (* 2 (f_recursive (- n 2))) 
         (* 3 (f_recursive (- n 3)))
      )
  )
)

(define (f_iterative n)
  (define (inner_f i fn-1 fn-2 fn-3)
          (if (> i n) fn-1
              (inner_f (+ i 1)
                       (+ fn-1 (* 2 fn-2) (* 3 fn-3))
                       fn-1
                       fn-2)
          )
  )
  
  (if (< n 3) n
      (inner_f 3 2 1 0)
  )
)
