define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class MediumObstacle extends Surface

        constructor: ->
            super 200, 200

        getImageName: ->
            "table"


    return MediumObstacle