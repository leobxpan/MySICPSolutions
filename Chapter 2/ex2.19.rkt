#lang racket

;function first-denomination
(define first-denomination car)

;function except-first-denomination
(define except-first-denomination cdr)

;function no-more?
(define no-more? null?)

;function cc taking a list as an argument now
(define (cc amount coin-values)
  (cond (( = amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

;test
(define us-coins (list 10 25 5 50 1))
(cc 100 us-coins)