#lang scheme

(define (read-input file)
	(read-string 1000 (open-input-file file))
)

(map (string-split) (string-split (read-input "2024/day01/sample.txt") "\n"))
; obtain list of numbers
; obtains lists as n and 2n index
; sort these lists
; iterate over lists getting the difference between the element
; sum these diffs


