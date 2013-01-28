define [
    "model/physics/physicalEntity"
], (PhysicalEntity) ->

    class Surface extends PhysicalEntity

        constructor: (width, height) ->
            super width, height


    return Surface