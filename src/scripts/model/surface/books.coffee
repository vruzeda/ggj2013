define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class Books extends Surface

        constructor: ->
            super 590, 180

        getImageName: ->
            "books"



    return Books