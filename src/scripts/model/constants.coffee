define [], ->

    CONSTANTS =
        GAME_RESOLUTION:
            width: 1280
            height: 720

        WORLD:
            gravity: 1000

        CHARACTER:
            width:  153
            height: 144

            x: 210
            y: 10

            nerfedHeartBeat:  50
            regularHeartBeat: 80
            pumpedHeartBeat:  110

            nerfedMoveSpeed:  200
            regularMoveSpeed: 350
            pumpedMoveSpeed:  300

            nerfedJumpSpeed:  200
            regularJumpSpeed: 650
            pumpedJumpSpeed:  900


            heartAttack:   140
            cardiacArrest: 20

            heartRaiseIncrement: 5
            heatRaiseDecerementByTime: 0.02

        TABLE:
            width:  1280
            height: 90

            x: 0
            y: 630



    return CONSTANTS
