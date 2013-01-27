define [
    "kinetic"
    "framework/screen"
    "model/constants"
    "model/world"
    "renderer/worldRenderer"
], (Kinetic, Screen, Constants, World, WorldRenderer) ->

    {WORLD} = Constants

    class GameScreen extends Screen

        _constructLayout: ->
            @_world = new World WORLD.gravity, WORLD.width, WORLD.height
            @_character = @_world.getCharacter()

            @_worldRenderer = new WorldRenderer @_layer

            @_acumulatedTime = 0

            @_updater = new Kinetic.Animation (parameters) =>
                @_acumulatedTime += parameters.timeDiff
                if @_acumulatedTime > 30
                    @_world.update 30
                    @_worldRenderer.render @_world
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
                @_onMovementLeft = false
                if not @_onMovementRight
                    @_character.stop()
            else
                @_onMovementLeft = true
                @_character.move "left"

        onMoveRight: (event) =>
            if event.type == 'keyup'
                @_onMovementRight = false
                if not @_onMovementLeft
                    @_character.stop()
            else
                @_onMovementRight = true
                @_character.move "right"

        onCrouch: (event) =>
            if event.type == 'keyup'
                @_character.stop()
            else
                @_character.crouch()

        onJump: (event) =>
            if event.type == 'keyup'
                @_character.stop()
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