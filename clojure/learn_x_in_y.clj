; Clojure

; Written in 'forms' list of things in parenthesis with the first thing being the function name or macro name
; and the rest being the arguments to that function or macro

(ns learn-x-in-y)
(str "Hello" ", " "World!")
; using clj repl
; (class 1) -> java.lang.Long
; (class 1.0) -> java.lang.Double
; '(+ 1 2) -> (+ 1 2)
; (class '(+ 1 2)) -> clojure.lang.PersistentList
; (class [+ 1 2]) -> clojure.lang.PersistentVector
; (eval '(+ 1 2)) -> 3
; list and vectors are collections but only list is sequence
; cons add to front, conj add to most efficient, concat vector or list into one list
; map, filter, reduce (can take initial argument)
