(ns clo-chain.core
  (:gen-class)) ; used to generate Java class from namespace

(defrecord Block [index timestamp previous-hash hash body]) ;; defines a named clojure record: structured data type similar to a struct in C. 
; Records are immutable, and are implemented as Java classes, with named fields and some additional, has accessors
; modifications creates a new record, protocols can be used to define functions that operate on records like interfaces
; defrecord automatically creates a constructor function with the same name as the record type, which can be used to create new instances of the record type.
; for record named Record, get constructors ->Record and map->Record
; are superset of maps, 

(defn create-block [index timestamp previous-hash body]
  (let [hash (str (hash (str index timestamp previous-hash body)))]
    (->Block index timestamp previous-hash hash body)))

(defn create-genesis-block []
  (create-block 0 (System/currentTimeMillis) "0" "genesis"))

(def blockchain (atom (create-genesis-block))) ;; atom is a mutable reference type, can be used to store a single value, can be updated with swap! and reset!, can be dereferenced with @

(defn -main []
  (println "Clo-Chain")
  (println @blockchain))