define [
    "model/constants"
    "model/decoration/decoration"
], (Constants, Decoration) ->

    class Light extends Decoration

        constructor: ->
            super 695, 430, "light"



    return Light