#lang racket

;;This version makes use of function append

;function append
(define (append lst1 lst2)
  (if(null? lst1)
     lst2
     (cons (car lst1) (append (cdr lst1) lst2))))

;function reverse
(define (reverse lst)
  (if (null? (cdr lst))
      lst
      (append (reverse (cdr lst)) (list (car lst)))))    ;(car lst) is only a number, so must use (list (car lst))

;test
(reverse (list 1 4 9 16 25))