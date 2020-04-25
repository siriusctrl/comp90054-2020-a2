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
        zero one two three - num
	)
	
	(:init
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
        (ghostAt a-4)
        (ghostAt b-4)
        (foodAt a-5)
        (capsuleAt b-2)
        (capsuleAt b-5)
        (at a-1)
        (invulnerable zero)
	)


    (:goal
        (and
            (not (foodAt a-5))
            (not (ghostAt a-4))
            (not (ghostAt b-4))
        )
	)
)
