#lang racket

;;Remember list is a reduced form of nested cons
;;This version makes use of function length

;function length
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

;function last-pair
(define (last-pair list)
  (cond ((= (length list) 0) (error "The given list is null"))
        ((= (length list) 1) list)
        (else (last-pair (cdr list)))))

;test
(last-pair (list 4 2 5 1 3))
