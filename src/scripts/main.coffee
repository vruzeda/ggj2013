require.config
    urlArgs: "bust=" +new Date

    paths:
        jquery:  "lib/src/jquery-1.9.0"
        kinetic: "lib/src/kinetic-v4.3.0"

require [
    "jquery"
    "heartGame"
    "model/constants"
], ($, HeartGame, Constants) ->

    {GAME_RESOLUTION} = Constants

    $("#container").focus()
    new HeartGame "container", GAME_RESOLUTION.width, GAME_RESOLUTION.height
