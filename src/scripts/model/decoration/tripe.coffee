define [
    "model/constants"
    "model/decoration/decoration"
], (Constants, Decoration) ->

    class Tripe extends Decoration

        constructor: ->
            super 369, 180

        getImageName: ->
            "tripe"



    return Tripe