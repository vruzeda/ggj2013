require.config
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
], ($, HeartGame) ->

    $("#container").focus()
    new HeartGame "container", 1280, 720