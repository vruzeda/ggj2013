define [
    "framework/imageLoader"
    "kinetic"
    "model/constants"
], (ImageLoader, Kinetic, Constants) ->

    {GAME_RESOLUTION, WORLD, CHARACTER} = Constants

    class WorldRenderer

        constructor: (@_layer, @_world) ->
            # TODO Parallax
            @_background = @_createBackground()
            @_hud = @_createHUD()

        _createBackground: ->
            new Kinetic.Image
                image: ImageLoader.getImage "background"

        _createHUD: ->
            @_hudComponents = {}
            @_hudComponents.cardiogram1 = new Kinetic.Image
                image: ImageLoader.getImage "cardiogram1"
                x: 120
                y: 22

            # @_hudComponents.cardiogram2 = new Kinetic.Image
            #     image: ImageLoader.getImage "cardiogram2"
            #     x: 120
            #     y: 22

            @_hudComponents.display = new Kinetic.Image
                image: ImageLoader.getImage "hudDisplay"

            @_hudComponents.heartBeat = new Kinetic.Text
                x: -7
                y: 30
                width: @_hudComponents.display.getWidth()
                fontSize: 72
                fill: "white"
                align: "center"

            @_hudComponents.progressBar = new Kinetic.Image
                image: ImageLoader.getImage "progressBar"
                x: 890
                y: 22

            @_hudComponents.character = new Kinetic.Image
                image: ImageLoader.getImage "lindomar"
                y: 42

            @_hudComponents.scientist = new Kinetic.Image
                image: ImageLoader.getImage "copper"
                y: 42

            hud = new Kinetic.Group
            for hudComponentName, hudComponent of @_hudComponents
                hud.add hudComponent
            hud

        _updateHUD: ->
            window = @_world.getDecorations()[1]
            windowPosition = window.getPosition()

            character = @_world.getCharacter()
            characterPosition = character.getPosition()

            scientist = @_world.getScientist()
            scientistPosition = scientist.getPosition()

            hud = @_hudComponents
            hud.character.setX hud.progressBar.getX() + hud.progressBar.getWidth() * characterPosition.x / windowPosition.x
            hud.scientist.setX hud.progressBar.getX() + hud.progressBar.getWidth() * scientistPosition.x / windowPosition.x
            hud.heartBeat.setText Math.round character.getHeartBeat()

        render: ->
            @_layer.removeChildren()

            # TODO Parallax
            @_layer.add @_background

            character = @_world.getCharacter()
            characterPosition = character.getPosition()

            deltaX = ((GAME_RESOLUTION.width - character.getWidth()) / 2) - characterPosition.x
            if deltaX > 300 then deltaX = 300
            if deltaX < -WORLD.endOfGame then deltaX = -WORLD.endOfGame

            for decoration in @_world.getDecorations()
                decorationPosition = decoration.getPosition()

                decorationNode = decoration.getNode()
                decorationNode.setPosition x: decorationPosition.x + deltaX, y: decorationPosition.y
                @_layer.add decorationNode

            for surface in @_world.getSurfaces()
                surfacePosition = surface.getPosition()

                surfaceNode = surface.getNode()
                surfaceNode.setPosition x: surfacePosition.x + deltaX, y: surfacePosition.y
                @_layer.add surfaceNode

            characterSprite = character.getNode()
            characterSprite.setPosition x: characterPosition.x + deltaX, y: characterPosition.y
            @_layer.add characterSprite

            for frontDecoration in @_world.getFrontDecorations()
                frontDecorationPosition = frontDecoration.getPosition()

                frontDecorationNode = frontDecoration.getNode()
                frontDecorationNode.setPosition x: frontDecorationPosition.x + deltaX, y: frontDecorationPosition.y
                @_layer.add frontDecorationNode

            @_updateHUD()
            @_layer.add @_hud

            @_layer.draw()

        startCharacter: ->
            @_world.getCharacter().start()

        stopCharacter: ->
            @_world.getCharacter().stop()


    return WorldRenderer