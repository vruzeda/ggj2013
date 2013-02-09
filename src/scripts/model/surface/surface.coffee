define [
    "model/physics/physicalEntity"
], (PhysicalEntity) ->

    class Surface extends PhysicalEntity

        constructor: (width, height, imageName) ->
            super width, height, imageName


    return Surface