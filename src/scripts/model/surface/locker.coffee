define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class Locker extends Surface

        constructor: ->
            super 330, 720, "locker"



    return Locker