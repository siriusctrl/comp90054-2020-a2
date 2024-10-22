(define
    (problem pacman-level-1)
    (:domain pacman_hard)

;; problem map
;;  | 1 | 2 | 3 | 4 | 5 |
;; -|---|--- ---|---|---|
;; a| P | _ | _ | G | F |
;; b| _ | C | _ | G | C |
;;  |---|---|---|---|---|

  


    (:objects
        a-1 a-2 a-3 a-4 a-5 b-1 b-2 b-3 b-4 b-5 - node
        zero one two - num
	)
	
	(:init
        ; define the map
        (connected a-1 a-2)
        (connected a-2 a-3)
        (connected a-3 a-4)
        (connected a-4 a-5)
        (connected b-1 b-2)
        (connected b-2 b-3)
        (connected b-3 b-4)
        (connected b-4 b-5)
        (connected a-1 b-1)
        (connected a-2 b-2)
        (connected a-3 b-3)
        (connected a-4 b-4)
        (connected a-5 b-5)
        ; define the initial postion of elements on the map
        (ghostAt a-4)
        (ghostAt b-4)
        (foodAt a-5)
        (capsuleAt b-2)
        (capsuleAt b-5)
        (at a-1)
        ; define the capsule transaction
        ; if you want to dynamically change the capsule timelimit
        ; you should define the state transition (decay ?from ?to)
        ; here
        (decay two one)
        (decay one zero)
        (decay zero zero)
        (maxCapsuleDuration two)
        (invulnerable zero)
	)


    (:goal
        (and
            (not (exists (?node - node) (foodAt ?node)))
            (not (exists (?node - node) (ghostAt ?node)))
        )
	)
)
