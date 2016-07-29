(println "Clojure - Day 2\n")

(println "Exercise 1 - Implement an unless with an else condition using macros")

(defmacro unless [test body &[else]]
  (list
    'if (list 'not test)
    body
    else))

(println (macroexpand '(unless condition body else)))

(println (unless true "a" "b"))
(println (unless false "a" "b"))

(println "Exercise 2 - Write a type using defrecord that implements a protocol")

(defprotocol Multiplier
  (multiplyBy [multiplier x])
  )

(deftype MathMultiplier [input]
  Multiplier
  (multiplyBy [_ x] (* x input)))

(println (multiplyBy (MathMultiplier. 20) 4))