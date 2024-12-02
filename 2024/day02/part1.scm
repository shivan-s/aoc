#lang scheme

(define (read-input file)
	(read-string 1000 (open-input-file file))
)

; list by each line
; iterate between each element and calculate the diff
; if a diff is above 2, then add to unsafe counter
; return unsafe counter


(define (solution input)
  (define (obtain-first-line input)
	(map string->number (car (map string-split (string-split (read-input input) "\n"))))))
  (- (car (cdr (obtain-first-line input))) (car (obtain-first-line input)))

(solution "2024/day02/sample.txt")


