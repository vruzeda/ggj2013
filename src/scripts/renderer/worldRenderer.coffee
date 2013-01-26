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

            character = world.getCharacter()
            characterPosition = character.getPosition()
            debugger

            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage character.getImageName()
                x: characterPosition.x
                y: characterPosition.y

            for surface in world.getSurfaces()
                surfacePosition = surface.getPosition()
                @_layer.add new Kinetic.Image
                    image: ImageLoader.getImage surface.getImageName()
                    x: surfacePosition.x
                    y: surfacePosition.y

            @_layer.draw()



    return WorldRenderer