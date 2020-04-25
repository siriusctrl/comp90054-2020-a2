(define
    (domain pacman_mid)
    (:requirements :strips :typing :equality :adl)

    (:types
        node
    )

    (:predicates
        (move ?from ?to - node)
        (at ?pos - node)
        (connected ?start ?end - node)
        (ghostAt ?pos - node)
        ;; we must visit the pos where food at
        (foodAt ?pos - node)
        (eat ?pos - node)
        (invulnerable)
        (capsuleAt ?pos - node)
    )


    (:action move
        :parameters (?start ?end - node)
        :precondition (and
            (at ?start)
            (or (connected ?start ?end) (connected ?end ?start))
            (or (not (ghostAt ?end)) (invulnerable))
        )
        :effect (and
            (at ?end)
            (not (at ?start))
            (when (foodAt ?end) (eat ?end))
            (when (capsuleAt ?end) (and (invulnerable) (not (capsuleAt ?end))))
            (when (and (ghostAt ?end) (invulnerable)) (not (ghostAt ?end)))
        )
    )
)
