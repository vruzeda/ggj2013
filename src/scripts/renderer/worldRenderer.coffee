define [
    "kinetic"
    "framework/imageLoader"
    "model/constants"
], (Kinetic, ImageLoader, Constants) ->

    {GAME_RESOLUTION} = Constants

    class WorldRenderer

        constructor: (@_layer) ->

        render: (world) ->
            @_layer.removeChildren()

            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage "background"

            # TODO Parallax
            character = world.getCharacter()
            characterPosition = character.getPosition()
            deltaX = ((GAME_RESOLUTION.width - character.getWidth()) / 2) - characterPosition.x

            for decoration in world.getDecorations()
                decorationPosition = decoration.getPosition()
                @_layer.add new Kinetic.Image
                    image: ImageLoader.getImage decoration.getImageName()
                    x: decorationPosition.x + deltaX
                    y: decorationPosition.y
                    width: decoration.getWidth()
                    height: decoration.getHeight()

            for surface in world.getSurfaces()
                surfacePosition = surface.getPosition()
                @_layer.add new Kinetic.Image
                    image: ImageLoader.getImage surface.getImageName()
                    x: surfacePosition.x + deltaX
                    y: surfacePosition.y
                    width: surface.getWidth()
                    height: surface.getHeight()

            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage character.getImageName()
                x: characterPosition.x + deltaX
                y: characterPosition.y
                width: character.getWidth()
                height: character.getHeight()

            @_layer.draw()

    return WorldRenderer