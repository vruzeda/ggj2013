define [
    "kinetic"
    "sm2"
    "framework/screen"
    "model/constants"
    "model/world"
    "renderer/worldRenderer"
    "screen/gameOverScreen"
    "screen/endScreen"
], (Kinetic, SM2, Screen, Constants, World, WorldRenderer, GameOverScreen, EndScreen) ->

    {WORLD} = Constants

    class GameScreen extends Screen

        _constructLayout: ->
            @_world = new World WORLD.gravity, WORLD.width, WORLD.height
            @_worldRenderer = new WorldRenderer @_layer, @_world

            @_character = @_world.getCharacter()

            @_acumulatedTime = 0

            @_updater = new Kinetic.Animation (parameters) =>
                @_acumulatedTime += parameters.timeDiff
                if @_acumulatedTime > 30
                    @_world.update 30

                    if @_character.isCaptured()
                        @_worldRenderer.stopCharacter()
                        @_updater.stop()
                        @_game.switchScreen @, new GameOverScreen @_game

                    if @_character.isFree()
                        @_worldRenderer.stopCharacter()
                        @_updater.stop()
                        @_game.switchScreen @, new EndScreen @_game

                    @_worldRenderer.render @_world
                    @_worldRenderer.startCharacter()

                    @_acumulatedTime -= 30
            @_updater.start()

            @_onMovementRight = false
            @_onMovementLeft = false

            @_onWarmRight = false
            @_onWarmLeft = false

        _constructInputEvents: (inputController) ->
            inputController.addCharListener "UP",    @onJump
            inputController.addCharListener "DOWN",  @onCrouch
            inputController.addCharListener "LEFT",  @onMoveLeft
            inputController.addCharListener "RIGHT", @onMoveRight
            inputController.addCharListener "A",     @onCrouch
            inputController.addCharListener "S",     @onJump
            inputController.addCharListener "D",     @onWarmLeft
            inputController.addCharListener "F",     @onWarmRight

        _destroyInputEvents: (inputController) ->
            inputController.removeCharListener "UP",    @onJump
            inputController.removeCharListener "DOWN",  @onCrouch
            inputController.removeCharListener "LEFT",  @onMoveLeft
            inputController.removeCharListener "RIGHT", @onMoveRight
            inputController.removeCharListener "A",     @onCrouch
            inputController.removeCharListener "S",     @onJump
            inputController.removeCharListener "D",     @onWarmLeft
            inputController.removeCharListener "F",     @onWarmRight

        onMoveLeft: (event) =>
            if event.type == 'keyup'
                @_character.dontMoveLeft()
            else
                @_character.moveLeft()

        onMoveRight: (event) =>
            if event.type == 'keyup'
                @_character.dontMoveRight()
            else
                @_character.moveRight()

        onCrouch: (event) =>
            if event.type == 'keyup'
                @_world.raiseCharacter()
            else
                @_world.crouchCharacter()

        onJump: (event) =>
            if event.type == 'keyup'
                # @_character.stop()
            else
                @_character.jump()

        onWarmLeft: (event) =>
            if event.type == 'keyup'
                @_onWarmLeft = false
                if not @_onWarmRight
                    @_character.unwarm()

            else if not @_onWarmLeft
                @_onWarmLeft = true
                @_character.warmLeft()

        onWarmRight: (event) =>
            if event.type == 'keyup'
                @_onWarmRight = false
                if not @_onWarmLeft
                    @_character.unwarm()

            else if not @_onWarmRight
                @_onWarmRight = true
                @_character.warmRight()


    return GameScreen