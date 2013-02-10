require.config
    urlArgs: "bust=" +new Date

    paths:
        jquery:  "lib/src/jquery-1.9.1"
        kinetic: "lib/src/kinetic-v4.3.2"

require [
    "jquery"
    "heartGame"
    "model/constants"
], ($, HeartGame, Constants) ->

    {GAME_RESOLUTION} = Constants

    $("#container").focus()
    new HeartGame "container", GAME_RESOLUTION.width, GAME_RESOLUTION.height
