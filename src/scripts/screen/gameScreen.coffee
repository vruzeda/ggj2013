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

            @_updater = new Kinetic.Animation (parameters) =>
                @_world.update parameters.timeDiff
                @_worldRenderer.render @_world
            @_updater.start()

            @_onMovementRight = false
            @_onMovementLeft = false

        _constructInputEvents: (inputController) ->
            inputController.addCharListener "LEFT",  @onMoveLeft
            inputController.addCharListener "RIGHT", @onMoveRight
            inputController.addCharListener "A",     @onCrouch
            inputController.addCharListener "S",     @onJump
            inputController.addCharListener "D",     @onWarmLeft
            inputController.addCharListener "F",     @onWarmRight

        _destroyInputEvents: (inputController) ->
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
                @_character.stop()
            else
                @_character.warmLeft()

        onWarmRight: (event) =>
            if event.type == 'keyup'
                @_character.stop()
            else
                @_character.warmRight()


    return GameScreen