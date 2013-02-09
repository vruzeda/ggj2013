define [
    "model/constants"
    "model/decoration/decoration"
], (Constants, Decoration) ->

    class Microscope extends Decoration

        constructor: ->
            super 400, 540, "microscope"



    return Microscope