#lang racket

;function append
(define (append lst1 lst2)
  (if(null? lst1)
     lst2
     (cons (car lst1) (append (cdr lst1) lst2))))

;function same-parity
(define (same-parity a . b)
  (let ((remain (remainder a 2)))
    (define (recur-part remain-list)
      (if (null? (cdr remain-list))
        (if (= (remainder (car remain-list) 2) remain)
            (list (car remain-list))
            null)
        (if (= (remainder (car remain-list) 2) remain)
            (append (list (car remain-list)) (recur-part (cdr remain-list)))
            (recur-part (cdr remain-list)))))
    (append (list a)(recur-part b))))

;test
(same-parity 1 2 3 4 5 7)
(same-parity 2 4 5 6 7)