define [], ->

    CONSTANTS =
        GAME_RESOLUTION:
            width:  1280
            height: 720

        WORLD:
            gravity: 1000
            endOfGame: 13500
            gameWin: 14600

        CHARACTER:
            width:  153
            height: 144

            x: 230
            y: 200

            cardiacArrestHeartBeat: 20
            nerfedHeartBeat:        50
            regularHeartBeat:       80
            pumpedHeartBeat:        110
            heartAttackHeartBeat:   140

            nerfedMoveSpeed:  200
            regularMoveSpeed: 350
            pumpedMoveSpeed:  300

            nerfedJumpSpeed:  200
            regularJumpSpeed: 650
            pumpedJumpSpeed:  900

            heartBeatIncrement: 5
            heatBeatDecerementByTime: 0.006

        TABLE:
            width:  2646
            height: 90

            x: 0
            y: 630

        CEIL:
            width:  2646
            height: 90

            x: 0
            y: -90

        SCIENTIST:
            width:  954
            height: 1205
            x: -600
            y: -300
            speed: 100
            aceleration: 10
            maxSpeed: 150

            ARM:
                width:  771
                height: 814
                xDisplacement: -141
                yDisplacement: -650

                HAND:
                    x: 538


    return CONSTANTS
