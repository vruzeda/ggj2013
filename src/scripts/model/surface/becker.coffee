define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class Becker extends Surface

        constructor: ->
            super 205, 180, "becker"



    return Becker