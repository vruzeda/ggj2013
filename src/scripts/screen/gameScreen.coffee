define [
    "kinetic"
    "framework/screen"
    "model/world"
    "renderer/worldRenderer"
], (Kinetic, Screen, World, WorldRenderer) ->

    class SimpleScreen extends Screen

        _constructLayout: ->
            @_world = new World

            @_worldRenderer = new WorldRenderer @_layer

            @_updater = new Kinetic.Animation (parameters) =>
                @_world.update parameters.timeDiff
                @_worldRenderer.render @_world
            @_updater.start()

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

        onMoveLeft: =>
            @_character.move "left"

        onMoveRight: =>
            @_character.move "right"

        onCrouch: =>
            @_character.crouch()

        onJump: =>
            @_character.jump()

        onWarmLeft: =>
            @_character.warmLeft()

        onWarmRight: =>
            @_character.warmRight()


    return SimpleScreen