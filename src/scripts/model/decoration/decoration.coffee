define [
    "model/physics/physicalEntity"
], (PhysicalEntity) ->

    class Decoration extends PhysicalEntity

        constructor: (width, height, imageName) ->
            super width, height, imageName


    return Decoration