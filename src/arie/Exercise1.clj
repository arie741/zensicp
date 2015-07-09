(ns arie.Exercise1)


;Fibonnaci Sequence
(defn fibIter [a b n]
  (if (zero? n)
    b
    (fibIter (+ a b) a (dec n))))

(defn fibo [n]
  (fibIter 1N 0N n))

(defn fibo2 [n]
  (cond 
    (= n 1N) 1N
    (= n 2N) 1N
    :else (+ (fibo2 (dec n))
             (fibo2 (- n 2N)))))

;Counting Change
(defn fdom [koc]
  (cond 
    (= koc 1) 1
    (= koc 2) 2
    (= koc 3) 5
    (= koc 4) 10
    (= koc 5) 20
    (= koc 6) 50
    (= koc 7) 100
    (= koc 8) 200))

(defn cc [amount koc]
  (cond 
    (= amount 0) 1
    (or (< amount 0) (zero? koc)) 0
    :else (+ (cc amount (dec koc))
             (cc (- amount (fdom koc))
                 koc))))

(defn counting-change [amount]
  (cc amount 8))

;Quicksort
(defn qsort 
  [[x & xs :as lst]]
  (cond (nil? x) [] 
        (nil? xs) [x]
        :else (concat (qsort (filter #(>= x %) xs))
                      [x]
                      (qsort (filter #(< x %) xs)))))
