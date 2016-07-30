(println "Clojure - Day 3\n")

(def bankaccounts (ref [1 2 3 4 5]))

(defn amount [n]
  (nth @bankaccounts n)
  )

(defn add [id money]
  (dosync
    (alter
      bankaccounts assoc id
      (+ (amount id) money)
      )
    )
  )

(defn subtract [id money]
  (add id (- money)))



(println (amount 0))

(add 0 55)

(println (amount 0))

(subtract 0 56)

(println (amount 0))

