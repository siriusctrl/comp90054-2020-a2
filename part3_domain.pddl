(define
    (domain pacman_hard)
    (:requirements :strips :typing :equality :adl)

    (:types
        node
        num
    )

    (:predicates
        (at ?pos - node)
        (connected ?start ?end - node)
        (ghostAt ?pos - node)
        ;; we must visit the pos where food at
        (foodAt ?pos - node)
        (invulnerable ?vul - num)
        (capsuleAt ?pos - node)
    )


    (:action move
        :parameters (
            ?start ?end - node 
            ?vul - num
        )
        :precondition (and
            (at ?start)
            (invulnerable ?vul)
            (or (connected ?start ?end) (connected ?end ?start))
            (or (not (ghostAt ?end)) (not (= ?vul zero)))
            (or 
                (not (foodAt ?end))
                (and
                    (not (ghostAt a-4))
                    (not (ghostAt b-4))
                )
            )
        )
        :effect (and
            (at ?end)
            (not (at ?start))
            (when (ghostAt ?end) (not (ghostAt ?end)))
            (when (foodAt ?end) (not (foodAt ?end)))
            
            (when 
                (capsuleAt ?end)
                (and 
                    (not (invulnerable ?vul))
                    (invulnerable two)
                    (not (capsuleAt ?end))
                )
            )
            
            (when 
                (= ?vul one) 
                (and (invulnerable zero) (not (invulnerable ?vul)))
            )
            
            (when 
                (= ?vul two)
                (and (invulnerable one) (not (invulnerable ?vul)))
            )
        )
    )
)
