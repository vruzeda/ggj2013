define [
    "kinetic"
    "framework/screen"
    "framework/imageLoader"
    "model/world"
], (Kinetic, Screen, ImageLoader, World) ->

    class SimpleScreen extends Screen

        _constructLayout: ->
            @_world = new World

            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage "background"

            @_character = @_world.getCharacter()
            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage @_character.getImageName()

            for surface in @_world.getSurfaces()
                @_layer.add new Kinetic.Image
                    image: ImageLoader.getImage surface.getImageName()

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