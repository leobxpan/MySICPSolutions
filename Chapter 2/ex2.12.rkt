#lang racket

;function make-center-percent
(define (make-center-percent center percent)
  (cons (- center (* center percent))
        (+ center (* center percent))))

;selective function percent
(define (percent interval)

#| Use let*
  (let* ((start-point (car interval))
       (end-point (cdr interval))
       (center (/ (+ start-point end-point) 2)))
  (/ (- end-point center) center)))
|#

;Use nested let
  (let ((start-point (car interval)))
    (let ((end-point (cdr interval)))
      (let ((center (/ (+ start-point end-point) 2)))
        (/ (- end-point center) center)))))
  
;test part
(percent (make-center-percent 1 0.1))