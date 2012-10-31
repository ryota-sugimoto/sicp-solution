(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;a
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;b
(define (total-weight mobile)
  (if (pair? mobile) 
    (let ((left-structure (branch-structure (left-branch mobile)))
          (right-structure (branch-structure (right-branch mobile))))
      (+ (total-weight left-structure) (total-weight right-structure)))
    mobile))

;c
(define (balanced mobile)
  (if (pair? mobile)
    (let ((left-structure (branch-structure (left-branch mobile)))
          (left-length (branch-length (left-branch mobile)))
          (right-structure (branch-structure (right-branch mobile)))
          (right-length (branch-length (right-branch mobile))))
      (let ((left-moment (* left-length (total-weight left-structure)))
            (right-moment (* right-length (total-weight right-structure))))
        (and (balanced left-structure)
             (balanced right-structure)
             (= left-moment right-moment))))
    true))

;d
;We have to change 2 lines, right-branch and branch-structure.


;test mobile1
(define x (make-mobile (make-branch 1 (make-mobile (make-branch 2 3)
                                                   (make-branch 1 4)))
                       (make-branch 3 2)))
;      |
;    /-^---\
;    |     |
; /--^-\   2
; |    |
; 3    4

;test mobile2
(define y (make-mobile (make-branch 1 (make-branch (make-branch 2 3)
                                                   (make-branch 1 6)))
                       (make-branch 3 3)))
;      |
;    /-^---\
;    |     |
; /--^-\   3
; |    |
; 3    6


(newline)
(display (total-weight x))
(newline)
(display (total-weight y))
(newline)
(display (balanced x))
(newline)
(display (balanced y))
