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
            inputController.addCharListener "UP",    @onMoveUp
            inputController.addCharListener "DOWN",  @onMoveDown
            inputController.addCharListener "LEFT",  @onMoveLeft
            inputController.addCharListener "RIGHT", @onMoveRight

        _destroyInputEvents: (inputController) ->
            inputController.removeCharListener "UP",    @onMoveUp
            inputController.removeCharListener "DOWN",  @onMoveDown
            inputController.removeCharListener "LEFT",  @onMoveLeft
            inputController.removeCharListener "RIGHT", @onMoveRight

        onMoveUp: =>
            @_character.jump()

        onMoveLeft: =>
            @_character.move "left"

        onMoveDown: =>
            @_character.crouch()

        onMoveRight: =>
            @_character.move "right"


    return SimpleScreen