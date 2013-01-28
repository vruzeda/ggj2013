define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class Bureta extends Surface

        constructor: ->
            super 200, 360

        getImageName: ->
            "bureta"



    return Bureta