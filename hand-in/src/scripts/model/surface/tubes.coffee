define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class Tubes extends Surface

        constructor: ->
            super 400, 260

        getImageName: ->
            "tubes"



    return Tubes