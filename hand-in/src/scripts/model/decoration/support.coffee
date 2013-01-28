define [
    "model/constants"
    "model/decoration/decoration"
], (Constants, Decoration) ->

    class Support extends Decoration

        constructor: ->
            super 300, 550

        getImageName: ->
            "support"



    return Support