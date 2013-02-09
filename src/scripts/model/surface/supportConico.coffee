define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class SupportConico extends Surface

        constructor: ->
            super 200, 360, "bureta"



    return SupportConico