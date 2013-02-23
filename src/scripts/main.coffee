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
    "jquery"
    "heartGame"
    "model/constants"
], ($, HeartGame, Constants) ->

    {GAME_RESOLUTION} = Constants
    $("#container").width  GAME_RESOLUTION.width
    $("#container").height GAME_RESOLUTION.height

    $("#container").focus()
    new HeartGame "container", GAME_RESOLUTION.width, GAME_RESOLUTION.height
