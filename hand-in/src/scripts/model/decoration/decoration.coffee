define [
    "model/physics/physicalEntity"
], (PhysicalEntity) ->

    class Decoration extends PhysicalEntity

        constructor: (width, height) ->
            super width, height


    return Decoration