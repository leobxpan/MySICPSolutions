#lang racket

;make-interval car cdr
(define make-interval cons)
(define upper-bound cdr)
(define lower-bound car)

;add-interval
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

;mul-interval
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
     (make-interval (min p1 p2 p3 p4)
                    (max p1 p2 p3 p4))))

;div-interval
(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

;Lem's par1 & par2
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

;test
(par1 (make-interval 1 1.1) (make-interval 2 2.1))
(par2 (make-interval 1 1.1) (make-interval 2 2.1))

;;test-result
;;The result interval using par2 is preciser than par1, and the lower bound of
;;par2's result is precisely the correct answer.