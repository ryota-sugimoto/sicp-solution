;The first code returns reversed sequence of what author expected, because it
;"push"es squared each element of source sequence to the result.

;The second code also doesn't work because it's giving a sequence to car 
;element of the pair in the iter function, which is causing the function 
;generate recursively nested list.
