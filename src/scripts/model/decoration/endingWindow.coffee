define [
    "model/constants"
    "model/decoration/decoration"
], (Constants, Decoration) ->

    class EndingWindow extends Decoration

        constructor: ->
            super 400, 580

        getImageName: ->
            "endingWindow"

    return EndingWindow