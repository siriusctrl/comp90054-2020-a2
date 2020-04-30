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
                ; not food
                (not (foodAt ?end))
                ;not last food
                (exists
                    (?pos - node)
                    (and 
                        (not (= ?pos ?end))
                        (foodAt ?pos)
                    )
                )
                ; ghost are all gone
                (forall (?pos - node) (not (ghostAt ?pos)))
            )
        )
        :effect (and
            (at ?end)
            (not (at ?start))
            ; no need to test invulnerable as we already put it into pre
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
