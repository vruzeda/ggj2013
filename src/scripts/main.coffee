require.config
    urlArgs: "bust=" +new Date

    paths:
        jquery:  "lib/src/jquery-1.9.1"
        kinetic: "lib/src/kinetic-v4.3.2"
        sm2:     "lib/src/soundmanager2"

    shim:
        sm2:
            exports: 'soundManager'

require [
    "heartGame"
    "model/constants"
], (HeartGame, Constants) ->

    {GAME_RESOLUTION} = Constants
    new HeartGame "container", GAME_RESOLUTION.width, GAME_RESOLUTION.height