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
            width:  2000
            height: 90

            x: 0
            y: -90

        SCIENTIST:
            width: 1304
            height: 1909
            x: -600
            y: -300
            speed: 100
            aceleration: 10
            maxSpeed: 200


    return CONSTANTS
