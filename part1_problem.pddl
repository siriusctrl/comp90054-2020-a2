(define
    (problem pacman-level-1)
    (:domain pacman_simple)

;; problem map
;;  | 1 | 2 | 3 |
;; -|---|---|---|
;; a| P | G | F | 
;; b| _ | _ | _ | 
;;  |---|---|---| 

    (:objects
        a-1 a-2 a-3 b-1 b-2 b-3 - node
	)
	
	(:init
        (connected a-1 a-2)
        (connected a-2 a-3)
        (connected a-1 b-1)
        (connected b-1 b-2)
        (connected b-2 b-3)
        (connected a-2 b-2)
        (connected a-3 b-3)
        (at a-1)
        (gostAt a-2)
        (foodAt a-3)
	)

    (:goal
        (and
            (eat a-3)
        )
	)
)
