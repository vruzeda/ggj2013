define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    class BookPile extends Surface

        constructor: ->
            super 590, 360, "bookPile"



    return BookPile