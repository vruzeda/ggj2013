define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class WindowBase extends Surface

        constructor: ->
            super 210, 454, "windowBase"



    return WindowBase