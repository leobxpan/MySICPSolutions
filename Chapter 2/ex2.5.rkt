#lang racket

;exponential function
(define (expt base n)
  (if (= n 1)
      base
      (* (expt base (- n 1)) base)))

;cons
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

;car
(define (car x)
  (if(= (remainder x 2) 0)
     (+ 1 (car (/ x 2)))
     0))

;cdr
(define (cdr x)
  (if(= (remainder x 3) 0)
     (+ 1 (cdr (/ x 3)))
     0))

;test
(car (cons 4 3))
(cdr (cons 4 3))


