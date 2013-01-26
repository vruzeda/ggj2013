define [
    "model/constants"
    "model/surface/surface"
], (Constants, Surface) ->

    {TABLE} = Constants

    class Table extends Surface

        constructor: (physicalWorld) ->
            super physicalWorld, TABLE.width, TABLE.height, TABLE.weight

        getImageName: ->
            "table"


    return Table