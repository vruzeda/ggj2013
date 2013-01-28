define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class FrascoTripe extends Surface

        constructor: ->
            super 400, 520

        getImageName: ->
            "frascoTripe"



    return FrascoTripe