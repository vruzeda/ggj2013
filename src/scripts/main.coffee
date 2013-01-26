require.config
    urlArgs: "bust=" +new Date

    paths:
        jquery:  "lib/src/jquery-1.9.0"
        kinetic: "lib/src/kinetic-v4.3.0"
        box2D:   "lib/src/Box2dWeb-2.1.a.3"

    shim:
        box2D:
            exports: "Box2D"

require [
    "jquery"
    "heartGame"
    "model/constants"
], ($, HeartGame, Constants) ->

    {GAME_RESOLUTION} = Constants

    $("#container").focus()
    new HeartGame "container", GAME_RESOLUTION.width, GAME_RESOLUTION.height
