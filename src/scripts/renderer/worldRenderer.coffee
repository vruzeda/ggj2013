define [
    "kinetic"
    "framework/imageLoader"
], (Kinetic, ImageLoader) ->

    class WorldRenderer

        constructor: (@_layer) ->

        render: (world) ->
            @_layer.removeChildren()

            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage "background"

            # TODO Parallax

            for surface in world.getSurfaces()
                surfacePosition = surface.getPosition()
                @_layer.add new Kinetic.Image
                    image: ImageLoader.getImage surface.getImageName()
                    x: surfacePosition.x
                    y: surfacePosition.y
                    width: surface.getWidth()
                    height: surface.getHeight()

            character = world.getCharacter()
            characterPosition = character.getPosition()
            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage character.getImageName()
                x: characterPosition.x
                y: characterPosition.y
                width: character.getWidth()
                height: character.getHeight()

            @_layer.draw()

    return WorldRenderer