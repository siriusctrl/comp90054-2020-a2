(define
    (domain pacman_simple)
    (:requirements :typing)

    (:types
        node
    )

    (:predicates
        (at ?pos - node)
        (connected ?start ?end - node)
        (gostAt ?pos - node)
        ;; we must visit the pos where food at
        (foodAt ?pos - node)
    )


    (:action move
        :parameters (?start ?end - node)
        :precondition (and
            (at ?start)
            (or (connected ?start ?end) (connected ?end ?start))
            (not (gostAt ?end))
        )
        :effect (and
            (at ?end)
            (not (at ?start))
            (when (foodAt ?end) (not (foodAt ?end)))
        )
    )

)
