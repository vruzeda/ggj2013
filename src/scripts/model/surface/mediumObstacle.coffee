define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class MediumObstacle extends Surface

        constructor: ->
            super 205, 180, "books"



    return MediumObstacle