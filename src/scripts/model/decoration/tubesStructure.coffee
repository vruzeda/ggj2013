define [
    "model/constants"
    "model/decoration/decoration"
], (Constants, Decoration) ->

    class TubesStructure extends Decoration

        constructor: ->
            super 400, 360

        getImageName: ->
            "tubesStructure"



    return TubesStructure