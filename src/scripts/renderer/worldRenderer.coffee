define [
    "framework/imageLoader"
    "kinetic"
    "model/constants"
], (ImageLoader, Kinetic, Constants) ->

    {GAME_RESOLUTION, WORLD, CHARACTER} = Constants

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
                    image: decoration.getImage()
                    x: decorationPosition.x + deltaX
                    y: decorationPosition.y
                    width: decoration.getWidth()
                    height: decoration.getHeight()

            for surface in world.getSurfaces()
                surfacePosition = surface.getPosition()
                @_layer.add new Kinetic.Image
                    image: surface.getImage()
                    x: surfacePosition.x + deltaX
                    y: surfacePosition.y
                    width: surface.getWidth()
                    height: surface.getHeight()

            @_layer.add new Kinetic.Image
                image: character.getImage()
                x: characterPosition.x + deltaX
                y: characterPosition.y
                width: character.getWidth()
                height: character.getHeight()

            for frontDecoration in world.getFrontDecorations()
                frontDecorationPosition = frontDecoration.getPosition()
                @_layer.add new Kinetic.Image
                    image: frontDecoration.getImage()
                    x: frontDecorationPosition.x + deltaX
                    y: frontDecorationPosition.y
                    width: frontDecoration.getWidth()
                    height: frontDecoration.getHeight()

            hudDisplay = new Kinetic.Image
                image: ImageLoader.getImage "hudDisplay"
            hudOpacity = Math.random()
            hudOpacity = 0 if character.isHeartStoped()

            hud = new Kinetic.Group
            hud.add new Kinetic.Image
                image: ImageLoader.getImage "cardiogram1"
                x: 120
                y: 22
                opacity: hudOpacity
            hud.add new Kinetic.Image
                image: ImageLoader.getImage "cardiogram2"
                x: 120
                y: 22
                opacity: 1 - hudOpacity
            hud.add hudDisplay
            hud.add new Kinetic.Text
                text: Math.round character.getHeartBeat()
                x: -7
                y: 30
                width: hudDisplay.getWidth()
                fontSize: 72
                fill: "white"
                align: "center"
            @_layer.add hud

            @_layer.draw()


    return WorldRenderer