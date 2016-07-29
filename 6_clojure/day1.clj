(println "Clojure - Day 1\n")

(defn big [string size]
  (> (count string) size)
  )

(println "Exercise 1 - Define a function that returns true if a string is longer that size characters\n")

(println (big "asdfasdf" 4))
(println (big "asdfasdf" 40))

(defn collection-type [collection]
  (cond
    (list? collection) :list
    (vector? collection) :vector
    (map? collection) :map
    )
  )

(println "\nExercise 2 - Define a function that returns the collection type\n")

(println (collection-type '(1)))
(println (collection-type [1]))
(println (collection-type {:key :value}))
