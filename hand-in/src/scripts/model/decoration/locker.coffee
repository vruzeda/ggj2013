define [
    "model/constants"
    "model/decoration/decoration"
], (Constants, Decoration) ->

    class Locker extends Decoration

        constructor: ->
            super 330, 720

        getImageName: ->
            "locker"



    return Locker