#lang racket

(require 2htdp/image)

;Exercise 1.1: Below is a sequence of expressions. What is the result
;printed by the interpreter in response to each expression? Assume
;that the sequence is to be evaluated in the order in which it is pre-
;sented.
;10
10
;(+ 5 3 4)
12
;(- 9 1)
8
;(/ 6 2)
3
;(+ (* 2 4) (- 4 6))
6
;(define a 3)
;(define b (+ a 1))
;(+ a b (* a b))
19
;(= a b)
false
;(if (and (> b a) (< b (* a b)))
;    b
;    a)
4
;(cond ((= a 4) 6)
;      ((= b 4) (+ 6 7 a))
;      (else 25))
16
;(+ 2 (if (> b a) b a))
6
;(* (cond ((> a b) a)
;         ((< a b) b)
;         (else -1))
;   (+ a 1))
16

;Exercise 1.2: Translate the following expression into prefix form.
;(5 + 4 + (2 - (3 - (6 + 5 4 )))) / (3(6 − 2)(2 − 7))
(/ (+ 5 4
      (- 2
         (- 3
            (+ 6
               (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

;Exercise 1.3: Define a procedure that takes three numbers as argu-
;ments and returns the sum of the squares of the two larger num-
;bers.
(define (e13 a b c)
  (if (> a b)
      (if (> b c)
          (+ (* a a) (* b b))
          (+ (* a a) (* c c )))
      (if (> a c)
          (+ (* b b) (* a a))
          (+ (* b b) (* c c)))))

;Exercise 1.4: Observe that our model of evaluation allows for com-
;binations whose operators are compound expressions. Use this
;observation to describe the behavior of the following procedure:
;(define (a-plus-abs-b a b)
;  ((if (> b 0) + -) a b))

;Answer: If b is a positive number, it would evaluate the expression (+ a b),
;        If b is zero or a negative number, it would evaluate the expression (- a b).

;Exercise 1.5: Ben Bitdiddle has invented a test to determine
;whether the interpreter he is faced with is using applicative-order
;evaluation or normal-order evaluation. He defines the following
;two procedures:57
;(define (p) (p))
;(define (test x y)
;  (if (= x 0) 0 y))
;Then he evaluates the expression
;(test 0 (p))
;What behavior will Ben observe with an interpreter that uses
;applicative-order evaluation? What behavior will he observe with
;an interpreter that uses normal-order evaluation? Explain your
;answer. (Assume that the evaluation rule for the special form if
;is the same whether the interpreter is using normal or applicative
;order: The predicate expression is evaluated first, and the result
;determines whether to evaluate the consequent or the alternative
;expression.)

;Answer: If the interpreter uses normal-order evaluation, it would fail because there is no value as the operands of the operator (p).
;        If the interpreter uses applicative-order evaluation, it would produce 0.

;Ex1.9
(define ex19 (bitmap "./img/ex1,9.png"))
;Ex1.9 Answer
(define a19 (bitmap "./answers/an1,9.png"))

;Ex1.10 : run both:
(define ex1101 (bitmap "./img/ex1,10,1.png"))
(define ex1102 (bitmap "./img/ex1,10,2.png"))

;(A 1 10) -> 1024
;(A 2 4) -> 65536
;(A 3 3) -> 65536

;(A 1 10) -> 2^10
;(A 2 4) -> 2^2^4
;(A 3 3) -> 2^2^4

;Ex 1.11 : Run 
(define ex111 (bitmap "./img/ex1,11.png"))

;;recursive
(define (an111 n)
  (if (< n 3)
      n
      (+ (an111 (- n 1))
         (* 2 (an111 (- n 2)))
         (* 3 (an111 (- n 3))))))

;;iterative
(define (aniter a b c n)
  (if (= n 0)
      c
      (aniter (+ a (* b 2) (* c 3)) a b (- n 1))))

(define (an1112 n)
  (aniter 2 1 0 n))

;Ex 1.12 : Run
(define ex112 (bitmap "./img/ex1,12.png"))

;Answer:
(define (pascal row n)
  (cond ((or (= row 0) (= n 0) (< row n)) 0) 
        ((or (= 1 n) (= row n)) 1)
        (else (+ (pascal (- row 1) n) (pascal (- row 1) (- n 1))))))

;Ex 1.13 : Run
(define ex113 (bitmap "./img/ex1,13.png"))

;Answer:
(define p
  (/ (+ 1 (sqrt 5))2))

(define (ph n)
  (/ (expt p n) (sqrt 5)))