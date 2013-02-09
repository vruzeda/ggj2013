define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    {CEIL} = Constants

    class Ceil extends Surface

        constructor: ->
            super CEIL.width, CEIL.height, "table"



    return Ceil