define [
    "kinetic"
    "framework/imageLoader"
    "model/physics/physicalEntity"
], (Kinetic, ImageLoader, PhysicalEntity) ->

    class Decoration extends PhysicalEntity

        constructor: (width, height, @_imageName) ->
            super width, height

        _createNode: ->
            new Kinetic.Image
                image: ImageLoader.getImage @_imageName
                width: @getWidth()
                height: @getHeight()


    return Decoration