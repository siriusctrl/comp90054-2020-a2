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
        (capsuleAt ?pos - node)
        (invulnerable ?vul - num)
        (decay ?from ?to - num)
        (maxCapsuleDuration ?value - num)
    )


    (:action move
        :parameters (
            ?start ?end - node 
            ?vul ?max ?next - num
        )
        :precondition (and
            (at ?start)
            (invulnerable ?vul)
            (maxCapsuleDuration ?max)

            (or (connected ?start ?end) (connected ?end ?start))
            (or (not (ghostAt ?end)) (not (= ?vul zero)))
            (or
                ;not last food
                (exists
                    (?pos - node)
                    (and 
                        (not (= ?pos ?end))
                        (foodAt ?pos)
                    )
                )
                ; ghost are all gone
                (not (exists (?pos - node) (ghostAt ?pos)))
            )

            ;find the correct transition that we are going to perform
            (decay ?vul ?next)
        )
        :effect (and
            (at ?end)
            (not (at ?start))
            ; no need to test invulnerable as we already put it into pre
            (when (ghostAt ?end) (not (ghostAt ?end)))
            (when (foodAt ?end) (not (foodAt ?end)))

            ; perform state transition for capsule
            ; only perform state transition when there is no capsule eaten this round
            ; if not doing this, the solution may not be the optimal one
            (when (not (capsuleAt ?end))
                (and
                    (not (invulnerable ?vul))
                    (invulnerable ?next)
                )
            )

            ; when eat capsule, reset the invulnerable duration to max
            (when (capsuleAt ?end)
                (and 
                    (not (invulnerable ?vul))
                    (invulnerable ?max)
                    (not (capsuleAt ?end))
                )
            )
        )
    )
)
