(define
    (domain pacman_mid)
    (:requirements :strips :typing :equality :adl)

    (:types
        node
    )

    (:predicates
        (at ?pos - node)
        (connected ?start ?end - node)
        (ghostAt ?pos - node)
        ;; we must visit the pos where food at
        (foodAt ?pos - node)
        (invulnerable)
        (capsuleAt ?pos - node)
    )


    (:action move
        :parameters (?start ?end - node)
        :precondition (and
            (at ?start)
            (or 
                (connected ?start ?end) 
                (connected ?end ?start)
            )
            (or 
                (not (ghostAt ?end)) 
                (invulnerable)
            )
        )
        :effect (and
            (at ?end)
            (not (at ?start))
            (when (foodAt ?end) (not (foodAt ?end)))
            (when 
                (capsuleAt ?end) 
                (and (invulnerable) (not (capsuleAt ?end)))
            )
            (when (ghostAt ?end) (not (ghostAt ?end)))
        )
    )
)
