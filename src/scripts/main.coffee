require.config
    paths:
        jquery: "lib/src/jquery-1.9.0"
        kinetic: "lib/src/kinetic-v4.3.0"

require [
    "jquery"
    "heartGame"
], ($, HeartGame) ->

    $("#container").focus()
    new HeartGame "container", 1280, 720