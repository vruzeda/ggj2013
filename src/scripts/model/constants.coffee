define [], ->

    CONSTANTS =
        GAME_RESOLUTION:
            width: 1280
            height: 720

        WORLD:
            gravity: 500

        CHARACTER:
            width:  153
            height: 144

            x: 10
            y: 10

            nerfedHeartBeat:  50
            regularHeartBeat: 80
            pumpedHeartBeat:  110

            nerfedMoveSpeed:  200
            regularMoveSpeed: 250
            pumpedMoveSpeed:  300

            nerfedJumpSpeed:  200
            regularJumpSpeed: 250
            pumpedJumpSpeed:  300

            heartAttack:   140
            cardiacArrest: 20

            heartRaiseIncrement: 5
            heatRaiseDecerement: 0.02 # in miliseconds

        TABLE:
            width:  1280
            height: 90

            x: 0
            y: 630



    return CONSTANTS
