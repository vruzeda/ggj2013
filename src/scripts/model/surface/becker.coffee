define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class Becker extends Surface

        constructor: ->
            super 205, 180

        getImageName: ->
            "becker"



    return Becker