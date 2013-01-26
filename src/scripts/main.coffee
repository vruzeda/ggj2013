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
    "box2D"
], ($, HeartGame, Box2D) ->

    $("#container").focus()
    new HeartGame "container", 1280, 720