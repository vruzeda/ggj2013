define [
    "model/constants"
    "model/decoration/decoration"
], (Constants, Decoration) ->

    class Support extends Decoration

        constructor: ->
            super 300, 550, "support"



    return Support