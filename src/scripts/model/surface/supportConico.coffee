define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class supportConico extends Surface

        constructor: ->
            super 200, 360

        getImageName: ->
            "bureta"



    return supportConico