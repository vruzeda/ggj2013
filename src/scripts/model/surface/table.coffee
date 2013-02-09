define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    {TABLE} = Constants

    class Table extends Surface

        constructor: ->
            super TABLE.width, TABLE.height, "table"


    return Table