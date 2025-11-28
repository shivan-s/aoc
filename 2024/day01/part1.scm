#lang scheme

(define (read-input file)
	(read-string 1000 (open-input-file file))
)

; obtain list of numbers
; obtains lists as n and 2n index
; sort these lists
; iterate over lists getting the difference between the element
; sum these diffs
(car (map string->number (string-split (car (string-split (read-input "2024/day01/sample.txt") "\n")))))


