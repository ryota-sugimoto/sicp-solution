(define (subsets set)
  (if (null? set) (list ())
                  (let ((rest (subsets (cdr set))))
                    (append rest (map (lambda (x) (cons (car set) x))
                                      rest)))))
;Subset of empty set is only empty set itself.
;There is a non-empty set A, and removing an element e from it, call it A'.
;The set of all subset of A can be interpreted as
;SetofSubset(A) = SetofSubset(A') + e * SetofSubset(A')
; + is merging two sets.
; * is adding the left side to all the right side set.
;We can recursively remove elements from the set untill it becomes empty,
;and then we calculate each subset of from empty set to original set.

(newline)
(display (subsets (list 1 2 3)))
