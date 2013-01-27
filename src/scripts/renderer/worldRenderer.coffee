define [
    "kinetic"
    "framework/imageLoader"
    "model/constants"
], (Kinetic, ImageLoader, Constants) ->

    {GAME_RESOLUTION, WORLD} = Constants

    class WorldRenderer

        constructor: (@_layer) ->

        render: (world) ->
            @_layer.removeChildren()

            # TODO Parallax
            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage "background"

            character = world.getCharacter()
            characterPosition = character.getPosition()

            deltaX = ((GAME_RESOLUTION.width - character.getWidth()) / 2) - characterPosition.x
            if deltaX > 300 then deltaX = 300
            if deltaX < -WORLD.endOfGame then deltaX = -WORLD.endOfGame

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

            for frontDecoration in world.getFrontDecorations()
                frontDecorationPosition = frontDecoration.getPosition()
                @_layer.add new Kinetic.Image
                    image: ImageLoader.getImage frontDecoration.getImageName()
                    x: frontDecorationPosition.x + deltaX
                    y: frontDecorationPosition.y
                    width: frontDecoration.getWidth()
                    height: frontDecoration.getHeight()


            characterHeartBeat = character.getHeartBeat()
            @_layer.add new Kinetic.Text
                text: Math.round characterHeartBeat
                fontSize: 36
                fontStyle: "bold"
                fill: "white"

            @_layer.draw()


    return WorldRenderer