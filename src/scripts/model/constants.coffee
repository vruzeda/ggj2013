define [], ->

    CONSTANTS =
        CHARACTER:
            width: 0.05
            height: 0.05
            weight: 0.2

            regularHeartBeat: 80
            pumpedHeartBeat: 110
            nerfedHeartBeat: 50

            heartAttack: 140
            cardiacArrest: 20

            heartRaiseIncrement: 5
            heatRaiseDecerement: 0.02 # in miliseconds

        WORLD:
            gravity: -10.0

        PHYSICS_PARAMETERS:
            velocityIterations: 8
            positionIterations: 3

    return CONSTANTS
